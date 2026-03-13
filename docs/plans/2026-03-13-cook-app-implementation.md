# Cook App Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a personal cooking guide & meal planner web app pre-loaded with 21 beginner recipes.

**Architecture:** Next.js 14 App Router with Supabase Postgres for data storage. Server components fetch data, client components handle interactivity (calendar drag-drop, grocery checklist, search/filter). No auth needed — single personal user.

**Tech Stack:** Next.js 14 (App Router), Supabase (Postgres + JS client), Tailwind CSS, shadcn/ui, TypeScript

---

### Task 1: Project Scaffolding

**Files:**
- Create: `package.json`, `tsconfig.json`, `tailwind.config.ts`, `next.config.js`, `app/layout.tsx`, `app/page.tsx`

**Step 1: Create Next.js project**

Run:
```bash
cd /home/gcpaps/dev/cook && npx create-next-app@14 . --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --use-npm
```

When prompted, accept defaults. This creates the full Next.js scaffold with TypeScript, Tailwind, ESLint, App Router, and `src/` directory.

**Step 2: Initialize shadcn/ui**

Run:
```bash
cd /home/gcpaps/dev/cook && npx shadcn@latest init -d
```

Accept defaults. This sets up `components.json`, `lib/utils.ts`, and CSS variables.

**Step 3: Install shadcn/ui components we'll need**

Run:
```bash
npx shadcn@latest add button card input select badge dialog dropdown-menu calendar checkbox separator sheet tabs
```

**Step 4: Install additional dependencies**

Run:
```bash
npm install @supabase/supabase-js @supabase/ssr date-fns lucide-react
```

- `@supabase/supabase-js` — Supabase client
- `@supabase/ssr` — Supabase SSR helpers for Next.js
- `date-fns` — Date utilities (lightweight)
- `lucide-react` — Icon library (already used by shadcn)

**Step 5: Verify the app runs**

Run:
```bash
cd /home/gcpaps/dev/cook && npm run dev
```

Expected: Dev server starts on http://localhost:3000 with the default Next.js page.

**Step 6: Commit**

```bash
git init && git add -A && git commit -m "chore: scaffold Next.js 14 project with Tailwind, shadcn/ui, and Supabase deps"
```

---

### Task 2: Supabase Setup & Database Schema

**Files:**
- Create: `src/lib/supabase/client.ts`
- Create: `src/lib/supabase/server.ts`
- Create: `.env.local` (not committed)
- Create: `supabase/schema.sql`

**Step 1: Create Supabase project**

Go to https://supabase.com/dashboard and create a new project called "cook". Note the project URL and anon key from Settings > API.

**Step 2: Create environment file**

Create `.env.local`:
```
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```

Make sure `.env.local` is in `.gitignore` (Next.js adds it by default).

**Step 3: Create the database schema**

Create `supabase/schema.sql` with the SQL to run in the Supabase SQL Editor:

```sql
-- Recipes table
CREATE TABLE recipes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  cuisine TEXT NOT NULL,
  cook_time INTEGER NOT NULL, -- in minutes
  difficulty TEXT NOT NULL DEFAULT 'Easy',
  servings TEXT NOT NULL DEFAULT '2',
  ingredients JSONB NOT NULL DEFAULT '[]',
  steps JSONB NOT NULL DEFAULT '[]',
  youtube_url TEXT,
  image_url TEXT,
  source TEXT, -- e.g. "Joshua Weissman"
  tips TEXT, -- beginner tips
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Meal plan table
CREATE TABLE meal_plan (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  date DATE NOT NULL,
  meal_type TEXT NOT NULL CHECK (meal_type IN ('lunch', 'dinner')),
  recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(date, meal_type) -- one recipe per meal slot
);

-- Grocery items table
CREATE TABLE grocery_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  quantity TEXT,
  unit TEXT,
  checked BOOLEAN DEFAULT FALSE,
  category TEXT, -- e.g. "Produce", "Protein", "Pantry"
  date_range_start DATE,
  date_range_end DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS but allow all operations (personal app, no auth)
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE meal_plan ENABLE ROW LEVEL SECURITY;
ALTER TABLE grocery_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all on recipes" ON recipes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on meal_plan" ON meal_plan FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on grocery_items" ON grocery_items FOR ALL USING (true) WITH CHECK (true);

-- Indexes for common queries
CREATE INDEX idx_meal_plan_date ON meal_plan(date);
CREATE INDEX idx_recipes_cuisine ON recipes(cuisine);
```

Run this SQL in the Supabase Dashboard > SQL Editor.

**Step 4: Create Supabase client utility (browser)**

Create `src/lib/supabase/client.ts`:

```typescript
import { createClient } from '@supabase/supabase-js'

export const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
)
```

**Step 5: Create Supabase server utility**

Create `src/lib/supabase/server.ts`:

```typescript
import { createServerClient } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function createClient() {
  const cookieStore = await cookies()

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll()
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            )
          } catch {
            // Ignored in Server Components
          }
        },
      },
    }
  )
}
```

