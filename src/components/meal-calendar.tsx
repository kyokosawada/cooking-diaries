'use client'

import { useState, useTransition } from 'react'
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
import { MealPlan, Recipe } from '@/lib/types'
import Link from 'next/link'

interface MealCalendarProps {
  mealPlans: MealPlan[]
}

export function MealCalendar({ mealPlans }: MealCalendarProps) {
  const router = useRouter()
  const [, startTransition] = useTransition()
  const [currentDate, setCurrentDate] = useState(new Date())
  const [dialogOpen, setDialogOpen] = useState(false)
  const [selectedSlot, setSelectedSlot] = useState<{
    date: string
    mealType: 'lunch' | 'dinner'
  } | null>(null)
  const [removedIds, setRemovedIds] = useState<Set<string>>(new Set())
  const [optimisticMeals, setOptimisticMeals] = useState<MealPlan[]>([])

  const weekStart = startOfWeek(currentDate, { weekStartsOn: 1 })
  const days = Array.from({ length: 7 }, (_, i) => addDays(weekStart, i))

  const visibleMealPlans = [...mealPlans, ...optimisticMeals].filter((mp) => !removedIds.has(mp.id))

  function getMeal(date: Date, mealType: string) {
    const dateStr = format(date, 'yyyy-MM-dd')
    return visibleMealPlans.find(
      (mp) => mp.date === dateStr && mp.meal_type === mealType
    )
  }

  function handleMealAdded(meal: { date: string; meal_type: 'lunch' | 'dinner'; recipe_id: string; recipe: Recipe }) {
    setOptimisticMeals((prev) => [
      ...prev.filter((m) => !(m.date === meal.date && m.meal_type === meal.meal_type)),
      {
        id: `optimistic-${Date.now()}`,
        date: meal.date,
        meal_type: meal.meal_type,
        recipe_id: meal.recipe_id,
        recipe: meal.recipe,
        created_at: new Date().toISOString(),
      },
    ])
  }

  function openAddDialog(date: Date, mealType: 'lunch' | 'dinner') {
    setSelectedSlot({ date: format(date, 'yyyy-MM-dd'), mealType })
    setDialogOpen(true)
  }

  async function removeMeal(id: string) {
    setRemovedIds((prev) => new Set(prev).add(id))
    const res = await fetch(`/api/meal-plan?id=${id}`, { method: 'DELETE' })
    if (!res.ok) {
      // Rollback optimistic removal on failure
      setRemovedIds((prev) => {
        const next = new Set(prev)
        next.delete(id)
        return next
      })
      return
    }
    startTransition(() => {
      router.refresh()
    })
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
          onMealAdded={handleMealAdded}
        />
      )}
    </>
  )
}
