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