**Step 6: Create TypeScript types**

Create `src/lib/types.ts`:

```typescript
export interface Recipe {
  id: string
  name: string
  cuisine: string
  cook_time: number
  difficulty: string
  servings: string
  ingredients: Ingredient[]
  steps: string[]
  youtube_url: string | null
  image_url: string | null
  source: string | null
  tips: string | null
  created_at: string
}

export interface Ingredient {
  name: string
  quantity: string
  unit: string
  category?: string
}

export interface MealPlan {
  id: string
  date: string
  meal_type: 'lunch' | 'dinner'
  recipe_id: string
  recipe?: Recipe
  created_at: string
}

export interface GroceryItem {
  id: string
  name: string
  quantity: string | null
  unit: string | null
  checked: boolean
  category: string | null
  date_range_start: string | null
  date_range_end: string | null
  created_at: string
}
```

**Step 7: Commit**

```bash
git add src/lib/ supabase/ && git commit -m "feat: add Supabase client setup, DB schema, and TypeScript types"
```

---

### Task 3: Seed Recipe Data

**Files:**
- Create: `supabase/seed-recipes.sql`

**Step 1: Create seed SQL file**

Create `supabase/seed-recipes.sql` containing INSERT statements for all 21 recipes from the research document at `docs/plans/2026-03-13-recipe-research.md`.

Each recipe should be inserted as:

```sql
INSERT INTO recipes (name, cuisine, cook_time, difficulty, servings, ingredients, steps, youtube_url, source, tips) VALUES
(
  'Egg Fried Rice',
  'Chinese',
  15,
  'Easy',
  '4',
  '[
    {"name": "cooked chilled white rice (day-old)", "quantity": "4", "unit": "cups", "category": "Grains"},
    {"name": "large eggs", "quantity": "3", "unit": "pcs", "category": "Protein"},
    ...
  ]'::jsonb,
  '[
    "Cook rice ahead of time. Spread on a tray and refrigerate overnight.",
    "Whisk eggs with salt. Melt butter in skillet over medium heat. Scramble eggs, chop into pieces, set aside.",
    ...
  ]'::jsonb,
  'https://www.youtube.com/watch?v=2pfPNpFIKA4',
  'Joshua Weissman',
  'Day-old rice is essential — fresh rice turns mushy.'
);
```

Convert ALL 21 recipes from the research document into this format. Use these ingredient categories: `Protein`, `Produce`, `Grains`, `Dairy`, `Pantry`, `Spices`, `Sauces`, `Other`.

**Step 2: Run seed SQL in Supabase**

Run the seed SQL in Supabase Dashboard > SQL Editor.

**Step 3: Verify data**

Run in SQL Editor:
```sql
SELECT name, cuisine, cook_time FROM recipes ORDER BY cuisine, name;
```

Expected: 21 rows returned.

**Step 4: Commit**

```bash
git add supabase/seed-recipes.sql && git commit -m "feat: add seed data for 21 beginner recipes"
```

---

### Task 4: App Layout & Navigation

**Files:**
- Modify: `src/app/layout.tsx`
- Create: `src/app/globals.css` (modify existing)
- Create: `src/components/nav.tsx`

**Step 1: Create navigation component**

Create `src/components/nav.tsx`:

```tsx
'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { UtensilsCrossed, CalendarDays, ShoppingCart, Home } from 'lucide-react'
import { cn } from '@/lib/utils'

const links = [
  { href: '/', label: 'Dashboard', icon: Home },
  { href: '/recipes', label: 'Recipes', icon: UtensilsCrossed },
  { href: '/calendar', label: 'Calendar', icon: CalendarDays },
  { href: '/grocery', label: 'Grocery', icon: ShoppingCart },
]

export function Nav() {
  const pathname = usePathname()

  return (
    <nav className="border-b bg-white">
      <div className="mx-auto flex h-14 max-w-5xl items-center gap-6 px-4">
        <Link href="/" className="text-lg font-bold">
          Cook
        </Link>
        <div className="flex gap-1">
          {links.map(({ href, label, icon: Icon }) => (
            <Link
              key={href}
              href={href}
              className={cn(
                'flex items-center gap-2 rounded-md px-3 py-2 text-sm font-medium transition-colors hover:bg-gray-100',
                pathname === href
                  ? 'bg-gray-100 text-gray-900'
                  : 'text-gray-500'
              )}
            >
              <Icon className="h-4 w-4" />
              {label}
            </Link>
          ))}
        </div>
      </div>
    </nav>
  )
}
```

**Step 2: Update root layout**

Modify `src/app/layout.tsx`:

```tsx
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { Nav } from '@/components/nav'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Cook — Personal Cooking Guide',
  description: 'Plan meals, track ingredients, and learn to cook',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Nav />
        <main className="mx-auto max-w-5xl px-4 py-6">
          {children}
        </main>
      </body>
    </html>
  )
}
```

**Step 3: Verify navigation renders**

Run: `npm run dev`
Expected: App shows "Cook" logo with Dashboard, Recipes, Calendar, Grocery nav links.

