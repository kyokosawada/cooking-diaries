# Cooking Diary — Warm & Handwritten Redesign

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Reskin the entire Cooking Diaries app with a warm, handwritten journal aesthetic, and rebrand from "Cook" to "Cooking Diary".

**Architecture:** Pure frontend reskin — no data model or API changes. Replace the existing grayscale/Inter design with Caveat + Lora fonts, warm cream/terracotta/sage color palette, and notebook-like textures. All shadcn/ui components keep their underlying Radix primitives but get new CSS variable values.

**Tech Stack:** Next.js 14 (App Router), Tailwind CSS v3, shadcn/ui (restyled via CSS variables), Google Fonts (Caveat, Lora)

---

### Task 1: Design System Foundation — CSS Variables & Fonts

**Files:**
- Modify: `src/app/globals.css`
- Modify: `src/app/layout.tsx`
- Modify: `tailwind.config.ts`

**Step 1: Update `globals.css` with warm palette**

Replace the entire `:root` block with warm-themed HSL values and add a notebook texture background. Replace the `.dark` block with a corresponding dark warm palette.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    /* Cream base */
    --background: 37 60% 96%;
    --foreground: 20 28% 20%;
    /* Cards: slightly warmer white */
    --card: 37 50% 97%;
    --card-foreground: 20 28% 20%;
    --popover: 37 50% 97%;
    --popover-foreground: 20 28% 20%;
    /* Terracotta primary */
    --primary: 15 52% 53%;
    --primary-foreground: 37 60% 96%;
    /* Sage secondary */
    --secondary: 105 24% 85%;
    --secondary-foreground: 20 28% 25%;
    /* Muted: warm gray */
    --muted: 30 15% 91%;
    --muted-foreground: 20 15% 45%;
    /* Sage accent */
    --accent: 105 24% 85%;
    --accent-foreground: 105 25% 30%;
    /* Destructive stays red-ish */
    --destructive: 0 60% 50%;
    --destructive-foreground: 37 60% 96%;
    /* Warm borders */
    --border: 30 20% 85%;
    --input: 30 20% 85%;
    --ring: 15 52% 53%;
    /* Chart colors — warm tones */
    --chart-1: 15 52% 53%;
    --chart-2: 105 25% 56%;
    --chart-3: 20 28% 26%;
    --chart-4: 40 70% 55%;
    --chart-5: 30 60% 50%;
    --radius: 0.75rem;
  }

  .dark {
    --background: 20 20% 8%;
    --foreground: 37 30% 90%;
    --card: 20 18% 12%;
    --card-foreground: 37 30% 90%;
    --popover: 20 18% 12%;
    --popover-foreground: 37 30% 90%;
    --primary: 15 52% 53%;
    --primary-foreground: 37 60% 96%;
    --secondary: 105 15% 20%;
    --secondary-foreground: 105 20% 75%;
    --muted: 20 12% 18%;
    --muted-foreground: 30 15% 55%;
    --accent: 105 15% 20%;
    --accent-foreground: 105 20% 75%;
    --destructive: 0 50% 40%;
    --destructive-foreground: 37 60% 96%;
    --border: 20 12% 18%;
    --input: 20 12% 18%;
    --ring: 15 52% 53%;
    --chart-1: 15 52% 53%;
    --chart-2: 105 25% 56%;
    --chart-3: 40 70% 55%;
    --chart-4: 30 60% 50%;
    --chart-5: 0 50% 55%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
    background-image:
      repeating-linear-gradient(
        transparent,
        transparent 31px,
        hsl(20 28% 20% / 0.03) 31px,
        hsl(20 28% 20% / 0.03) 32px
      );
  }
}
```

**Step 2: Update `layout.tsx` with Caveat + Lora fonts and new branding**

```tsx
import type { Metadata } from 'next'
import { Caveat, Lora } from 'next/font/google'
import './globals.css'
import { Nav } from '@/components/nav'

const caveat = Caveat({ subsets: ['latin'], weight: ['400', '700'], variable: '--font-caveat' })
const lora = Lora({ subsets: ['latin'], weight: ['400', '500', '600', '700'], variable: '--font-lora' })

