import { createClient } from '@/lib/supabase/server'
import { GroceryList } from '@/components/grocery-list'

export default async function GroceryPage() {
  const supabase = await createClient()

  const { data: groceryItems } = await supabase
    .from('grocery_items')
    .select('*')
    .order('category')
    .order('name')

  const { data: mealPlans } = await supabase
    .from('meal_plan')
    .select('*, recipe:recipes(*)')
    .order('date')

  return (
    <div className="space-y-6">
      <div>
        <h1 className="font-display text-3xl font-bold">Grocery List</h1>
        <p className="text-muted-foreground">
          Auto-generated from your meal plan
        </p>
      </div>
      <GroceryList
        groceryItems={groceryItems ?? []}
        mealPlans={mealPlans ?? []}
      />
    </div>
  )
}