**Step 4: Commit**

```bash
git add src/components/nav.tsx src/app/layout.tsx && git commit -m "feat: add app layout with navigation bar"
```

---

### Task 5: Recipe Library Page

**Files:**
- Create: `src/app/recipes/page.tsx`
- Create: `src/components/recipe-card.tsx`
- Create: `src/components/recipe-filters.tsx`

**Step 1: Create recipe card component**

Create `src/components/recipe-card.tsx`:

```tsx
import Link from 'next/link'
import { Clock, ChefHat } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Recipe } from '@/lib/types'

export function RecipeCard({ recipe }: { recipe: Recipe }) {
  return (
    <Link href={`/recipes/${recipe.id}`}>
      <Card className="h-full transition-shadow hover:shadow-md cursor-pointer">
        <CardHeader className="pb-3">
          <div className="flex items-start justify-between gap-2">
            <CardTitle className="text-base leading-tight">
              {recipe.name}
            </CardTitle>
            <Badge variant="secondary" className="shrink-0">
              {recipe.cuisine}
            </Badge>
          </div>
        </CardHeader>
        <CardContent className="pt-0">
          <div className="flex items-center gap-4 text-sm text-muted-foreground">
            <span className="flex items-center gap-1">
              <Clock className="h-3.5 w-3.5" />
              {recipe.cook_time} min
            </span>
            <span className="flex items-center gap-1">
              <ChefHat className="h-3.5 w-3.5" />
              {recipe.difficulty}
            </span>
          </div>
          {recipe.source && (
            <p className="mt-2 text-xs text-muted-foreground">
              by {recipe.source}
            </p>
          )}
        </CardContent>
      </Card>
    </Link>
  )
}
```

**Step 2: Create recipe filters component**

Create `src/components/recipe-filters.tsx`:

```tsx
'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { Input } from '@/components/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

const cuisines = [
  'All',
  'Chinese',
  'Chinese-American',
  'Japanese',
  'Korean',
  'Thai',
  'Italian',
  'Italian-American',
  'American',
  'French/American',
  'Brazilian/Indian',
  'Indian',
  'Mediterranean',
  'Mexican',
  'Middle Eastern',
]

export function RecipeFilters() {
  const router = useRouter()
  const searchParams = useSearchParams()

  function updateParam(key: string, value: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (value && value !== 'All') {
      params.set(key, value)
    } else {
      params.delete(key)
    }
    router.push(`/recipes?${params.toString()}`)
  }

  return (
    <div className="flex flex-col gap-3 sm:flex-row">
      <Input
        placeholder="Search recipes..."
        defaultValue={searchParams.get('q') ?? ''}
        onChange={(e) => updateParam('q', e.target.value)}
        className="sm:max-w-xs"
      />
      <Select
        defaultValue={searchParams.get('cuisine') ?? 'All'}
        onValueChange={(v) => updateParam('cuisine', v)}
      >
        <SelectTrigger className="sm:w-48">
          <SelectValue placeholder="Cuisine" />
        </SelectTrigger>
        <SelectContent>
          {cuisines.map((c) => (
            <SelectItem key={c} value={c}>
              {c}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  )
}
```

**Step 3: Create recipes page (server component)**

Create `src/app/recipes/page.tsx`:

```tsx
import { createClient } from '@/lib/supabase/server'
import { RecipeCard } from '@/components/recipe-card'
import { RecipeFilters } from '@/components/recipe-filters'
import { Recipe } from '@/lib/types'

export default async function RecipesPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; cuisine?: string }>
}) {
  const { q, cuisine } = await searchParams
  const supabase = await createClient()

  let query = supabase.from('recipes').select('*').order('cuisine').order('name')

  if (cuisine) {
    query = query.eq('cuisine', cuisine)
  }

  if (q) {
    query = query.ilike('name', `%${q}%`)
  }

  const { data: recipes } = await query

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Recipes</h1>
        <p className="text-muted-foreground">
          {recipes?.length ?? 0} beginner-friendly recipes
        </p>
      </div>

      <RecipeFilters />

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {recipes?.map((recipe: Recipe) => (
          <RecipeCard key={recipe.id} recipe={recipe} />
        ))}
      </div>

      {recipes?.length === 0 && (
        <p className="text-center text-muted-foreground py-12">
          No recipes found. Try a different search.
        </p>
      )}
    </div>
  )
}
```

**Step 4: Verify recipes page**

Run: `npm run dev`, navigate to `/recipes`
Expected: Grid of recipe cards with search bar and cuisine filter.

**Step 5: Commit**

```bash
git add src/app/recipes/ src/components/recipe-card.tsx src/components/recipe-filters.tsx && git commit -m "feat: add recipe library page with search and filter"
```

---

### Task 6: Recipe Detail Page

**Files:**
- Create: `src/app/recipes/[id]/page.tsx`

**Step 1: Create recipe detail page**

Create `src/app/recipes/[id]/page.tsx`:

