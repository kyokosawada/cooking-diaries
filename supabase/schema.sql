-- Recipes table
CREATE TABLE recipes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  cuisine TEXT NOT NULL,
  cook_time INTEGER NOT NULL,
  difficulty TEXT NOT NULL DEFAULT 'Easy',
  servings TEXT NOT NULL DEFAULT '2',
  ingredients JSONB NOT NULL DEFAULT '[]',
  steps JSONB NOT NULL DEFAULT '[]',
  youtube_url TEXT,
  image_url TEXT,
  source TEXT,
  tips TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Meal plan table
CREATE TABLE meal_plan (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  date DATE NOT NULL,
  meal_type TEXT NOT NULL CHECK (meal_type IN ('lunch', 'dinner')),
  recipe_id UUID NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(date, meal_type)
);

-- Grocery items table
CREATE TABLE grocery_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  quantity TEXT,
  unit TEXT,
  checked BOOLEAN DEFAULT FALSE,
  category TEXT,
  date_range_start DATE,
  date_range_end DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS but allow all operations (personal app, no auth)
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;
ALTER TABLE meal_plan ENABLE ROW LEVEL SECURITY;
ALTER TABLE grocery_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all on recipes" ON recipes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on meal_plan" ON meal_plan FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on grocery_items" ON grocery_items FOR ALL USING (true) WITH CHECK (true);

-- Indexes
CREATE INDEX idx_meal_plan_date ON meal_plan(date);
CREATE INDEX idx_recipes_cuisine ON recipes(cuisine);
