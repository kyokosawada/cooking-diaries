'use client'

import { useState, useEffect, useMemo } from 'react'
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { Input } from '@/components/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { supabase } from '@/lib/supabase/client'
import { Recipe } from '@/lib/types'

interface AddMealDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  date: string
  mealType: 'lunch' | 'dinner'
  onMealAdded: (meal: { date: string; meal_type: 'lunch' | 'dinner'; recipe_id: string; recipe: Recipe }) => void
}

export function AddMealDialog({
  open,
  onOpenChange,
  date,
  mealType,
  onMealAdded,
}: AddMealDialogProps) {
  const [recipes, setRecipes] = useState<Recipe[]>([])
  const [search, setSearch] = useState('')
  const [cuisine, setCuisine] = useState('All')
  const [difficulty, setDifficulty] = useState('All')

  useEffect(() => {
    if (open) {
      supabase
        .from('recipes')
        .select('*')
        .order('name')
        .then(({ data }) => setRecipes(data ?? []))
    }
  }, [open])

  const cuisines = useMemo(() => {
    const unique = Array.from(new Set(recipes.map((r) => r.cuisine))).sort()
    return ['All', ...unique]
  }, [recipes])

  const difficulties = useMemo(() => {
    const unique = Array.from(new Set(recipes.map((r) => r.difficulty))).sort()
    return ['All', ...unique]
  }, [recipes])

  const filtered = recipes.filter((r) => {
    if (search && !r.name.toLowerCase().includes(search.toLowerCase())) return false
    if (cuisine !== 'All' && r.cuisine !== cuisine) return false
    if (difficulty !== 'All' && r.difficulty !== difficulty) return false
    return true
  })

  function selectRecipe(recipe: Recipe) {
    onMealAdded({ date, meal_type: mealType, recipe_id: recipe.id, recipe })
    onOpenChange(false)
    setSearch('')
    setCuisine('All')
    setDifficulty('All')
    fetch('/api/meal-plan', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ date, meal_type: mealType, recipe_id: recipe.id }),
    })
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-h-[80vh] overflow-hidden flex flex-col">
        <DialogHeader>
          <DialogTitle className="font-display text-xl">
            Add {mealType} for {date}
          </DialogTitle>
        </DialogHeader>
        <div className="flex flex-col gap-2">
          <Input
            placeholder="Search your recipes..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
          <div className="flex gap-2">
            <Select value={cuisine} onValueChange={setCuisine}>
              <SelectTrigger className="flex-1">
                <SelectValue placeholder="Cuisine" />
              </SelectTrigger>
              <SelectContent>
                {cuisines.map((c) => (
                  <SelectItem key={c} value={c}>{c}</SelectItem>
                ))}
              </SelectContent>
            </Select>
            <Select value={difficulty} onValueChange={setDifficulty}>
              <SelectTrigger className="flex-1">
                <SelectValue placeholder="Difficulty" />
              </SelectTrigger>
              <SelectContent>
                {difficulties.map((d) => (
                  <SelectItem key={d} value={d}>{d}</SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>
        <div className="overflow-y-auto flex-1 space-y-1 mt-2">
          {filtered.map((recipe) => (
            <button
              key={recipe.id}
              onClick={() => selectRecipe(recipe)}
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
