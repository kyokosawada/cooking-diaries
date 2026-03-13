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
