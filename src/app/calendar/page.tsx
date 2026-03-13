import { createClient } from '@/lib/supabase/server'
import { MealCalendar } from '@/components/meal-calendar'

export default async function CalendarPage() {
  const supabase = await createClient()

  const { data: mealPlans } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(*)')
    .order('date')

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Meal Calendar</h1>
        <p className="text-muted-foreground">
          Plan your lunch and dinner for the week
        </p>
      </div>
      <MealCalendar mealPlans={mealPlans ?? []} />
    </div>
  )
}