export const metadata: Metadata = {
  title: 'Cooking Diary — Personal Cooking Guide',
  description: 'Your personal recipe journal, meal planner, and grocery list',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={`${caveat.variable} ${lora.variable} font-serif`}>
        <Nav />
        <main className="mx-auto max-w-5xl px-4 py-6">
          {children}
        </main>
      </body>
    </html>
  )
}
```

**Step 3: Update `tailwind.config.ts` to add font families**

Add `fontFamily` entries to the theme extension:

```ts
// Inside theme.extend, add:
fontFamily: {
  display: ['var(--font-caveat)', 'cursive'],
  serif: ['var(--font-lora)', 'Georgia', 'serif'],
},
```

Also update `--radius` default in the config is fine as-is (CSS variables handle it).

**Step 4: Verify**

Run: `npm run dev` (should already be running on 3001)
Check: Visit http://localhost:3001 — the background should be cream with faint ruled lines, text should be in Lora, colors should be warm.

**Step 5: Commit**

```bash
git add src/app/globals.css src/app/layout.tsx tailwind.config.ts
git commit -m "feat: warm handwritten design system — Caveat + Lora fonts, cream/terracotta/sage palette"
```

---

### Task 2: Navigation — Handwritten Branding

**Files:**
- Modify: `src/components/nav.tsx`

**Step 1: Restyle the nav**

Replace the nav with warm journal styling. "Cooking Diary" in Caveat font, warm link colors with terracotta active underline.

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
    <nav className="border-b-2 border-border/50 bg-card">
      <div className="mx-auto flex h-14 max-w-5xl items-center justify-between px-4 sm:justify-start sm:gap-6">
        <Link href="/" className="font-display text-2xl font-bold text-primary">
          Cooking Diary
        </Link>
        <div className="flex gap-1">
          {links.map(({ href, label, icon: Icon }) => (
            <Link
              key={href}
              href={href}
              className={cn(
                'flex items-center gap-2 rounded-lg px-2 py-2 text-sm font-medium transition-colors hover:bg-accent sm:px-3',
                pathname === href
                  ? 'bg-accent text-primary'
                  : 'text-muted-foreground'
              )}
            >
              <Icon className="h-4 w-4" />
              <span className="hidden sm:inline">{label}</span>
            </Link>
          ))}
        </div>
      </div>
    </nav>
  )
}
```

**Step 2: Verify**

Check: Nav shows "Cooking Diary" in handwriting font. Active link has terracotta text. Hover shows warm sage accent background.

**Step 3: Commit**

```bash
git add src/components/nav.tsx
git commit -m "feat: restyle nav with Cooking Diary branding and warm colors"
```

---

### Task 3: Dashboard Page

**Files:**
- Modify: `src/app/page.tsx`

**Step 1: Restyle the dashboard**

Apply warm styling: Caveat headings, warm stat cards, terracotta today highlights (replacing blue), journal-style sections.