```tsx
import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import { Badge } from '@/components/ui/badge'
import { Separator } from '@/components/ui/separator'
import { Clock, ChefHat, Users, ArrowLeft, ExternalLink } from 'lucide-react'
import Link from 'next/link'
import { Ingredient } from '@/lib/types'

export default async function RecipeDetailPage({
  params,
}: {
  params: Promise<{ id: string }>
}) {
  const { id } = await params
  const supabase = await createClient()
  const { data: recipe } = await supabase
    .from('recipes')
    .select('*')
    .eq('id', id)
    .single()

  if (!recipe) notFound()

  const youtubeEmbedUrl = recipe.youtube_url
    ? recipe.youtube_url
        .replace('watch?v=', 'embed/')
        .replace('youtu.be/', 'www.youtube.com/embed/')
        .split('&')[0]
    : null

  return (
    <div className="space-y-6">
      <Link
        href="/recipes"
        className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground"
      >
        <ArrowLeft className="h-4 w-4" />
        Back to recipes
      </Link>

      <div>
        <div className="flex items-start justify-between gap-4">
          <h1 className="text-3xl font-bold">{recipe.name}</h1>
          <Badge variant="secondary" className="text-sm">
            {recipe.cuisine}
          </Badge>
        </div>

        <div className="mt-3 flex items-center gap-6 text-sm text-muted-foreground">
          <span className="flex items-center gap-1.5">
            <Clock className="h-4 w-4" />
            {recipe.cook_time} min
          </span>
          <span className="flex items-center gap-1.5">
            <ChefHat className="h-4 w-4" />
            {recipe.difficulty}
          </span>
          <span className="flex items-center gap-1.5">
            <Users className="h-4 w-4" />
            {recipe.servings} servings
          </span>
        </div>

        {recipe.source && (
          <p className="mt-2 text-sm text-muted-foreground">
            Recipe by <span className="font-medium">{recipe.source}</span>
          </p>
        )}
      </div>

      {/* YouTube Video */}
      {youtubeEmbedUrl && (
        <div className="aspect-video overflow-hidden rounded-lg border">
          <iframe
            src={youtubeEmbedUrl}
            title={recipe.name}
            className="h-full w-full"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
          />
        </div>
      )}

      {recipe.youtube_url && (
        <a
          href={recipe.youtube_url}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-1.5 text-sm text-blue-600 hover:underline"
        >
          <ExternalLink className="h-3.5 w-3.5" />
          Open on YouTube
        </a>
      )}

      <Separator />

      {/* Ingredients */}
      <div>
        <h2 className="text-xl font-semibold mb-3">Ingredients</h2>
        <ul className="space-y-2">
          {(recipe.ingredients as Ingredient[]).map(
            (ing: Ingredient, i: number) => (
              <li key={i} className="flex items-baseline gap-2 text-sm">
                <span className="font-medium shrink-0">
                  {ing.quantity} {ing.unit}
                </span>
                <span>{ing.name}</span>
              </li>
            )
          )}
        </ul>
      </div>

      <Separator />

      {/* Steps */}
      <div>
        <h2 className="text-xl font-semibold mb-3">Instructions</h2>
        <ol className="space-y-4">
          {(recipe.steps as string[]).map((step: string, i: number) => (
            <li key={i} className="flex gap-3 text-sm">
              <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-gray-100 text-xs font-medium">
                {i + 1}
              </span>
              <span className="pt-0.5">{step}</span>
            </li>
          ))}
        </ol>
      </div>

      {/* Tips */}
      {recipe.tips && (
        <>
          <Separator />
          <div className="rounded-lg bg-amber-50 border border-amber-200 p-4">
            <h3 className="text-sm font-semibold text-amber-800 mb-1">
              Beginner Tip
            </h3>
            <p className="text-sm text-amber-700">{recipe.tips}</p>
          </div>
        </>
      )}
    </div>
  )
}
```

**Step 2: Verify recipe detail page**

Run: `npm run dev`, click on any recipe card
Expected: Full recipe page with embedded YouTube video, ingredients list, numbered steps, and beginner tip.

**Step 3: Commit**

```bash
git add src/app/recipes/ && git commit -m "feat: add recipe detail page with video embed, ingredients, and steps"
```

---

### Task 7: Meal Calendar Page

**Files:**
- Create: `src/app/calendar/page.tsx`
- Create: `src/components/meal-calendar.tsx`
- Create: `src/components/add-meal-dialog.tsx`
- Create: `src/app/api/meal-plan/route.ts`

**Step 1: Create meal plan API route**

Create `src/app/api/meal-plan/route.ts`:

```typescript
import { supabase } from '@/lib/supabase/client'
import { NextRequest, NextResponse } from 'next/server'

export async function POST(request: NextRequest) {
  const body = await request.json()
  const { date, meal_type, recipe_id } = body

  // Upsert: replace existing meal for that slot
  const { data, error } = await supabase
    .from('meal_plan')
    .upsert(
      { date, meal_type, recipe_id },
      { onConflict: 'date,meal_type' }
    )
    .select()

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json(data)
}

export async function DELETE(request: NextRequest) {
  const { searchParams } = new URL(request.url)
  const id = searchParams.get('id')

  if (!id) return NextResponse.json({ error: 'Missing id' }, { status: 400 })

  const { error } = await supabase.from('meal_plan').delete().eq('id', id)

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json({ success: true })
}
```

