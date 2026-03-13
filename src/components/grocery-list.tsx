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