Key changes:
- Page title: `font-display text-3xl` (Caveat)
- Stat card icons: use `text-primary` (terracotta) instead of `text-muted-foreground`
- Today highlight: `border-primary bg-primary/5` instead of `border-blue-400 bg-blue-50/50`
- Today text: `text-primary` instead of `text-blue-600`
- Section headings: `font-display text-xl`
- Quick action buttons: `variant="outline"` with warm border (automatic from CSS vars)
- Today's meals meal-type label: `text-primary` with `uppercase tracking-wide`
- Empty state: warm message tone

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
        <h1 className="font-display text-3xl font-bold text-foreground">Dashboard</h1>
        <p className="text-muted-foreground">
          {format(new Date(), 'EEEE, MMMM d, yyyy')}
        </p>
      </div>

      {/* Quick stats */}
      <div className="grid gap-4 sm:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Recipes</CardTitle>
            <UtensilsCrossed className="h-4 w-4 text-primary" />
          </CardHeader>
          <CardContent>
            <div className="font-display text-3xl font-bold">{recipes?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">in your collection</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">This Week</CardTitle>
            <CalendarDays className="h-4 w-4 text-primary" />
          </CardHeader>
          <CardContent>
            <div className="font-display text-3xl font-bold">{weekMeals?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">
              meals planned across {plannedDays} days
            </p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Today</CardTitle>
            <ShoppingCart className="h-4 w-4 text-primary" />
          </CardHeader>
          <CardContent>
            <div className="font-display text-3xl font-bold">{todayMeals.length}</div>
            <p className="text-xs text-muted-foreground">meals planned</p>
          </CardContent>
        </Card>
      </div>

      {/* Today's meals */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="font-display text-xl font-bold">Today&apos;s Meals</h2>
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
              <p>Nothing planned for today yet.</p>
              <Link href="/calendar">
                <Button variant="link" className="mt-1 text-primary">
                  Plan something
                </Button>
              </Link>
            </CardContent>
          </Card>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2">
            {todayMeals.map((meal: MealPlan) => (
              <Link key={meal.id} href={`/recipes/${meal.recipe_id}`}>
                <Card className="hover:shadow-md transition-shadow cursor-pointer hover:border-primary/30">
                  <CardContent className="pt-4">
                    <p className="text-xs uppercase tracking-wide text-primary font-semibold mb-1">
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
          <h2 className="font-display text-xl font-bold">This Week</h2>
        </div>
        <div className="grid grid-cols-4 gap-2 sm:grid-cols-7">
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
                className={`rounded-xl border p-2 text-center ${
                  isToday ? 'border-primary bg-primary/5' : ''
                }`}
              >
                <p className="text-xs font-medium text-muted-foreground">
                  {format(day, 'EEE')}
                </p>
                <p className={`font-display text-xl font-bold ${isToday ? 'text-primary' : ''}`}>
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

**Step 2: Verify**

Check: Dashboard has Caveat headings, stat numbers in handwriting font, terracotta icons and today highlights, warm card backgrounds.

**Step 3: Commit**

```bash
git add src/app/page.tsx
git commit -m "feat: restyle dashboard with warm handwritten aesthetic"
```

---

### Task 4: Recipe Card

**Files:**
- Modify: `src/components/recipe-card.tsx`

**Step 1: Restyle the recipe card**

Journal-entry style card with Caveat title, warm hover effects, and sage cuisine badge.

```tsx
import Link from 'next/link'
import { Clock, ChefHat } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Recipe } from '@/lib/types'

export function RecipeCard({ recipe }: { recipe: Recipe }) {
  return (
    <Link href={`/recipes/${recipe.id}`}>
      <Card className="h-full transition-all hover:shadow-md hover:border-primary/30 cursor-pointer">
        <CardHeader className="pb-3">
          <div className="flex items-start justify-between gap-2">
            <CardTitle className="font-display text-xl leading-tight">
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
            <p className="mt-2 text-xs text-muted-foreground italic">
              by {recipe.source}
            </p>
          )}
        </CardContent>
      </Card>
    </Link>
  )
}
```

**Step 2: Verify**

Check: Recipe cards have handwriting titles, warm hover borders, sage-toned cuisine badges.

**Step 3: Commit**

```bash
git add src/components/recipe-card.tsx
git commit -m "feat: restyle recipe card with handwritten title and warm accents"
```

---

### Task 5: Recipe Filters

**Files:**
- Modify: `src/components/recipe-filters.tsx`

**Step 1: Restyle filters**

Minimal change needed — the Input and Select components inherit from shadcn/ui which now uses warm CSS variables. Just add warm placeholder text.

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
        placeholder="Search your recipes..."
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

**Step 2: Commit**

```bash
git add src/components/recipe-filters.tsx
git commit -m "feat: warm styling for recipe search filters"
```

---

### Task 6: Recipes Page

**Files:**
- Modify: `src/app/recipes/page.tsx`

**Step 1: Add Caveat heading**

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
        <h1 className="font-display text-3xl font-bold">Recipes</h1>
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

**Step 2: Commit**

```bash
git add src/app/recipes/page.tsx
git commit -m "feat: warm handwritten heading for recipes page"
```

---

### Task 7: Recipe Detail Page

**Files:**
- Modify: `src/app/recipes/[id]/page.tsx`

**Step 1: Restyle recipe detail**

Key changes:
- Title: `font-display text-4xl` (Caveat)
- Section headings: `font-display text-2xl`
- Step numbers: `bg-primary/10 text-primary` instead of `bg-gray-100`
- Tips: keep amber theme (it's warm and fits the palette)
- YouTube link: `text-primary` instead of `text-blue-600`
- Ingredients: add warm styling

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
        className="inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-primary"
      >
        <ArrowLeft className="h-4 w-4" />
        Back to recipes
      </Link>

      <div>
        <div className="flex items-start justify-between gap-4">
          <h1 className="font-display text-4xl font-bold">{recipe.name}</h1>
          <Badge variant="secondary" className="text-sm shrink-0">
            {recipe.cuisine}
          </Badge>
        </div>

        <div className="mt-3 flex flex-wrap items-center gap-4 sm:gap-6 text-sm text-muted-foreground">
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
          <p className="mt-2 text-sm text-muted-foreground italic">
            Recipe by <span className="font-medium">{recipe.source}</span>
          </p>
        )}
      </div>

      {/* YouTube Video */}
      {youtubeEmbedUrl && (
        <div className="aspect-video overflow-hidden rounded-xl border">
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
          className="inline-flex items-center gap-1.5 text-sm text-primary hover:underline"
        >
          <ExternalLink className="h-3.5 w-3.5" />
          Open on YouTube
        </a>
      )}

      <Separator />

      {/* Ingredients */}
      <div>
        <h2 className="font-display text-2xl font-bold mb-3">Ingredients</h2>
        <ul className="space-y-2">
          {(recipe.ingredients as Ingredient[]).map(
            (ing: Ingredient, i: number) => (
              <li key={i} className="flex items-baseline gap-2 text-sm">
                <span className="font-medium text-primary shrink-0">
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
        <h2 className="font-display text-2xl font-bold mb-3">Instructions</h2>
        <ol className="space-y-4">
          {(recipe.steps as string[]).map((step: string, i: number) => (
            <li key={i} className="flex gap-3 text-sm">
              <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary/10 text-xs font-medium text-primary">
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
          <div className="rounded-xl bg-amber-50 border border-amber-200 p-4">
            <h3 className="font-display text-lg font-bold text-amber-800 mb-1">
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

**Step 2: Verify**

Check: Large handwritten recipe title, terracotta ingredient quantities, warm step-number circles, rounded-xl video container.

**Step 3: Commit**

```bash
git add src/app/recipes/[id]/page.tsx
git commit -m "feat: restyle recipe detail with warm journal aesthetic"
```

---

### Task 8: Meal Calendar

**Files:**
- Modify: `src/components/meal-calendar.tsx`

**Step 1: Restyle the calendar**

Key changes:
- Week heading: `font-display text-xl`
- Today cells: `border-primary bg-primary/5` instead of blue
- Day numbers: `font-display text-lg` for today
- Filled meal slots: `bg-accent` instead of `bg-gray-50`
- Empty slots: warm dashed border with terracotta hover
- Meal type labels: `text-primary`

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

  const weekStart = startOfWeek(currentDate, { weekStartsOn: 1 })
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
        <h2 className="font-display text-xl font-bold">
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

      <div className="grid grid-cols-1 gap-2 sm:grid-cols-7">
        {days.map((day) => {
          const isToday = isSameDay(day, new Date())
          return (
            <div
              key={day.toISOString()}
              className={`rounded-xl border p-3 sm:p-2 sm:min-h-[160px] ${
                isToday ? 'border-primary bg-primary/5' : ''
              }`}
            >
              <div className="text-sm sm:text-xs font-medium text-muted-foreground mb-2">
                {format(day, 'EEE')}
                <span className={`ml-1 ${isToday ? 'text-primary font-bold' : ''}`}>
                  {format(day, 'd')}
                </span>
              </div>

              {(['lunch', 'dinner'] as const).map((mealType) => {
                const meal = getMeal(day, mealType)
                return (
                  <div key={mealType} className="mb-1.5">
                    <span className="text-xs sm:text-[10px] uppercase tracking-wide text-primary/70 font-semibold">
                      {mealType}
                    </span>
                    {meal?.recipe ? (
                      <div className="group flex items-start gap-1 rounded-lg bg-accent p-1.5 text-xs">
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
                          <X className="h-3 w-3 text-muted-foreground hover:text-destructive" />
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => openAddDialog(day, mealType)}
                        className="flex w-full items-center justify-center rounded-lg border border-dashed p-1.5 text-xs text-muted-foreground hover:border-primary hover:text-primary transition-colors"
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

**Step 2: Verify**

Check: Today cell has terracotta border, meal type labels are warm, empty slots highlight terracotta on hover, filled slots use sage background.

**Step 3: Commit**

```bash
git add src/components/meal-calendar.tsx
git commit -m "feat: restyle meal calendar with warm palette and journal feel"
```

---

### Task 9: Add Meal Dialog

**Files:**
- Modify: `src/components/add-meal-dialog.tsx`

**Step 1: Restyle the dialog**

Warm hover colors and handwritten title.

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
import { Input } from '@/components/ui/input'
import { supabase } from '@/lib/supabase/client'
import { Recipe } from '@/lib/types'

interface AddMealDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  date: string
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
          <DialogTitle className="font-display text-xl">
            Add {mealType} for {date}
          </DialogTitle>
        </DialogHeader>
        <Input
          placeholder="Search your recipes..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />
        <div className="overflow-y-auto flex-1 space-y-1 mt-2">
          {filtered.map((recipe) => (
            <button
              key={recipe.id}
              onClick={() => selectRecipe(recipe.id)}
              className="w-full text-left rounded-lg px-3 py-2 text-sm hover:bg-accent transition-colors"
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

**Step 2: Commit**

```bash
git add src/components/add-meal-dialog.tsx
git commit -m "feat: warm styling for add meal dialog"
```

---

### Task 10: Grocery List

**Files:**
- Modify: `src/components/grocery-list.tsx`

**Step 1: Restyle the grocery list**

Key changes:
- Category headings: warm muted color (already handled by CSS vars)
- Checkbox items: `hover:bg-accent` instead of `hover:bg-gray-50`
- Empty state icon: warm opacity
- Generate button inherits warm primary

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
              <h3 className="font-display text-lg font-bold text-muted-foreground mb-2">
                {category}
              </h3>
              <div className="space-y-1">
                {grouped[category].map((item) => (
                  <label
                    key={item.id}
                    className="flex items-center gap-3 rounded-lg px-3 py-2 hover:bg-accent cursor-pointer transition-colors"
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

**Step 2: Commit**

```bash
git add src/components/grocery-list.tsx
git commit -m "feat: warm styling for grocery list with handwritten category headers"
```

---

### Task 11: Calendar & Grocery Wrapper Pages

**Files:**
- Modify: `src/app/calendar/page.tsx`
- Modify: `src/app/grocery/page.tsx`

**Step 1: Add Caveat headings to both pages**

Calendar page:
```tsx
// Only change: h1 class
<h1 className="font-display text-3xl font-bold">Meal Calendar</h1>
```

Grocery page:
```tsx
// Only change: h1 class
<h1 className="font-display text-3xl font-bold">Grocery List</h1>
```

**Step 2: Commit**

```bash
git add src/app/calendar/page.tsx src/app/grocery/page.tsx
git commit -m "feat: warm handwritten headings for calendar and grocery pages"
```

---

### Task 12: Cleanup — Remove Design Showcase Page

**Files:**
- Delete: `src/app/design/page.tsx`
- Delete: `src/app/design/` (directory)

**Step 1: Remove the design mockup page**

```bash
rm -rf src/app/design
```

**Step 2: Verify the app builds cleanly**

Run: `npm run build`
Expected: Build succeeds with no errors.

**Step 3: Commit**

```bash
git add -A
git commit -m "chore: remove design showcase page"
```

---

## Verification Checklist

After all tasks, verify each page:
- [ ] Dashboard: Cream background, ruled lines, Caveat headings, terracotta accents
- [ ] Recipes: Handwritten title, warm cards with Caveat recipe names
- [ ] Recipe Detail: Large handwritten title, terracotta ingredient quantities, warm step circles
- [ ] Calendar: Terracotta today highlight, warm meal labels, sage-toned filled slots
- [ ] Grocery: Handwritten category headers, warm hover states
- [ ] Nav: "Cooking Diary" in Caveat, terracotta active state
- [ ] All pages: Lora body text, no blue/gray remnants, consistent warm palette