**Step 2: Create add-meal dialog component**

Create `src/components/add-meal-dialog.tsx`:

```tsx
'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { supabase } from '@/lib/supabase/client'
import { Recipe } from '@/lib/types'

interface AddMealDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  date: string // YYYY-MM-DD
  mealType: 'lunch' | 'dinner'
}

export function AddMealDialog({
  open,
  onOpenChange,
  date,
  mealType,
}: AddMealDialogProps) {
  const router = useRouter()
  const [recipes, setRecipes] = useState<Recipe[]>([])
  const [search, setSearch] = useState('')

  useEffect(() => {
    if (open) {
      supabase
        .from('recipes')
        .select('*')
        .order('name')
        .then(({ data }) => setRecipes(data ?? []))
    }
  }, [open])

  const filtered = recipes.filter((r) =>
    r.name.toLowerCase().includes(search.toLowerCase())
  )

  async function selectRecipe(recipeId: string) {
    await fetch('/api/meal-plan', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ date, meal_type: mealType, recipe_id: recipeId }),
    })
    onOpenChange(false)
    setSearch('')
    router.refresh()
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-h-[80vh] overflow-hidden flex flex-col">
        <DialogHeader>
          <DialogTitle>
            Add {mealType} for {date}
          </DialogTitle>
        </DialogHeader>
        <Input
          placeholder="Search recipes..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
        <div className="overflow-y-auto flex-1 space-y-1 mt-2">
          {filtered.map((recipe) => (
            <button
              key={recipe.id}
              onClick={() => selectRecipe(recipe.id)}
              className="w-full text-left rounded-md px-3 py-2 text-sm hover:bg-gray-100 transition-colors"
            >
              <span className="font-medium">{recipe.name}</span>
              <span className="text-muted-foreground ml-2">
                {recipe.cuisine} · {recipe.cook_time} min
              </span>
            </button>
          ))}
        </div>
      </DialogContent>
    </Dialog>
  )
}
```

**Step 3: Create meal calendar component**

Create `src/components/meal-calendar.tsx`:

```tsx
'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import {
  format,
  startOfWeek,
  addDays,
  addWeeks,
  subWeeks,
  isSameDay,
} from 'date-fns'
import { Button } from '@/components/ui/button'
import { ChevronLeft, ChevronRight, Plus, X } from 'lucide-react'
import { AddMealDialog } from './add-meal-dialog'
import { MealPlan } from '@/lib/types'
import Link from 'next/link'

interface MealCalendarProps {
  mealPlans: MealPlan[]
}

export function MealCalendar({ mealPlans }: MealCalendarProps) {
  const router = useRouter()
  const [currentDate, setCurrentDate] = useState(new Date())
  const [dialogOpen, setDialogOpen] = useState(false)
  const [selectedSlot, setSelectedSlot] = useState<{
    date: string
    mealType: 'lunch' | 'dinner'
  } | null>(null)

  const weekStart = startOfWeek(currentDate, { weekStartsOn: 1 }) // Monday
  const days = Array.from({ length: 7 }, (_, i) => addDays(weekStart, i))

  function getMeal(date: Date, mealType: string) {
    const dateStr = format(date, 'yyyy-MM-dd')
    return mealPlans.find(
      (mp) => mp.date === dateStr && mp.meal_type === mealType
    )
  }

  function openAddDialog(date: Date, mealType: 'lunch' | 'dinner') {
    setSelectedSlot({ date: format(date, 'yyyy-MM-dd'), mealType })
    setDialogOpen(true)
  }

  async function removeMeal(id: string) {
    await fetch(`/api/meal-plan?id=${id}`, { method: 'DELETE' })
    router.refresh()
  }

  return (
    <>
      <div className="flex items-center justify-between mb-4">
        <Button
          variant="outline"
          size="icon"
          onClick={() => setCurrentDate(subWeeks(currentDate, 1))}
        >
          <ChevronLeft className="h-4 w-4" />
        </Button>
        <h2 className="text-lg font-semibold">
          Week of {format(weekStart, 'MMM d, yyyy')}
        </h2>
        <Button
          variant="outline"
          size="icon"
          onClick={() => setCurrentDate(addWeeks(currentDate, 1))}
        >
          <ChevronRight className="h-4 w-4" />
        </Button>
      </div>

      <div className="grid grid-cols-7 gap-2">
        {days.map((day) => {
          const isToday = isSameDay(day, new Date())
          return (
            <div
              key={day.toISOString()}
              className={`rounded-lg border p-2 min-h-[160px] ${
                isToday ? 'border-blue-400 bg-blue-50/50' : ''
              }`}
            >
              <div className="text-xs font-medium text-muted-foreground mb-2">
                {format(day, 'EEE')}
                <span className={`ml-1 ${isToday ? 'text-blue-600 font-bold' : ''}`}>
                  {format(day, 'd')}
                </span>
              </div>

              {(['lunch', 'dinner'] as const).map((mealType) => {
                const meal = getMeal(day, mealType)
                return (
                  <div key={mealType} className="mb-1.5">
                    <span className="text-[10px] uppercase tracking-wide text-muted-foreground">
                      {mealType}
                    </span>
                    {meal?.recipe ? (
                      <div className="group flex items-start gap-1 rounded bg-gray-50 p-1.5 text-xs">
                        <Link
                          href={`/recipes/${meal.recipe_id}`}
                          className="flex-1 hover:underline font-medium leading-tight"
                        >
                          {meal.recipe.name}
                        </Link>
                        <button
                          onClick={() => removeMeal(meal.id)}
                          className="opacity-0 group-hover:opacity-100 transition-opacity shrink-0"
                        >
                          <X className="h-3 w-3 text-muted-foreground hover:text-red-500" />
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => openAddDialog(day, mealType)}
                        className="flex w-full items-center justify-center rounded border border-dashed p-1.5 text-xs text-muted-foreground hover:border-gray-400 hover:text-gray-600 transition-colors"
                      >
                        <Plus className="h-3 w-3 mr-0.5" />
                        Add
                      </button>
                    )}
                  </div>
                )
              })}
            </div>
          )
        })}
      </div>

      {selectedSlot && (
        <AddMealDialog
          open={dialogOpen}
          onOpenChange={setDialogOpen}
          date={selectedSlot.date}
          mealType={selectedSlot.mealType}
        />
      )}
    </>
  )
}
```

