export interface Recipe {
  id: string
  name: string
  cuisine: string
  cook_time: number
  difficulty: string
  servings: string
  ingredients: Ingredient[]
  steps: string[]
  youtube_url: string | null
  image_url: string | null
  source: string | null
  tips: string | null
  created_at: string
}

export interface Ingredient {
  name: string
  quantity: string
  unit: string
  category?: string
}

export interface MealPlan {
  id: string
  date: string
  meal_type: 'lunch' | 'dinner'
  recipe_id: string
  recipe?: Recipe
  created_at: string
}

export interface GroceryItem {
  id: string
  name: string
  quantity: string | null
  unit: string | null
  checked: boolean
  category: string | null
  date_range_start: string | null
  date_range_end: string | null
  created_at: string
}
