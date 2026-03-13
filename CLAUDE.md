# Cooking Diaries

Personal cooking guide & meal planner for a beginner cook.

## Tech Stack

- **Next.js 14** (App Router, `src/` directory)
- **Supabase** (Postgres via `@supabase/supabase-js` + `@supabase/ssr`)
- **Tailwind CSS v3** with **shadcn/ui v2** (Radix UI primitives, HSL CSS variables)
- **TypeScript**, **date-fns**, **lucide-react**

## Project Structure

```
src/
  app/
    page.tsx              # Dashboard — stats, today's meals, weekly overview
    layout.tsx            # Root layout with Nav
    recipes/page.tsx      # Recipe library — search, filter by cuisine
    recipes/[id]/page.tsx # Recipe detail — video embed, ingredients, steps
    calendar/page.tsx     # Meal calendar — weekly planner
    grocery/page.tsx      # Grocery list — auto-generated from meal plan
    api/meal-plan/route.ts  # POST (upsert) / DELETE meal plan entries
    api/grocery/route.ts    # POST (generate list) / PATCH (toggle checked)
  components/
    nav.tsx               # Top navigation (icons-only on mobile)
    recipe-card.tsx       # Recipe card for grid display
    recipe-filters.tsx    # Search input + cuisine select
    meal-calendar.tsx     # Weekly calendar with add/remove meals
    add-meal-dialog.tsx   # Recipe picker dialog for calendar
    grocery-list.tsx      # Categorized checklist with generate button
    ui/                   # shadcn/ui components (do not edit directly)
  lib/
    supabase/client.ts    # Browser Supabase client
    supabase/server.ts    # Server component Supabase client (SSR)
    types.ts              # Recipe, Ingredient, MealPlan, GroceryItem
    utils.ts              # cn() utility
supabase/
  schema.sql              # Database schema (3 tables, RLS policies)
  seed-recipes.sql        # 21 beginner recipes
docs/plans/               # Design doc and recipe research
```

## Key Patterns

- **Server components** fetch data from Supabase, **client components** handle interactivity
- API routes (`src/app/api/`) use the browser Supabase client for mutations
- Server pages use `createClient()` from `src/lib/supabase/server.ts`
- No auth — single personal user, RLS policies allow all operations
- Responsive: mobile-first with `sm:` breakpoints

## Commands

```bash
npm run dev    # Start dev server (localhost:3000)
npm run build  # Production build
npm run lint   # ESLint
npx tsc --noEmit  # Type check
```

## Database

Three tables: `recipes`, `meal_plan`, `grocery_items`. Schema at `supabase/schema.sql`. Env vars in `.env.local` (gitignored):

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## Deployment

- **GitHub**: github.com/kyokosawada/cooking-diaries
- **Vercel**: Auto-deploys on push to `main`