**Step 4: Create calendar page (server component)**

Create `src/app/calendar/page.tsx`:

```tsx
import { createClient } from '@/lib/supabase/server'
import { MealCalendar } from '@/components/meal-calendar'

export default async function CalendarPage() {
  const supabase = await createClient()

  const { data: mealPlans } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(*)')
    .order('date')

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Meal Calendar</h1>
        <p className="text-muted-foreground">
          Plan your lunch and dinner for the week
        </p>
      </div>
      <MealCalendar mealPlans={mealPlans ?? []} />
    </div>
  )
}
```

**Step 5: Verify calendar page**

Run: `npm run dev`, navigate to `/calendar`
Expected: Weekly calendar with lunch/dinner slots for each day. Click "Add" to open recipe picker dialog.

**Step 6: Commit**

```bash
git add src/app/calendar/ src/app/api/meal-plan/ src/components/meal-calendar.tsx src/components/add-meal-dialog.tsx && git commit -m "feat: add meal calendar with weekly view and recipe picker"
```

---

### Task 8: Grocery List Page

**Files:**
- Create: `src/app/grocery/page.tsx`
- Create: `src/components/grocery-list.tsx`
- Create: `src/app/api/grocery/route.ts`

**Step 1: Create grocery API route**

Create `src/app/api/grocery/route.ts`:

```typescript
import { supabase } from '@/lib/supabase/client'
import { NextRequest, NextResponse } from 'next/server'

export async function POST(request: NextRequest) {
  const { items, dateStart, dateEnd } = await request.json()

  // Clear existing items for this date range
  await supabase
    .from('grocery_items')
    .delete()
    .eq('date_range_start', dateStart)
    .eq('date_range_end', dateEnd)

  // Insert new items
  const rows = items.map((item: { name: string; quantity: string; unit: string; category: string }) => ({
    name: item.name,
    quantity: item.quantity,
    unit: item.unit,
    category: item.category,
    checked: false,
    date_range_start: dateStart,
    date_range_end: dateEnd,
  }))

  const { data, error } = await supabase.from('grocery_items').insert(rows).select()

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json(data)
}

export async function PATCH(request: NextRequest) {
  const { id, checked } = await request.json()
  const { error } = await supabase
    .from('grocery_items')
    .update({ checked })
    .eq('id', id)

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json({ success: true })
}
```

**Step 2: Create grocery list component**

Create `src/components/grocery-list.tsx`:

