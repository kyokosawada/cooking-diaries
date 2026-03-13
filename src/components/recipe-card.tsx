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
