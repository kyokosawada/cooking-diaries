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