```tsx
'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { format, startOfWeek, endOfWeek } from 'date-fns'
import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { Separator } from '@/components/ui/separator'
import { ShoppingCart, RefreshCw } from 'lucide-react'
import { GroceryItem, MealPlan, Ingredient } from '@/lib/types'

interface GroceryListProps {
  groceryItems: GroceryItem[]
  mealPlans: MealPlan[]
}

export function GroceryList({ groceryItems, mealPlans }: GroceryListProps) {
  const router = useRouter()
  const [generating, setGenerating] = useState(false)

  const weekStart = format(startOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')
  const weekEnd = format(endOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')

  // Filter items for current week
  const currentItems = groceryItems.filter(
    (item) => item.date_range_start === weekStart && item.date_range_end === weekEnd
  )

  // Group by category
  const grouped = currentItems.reduce<Record<string, GroceryItem[]>>((acc, item) => {
    const cat = item.category ?? 'Other'
    if (!acc[cat]) acc[cat] = []
    acc[cat].push(item)
    return acc
  }, {})

  const categoryOrder = ['Protein', 'Produce', 'Dairy', 'Grains', 'Sauces', 'Spices', 'Pantry', 'Other']
  const sortedCategories = Object.keys(grouped).sort(
    (a, b) => categoryOrder.indexOf(a) - categoryOrder.indexOf(b)
  )

  async function generateList() {
    setGenerating(true)

    // Get this week's meal plans
    const weekMeals = mealPlans.filter(
      (mp) => mp.date >= weekStart && mp.date <= weekEnd && mp.recipe
    )

    // Aggregate ingredients
    const ingredientMap = new Map<string, { quantity: string; unit: string; category: string }>()

    for (const meal of weekMeals) {
      if (!meal.recipe) continue
      const ingredients = meal.recipe.ingredients as Ingredient[]
      for (const ing of ingredients) {
        const key = `${ing.name.toLowerCase()}-${ing.unit}`
        if (ingredientMap.has(key)) {
          // Simple: just keep the first quantity (combining quantities properly is complex)
          continue
        }
        ingredientMap.set(key, {
          quantity: ing.quantity,
          unit: ing.unit,
          category: ing.category ?? 'Other',
        })
      }
    }

    const items = Array.from(ingredientMap.entries()).map(([key, val]) => ({
      name: key.split('-')[0],
      quantity: val.quantity,
      unit: val.unit,
      category: val.category,
    }))

    await fetch('/api/grocery', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ items, dateStart: weekStart, dateEnd: weekEnd }),
    })

    setGenerating(false)
    router.refresh()
  }

  async function toggleItem(id: string, checked: boolean) {
    await fetch('/api/grocery', {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ id, checked }),
    })
    router.refresh()
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <p className="text-sm text-muted-foreground">
          Week of {format(new Date(weekStart), 'MMM d')} – {format(new Date(weekEnd), 'MMM d, yyyy')}
        </p>
        <Button onClick={generateList} disabled={generating} size="sm">
          <RefreshCw className={`h-4 w-4 mr-2 ${generating ? 'animate-spin' : ''}`} />
          {currentItems.length > 0 ? 'Regenerate' : 'Generate'} List
        </Button>
      </div>

      {currentItems.length === 0 ? (
        <div className="text-center py-12 text-muted-foreground">
          <ShoppingCart className="h-12 w-12 mx-auto mb-3 opacity-30" />
          <p>No grocery list yet.</p>
          <p className="text-sm">Plan some meals on the calendar, then generate your list.</p>
        </div>
      ) : (
        <div className="space-y-6">
          {sortedCategories.map((category) => (
            <div key={category}>
              <h3 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide mb-2">
                {category}
              </h3>
              <div className="space-y-1">
                {grouped[category].map((item) => (
                  <label
                    key={item.id}
                    className="flex items-center gap-3 rounded-md px-3 py-2 hover:bg-gray-50 cursor-pointer"
                  >
                    <Checkbox
                      checked={item.checked}
                      onCheckedChange={(checked) =>
                        toggleItem(item.id, checked as boolean)
                      }
                    />
                    <span
                      className={`text-sm flex-1 ${
                        item.checked ? 'line-through text-muted-foreground' : ''
                      }`}
                    >
                      {item.quantity} {item.unit} {item.name}
                    </span>
                  </label>
                ))}
              </div>
              <Separator className="mt-3" />
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
```

**Step 3: Create grocery page (server component)**

Create `src/app/grocery/page.tsx`:

```tsx
import { createClient } from '@/lib/supabase/server'
import { GroceryList } from '@/components/grocery-list'

export default async function GroceryPage() {
  const supabase = await createClient()

  const { data: groceryItems } = await supabase
    .from('grocery_items')
    .select('*')
    .order('category')
    .order('name')

  const { data: mealPlans } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(*)')
    .order('date')

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Grocery List</h1>
        <p className="text-muted-foreground">
          Auto-generated from your meal plan
        </p>
      </div>
      <GroceryList
        groceryItems={groceryItems ?? []}
        mealPlans={mealPlans ?? []}
      />
    </div>
  )
}
```

**Step 4: Verify grocery page**

Run: `npm run dev`, navigate to `/grocery`
Expected: Empty state with "Generate List" button. After planning meals on calendar, clicking generate creates a categorized grocery list with checkboxes.

**Step 5: Commit**

```bash
git add src/app/grocery/ src/app/api/grocery/ src/components/grocery-list.tsx && git commit -m "feat: add grocery list page with auto-generation from meal plan"
```

---

### Task 9: Dashboard Page

**Files:**
- Modify: `src/app/page.tsx`

**Step 1: Create dashboard page**

Replace `src/app/page.tsx`:

