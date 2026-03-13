export const dynamic = 'force-dynamic'

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
