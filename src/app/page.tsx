import { createClient } from '@/lib/supabase/server'
import { format, startOfWeek, endOfWeek, addDays } from 'date-fns'
import Link from 'next/link'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { CalendarDays, UtensilsCrossed, ShoppingCart, ArrowRight } from 'lucide-react'
import { MealPlan } from '@/lib/types'

export default async function DashboardPage() {
  const supabase = await createClient()

  const weekStart = format(startOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')
  const weekEnd = format(endOfWeek(new Date(), { weekStartsOn: 1 }), 'yyyy-MM-dd')
  const today = format(new Date(), 'yyyy-MM-dd')

  const { data: weekMeals } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(name, cuisine, cook_time)')
    .gte('date', weekStart)
    .lte('date', weekEnd)
    .order('date')

  const { data: recipes } = await supabase
    .from('recipes')
    .select('id', { count: 'exact' })

  const todayMeals = (weekMeals ?? []).filter((m: MealPlan) => m.date === today)
  const plannedDays = new Set((weekMeals ?? []).map((m: MealPlan) => m.date)).size

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Dashboard</h1>
        <p className="text-muted-foreground">
          {format(new Date(), 'EEEE, MMMM d, yyyy')}
        </p>
      </div>

      {/* Quick stats */}
      <div className="grid gap-4 sm:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Recipes</CardTitle>
            <UtensilsCrossed className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{recipes?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">in your library</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">This Week</CardTitle>
            <CalendarDays className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{weekMeals?.length ?? 0}</div>
            <p className="text-xs text-muted-foreground">
              meals planned across {plannedDays} days
            </p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Today</CardTitle>
            <ShoppingCart className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{todayMeals.length}</div>
            <p className="text-xs text-muted-foreground">meals planned</p>
          </CardContent>
        </Card>
      </div>

      {/* Today's meals */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold">Today&apos;s Meals</h2>
          <Link href="/calendar">
            <Button variant="ghost" size="sm">
              View calendar
              <ArrowRight className="h-4 w-4 ml-1" />
            </Button>
          </Link>
        </div>
        {todayMeals.length === 0 ? (
          <Card>
            <CardContent className="py-8 text-center text-muted-foreground">
              <p>No meals planned for today.</p>
              <Link href="/calendar">
                <Button variant="link" className="mt-1">
                  Plan something
                </Button>
              </Link>
            </CardContent>
          </Card>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2">
            {todayMeals.map((meal: MealPlan) => (
              <Link key={meal.id} href={`/recipes/${meal.recipe_id}`}>
                <Card className="hover:shadow-md transition-shadow cursor-pointer">
                  <CardContent className="pt-4">
                    <p className="text-xs uppercase tracking-wide text-muted-foreground mb-1">
                      {meal.meal_type}
                    </p>
                    <p className="font-semibold">{meal.recipe?.name}</p>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        )}
      </div>

      {/* This week overview */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-lg font-semibold">This Week</h2>
        </div>
        <div className="grid grid-cols-7 gap-2">
          {Array.from({ length: 7 }, (_, i) => {
            const day = addDays(new Date(weekStart), i)
            const dateStr = format(day, 'yyyy-MM-dd')
            const dayMeals = (weekMeals ?? []).filter(
              (m: MealPlan) => m.date === dateStr
            )
            const isToday = dateStr === today

            return (
              <div
                key={dateStr}
                className={`rounded-lg border p-2 text-center ${
                  isToday ? 'border-blue-400 bg-blue-50/50' : ''
                }`}
              >
                <p className="text-xs font-medium text-muted-foreground">
                  {format(day, 'EEE')}
                </p>
                <p className={`text-lg font-bold ${isToday ? 'text-blue-600' : ''}`}>
                  {format(day, 'd')}
                </p>
                <p className="text-xs text-muted-foreground">
                  {dayMeals.length > 0
                    ? `${dayMeals.length} meal${dayMeals.length > 1 ? 's' : ''}`
                    : '—'}
                </p>
              </div>
            )
          })}
        </div>
      </div>

      {/* Quick links */}
      <div className="flex gap-3">
        <Link href="/recipes">
          <Button variant="outline">
            <UtensilsCrossed className="h-4 w-4 mr-2" />
            Browse Recipes
          </Button>
        </Link>
        <Link href="/grocery">
          <Button variant="outline">
            <ShoppingCart className="h-4 w-4 mr-2" />
            Grocery List
          </Button>
        </Link>
      </div>
    </div>
  )
}