```tsx
import { createClient } from '@/lib/supabase/server'
import { format, startOfWeek, endOfWeek, addDays } from 'date-fns'
import Link from 'next/link'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { CalendarDays, UtensilsCrossed, ShoppingCart, ArrowRight } from 'lucide-react'
import { MealPlan } from '@/lib/types'

export default async function DashboardPage() {
  const supabase = await createClient()

  const weekStart = format(startOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')
  const weekEnd = format(endOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')
  const today = format(new Date(), 'yyyy-MM-dd')

  const { data: weekMeals } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(name, cuisine, cook_time)')
    .gte('date', weekStart)
    .lte('date', weekEnd)
    .order('date')

  const { data: recipes } = await supabase
    .from('recipes')
    .select('id', { count: 'exact' })

  const todayMeals = (weekMeals ?? []).filter((m: MealPlan) => m.date === today)
  const plannedDays = new Set((weekMeals ?? []).map((m: MealPlan) => m.date)).size

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Dashboard</h1>
        <p className="text-muted-foreground">
          {format(new Date(), 'EEEE, MMMM d, yyyy')}
        </p>
      </div>

      {/* Quick stats */}
      <div className="grid gap-4 sm:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Recipes</CardTitle>
            <UtensilsCrossed className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{recipes?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">in your library</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">This Week</CardTitle>
            <CalendarDays className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{weekMeals?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">
              meals planned across {plannedDays} days
            </p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Today</CardTitle>
            <ShoppingCart className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{todayMeals.length}</div>
            <p className="text-xs text-muted-foreground">meals planned</p>
          </CardContent>
        </Card>
      </div>

      {/* Today's meals */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold">Today&apos;s Meals</h2>
          <Link href="/calendar">
            <Button variant="ghost" size="sm">
              View calendar
              <ArrowRight className="h-4 w-4 ml-1" />
            </Button>
          </Link>
        </div>
        {todayMeals.length === 0 ? (
          <Card>
            <CardContent className="py-8 text-center text-muted-foreground">
              <p>No meals planned for today.</p>
              <Link href="/calendar">
                <Button variant="link" className="mt-1">
                  Plan something
                </Button>
              </Link>
            </CardContent>
          </Card>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2">
            {todayMeals.map((meal: MealPlan) => (
              <Link key={meal.id} href={`/recipes/${meal.recipe_id}`}>
                <Card className="hover:shadow-md transition-shadow cursor-pointer">
                  <CardContent className="pt-4">
                    <p className="text-xs uppercase tracking-wide text-muted-foreground mb-1">
                      {meal.meal_type}
                    </p>
                    <p className="font-semibold">{meal.recipe?.name}</p>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        )}
      </div>

      {/* This week overview */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold">This Week</h2>
        </div>
        <div className="grid grid-cols-7 gap-2">
          {Array.from({ length: 7 }, (_, i) => {
            const day = addDays(new Date(weekStart), i)
            const dateStr = format(day, 'yyyy-MM-dd')
            const dayMeals = (weekMeals ?? []).filter(
              (m: MealPlan) => m.date === dateStr
            )
            const isToday = dateStr === today

            return (
              <div
                key={dateStr}
                className={`rounded-lg border p-2 text-center ${
                  isToday ? 'border-blue-400 bg-blue-50/50' : ''
                }`}
              >
                <p className="text-xs font-medium text-muted-foreground">
                  {format(day, 'EEE')}
                </p>
                <p className={`text-lg font-bold ${isToday ? 'text-blue-600' : ''}`}>
                  {format(day, 'd')}
                </p>
                <p className="text-xs text-muted-foreground">
                  {dayMeals.length > 0
                    ? `${dayMeals.length} meal${dayMeals.length > 1 ? 's' : ''}`
                    : '—'}
                </p>
              </div>
            )
          })}
        </div>
      </div>

      {/* Quick links */}
      <div className="flex gap-3">
        <Link href="/recipes">
          <Button variant="outline">
            <UtensilsCrossed className="h-4 w-4 mr-2" />
            Browse Recipes
          </Button>
        </Link>
        <Link href="/grocery">
          <Button variant="outline">
            <ShoppingCart className="h-4 w-4 mr-2" />
            Grocery List
          </Button>
        </Link>
      </div>
    </div>
  )
}
```

**Step 2: Verify dashboard**

Run: `npm run dev`, navigate to `/`
Expected: Dashboard with stats cards, today's meals, weekly overview grid, and quick links.

**Step 3: Commit**

```bash
git add src/app/page.tsx && git commit -m "feat: add dashboard with today's meals and weekly overview"
```

---

### Task 10: Final Polish & Testing

**Step 1: Run lint and type check**

Run:
```bash
npm run lint && npx tsc --noEmit
```

Fix any errors.

**Step 2: Test the full flow**

1. `/recipes` — Browse, search, filter recipes
2. `/recipes/[id]` — View recipe detail with YouTube embed
3. `/calendar` — Add lunch/dinner to days, remove meals
4. `/grocery` — Generate grocery list from this week's plan, check off items
5. `/` — Dashboard shows today's meals and weekly overview

**Step 3: Final commit**

```bash
git add -A && git commit -m "chore: final polish and fixes"
```
