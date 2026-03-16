-- Seed data for 21 beginner recipes
-- Run this after schema.sql to populate the recipes table

INSERT INTO recipes (name, cuisine, cook_time, difficulty, servings, ingredients, steps, youtube_url, image_url, source, tips)
VALUES
(
  'Egg Fried Rice',
  'Chinese',
  15,
  'Easy',
  '4',
  '[
    {"name": "cooked chilled white rice (day-old)", "quantity": "4", "unit": "cups", "category": "Grains"},
    {"name": "large eggs", "quantity": "3", "unit": "whole", "category": "Protein"},
    {"name": "unsalted butter", "quantity": "1", "unit": "tbsp", "category": "Dairy"},
    {"name": "sugar", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "fresh ginger", "quantity": "1", "unit": "inch knob", "category": "Produce"},
    {"name": "vegetable oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "carrot", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "green onions", "quantity": "1", "unit": "bunch", "category": "Produce"},
    {"name": "frozen peas", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "toasted sesame oil", "quantity": "1", "unit": "drizzle", "category": "Sauces"},
    {"name": "kosher salt", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Cook rice ahead of time. Spread on a tray and refrigerate overnight (day-old rice fries better).",
    "Whisk eggs with salt. Melt butter in skillet over medium heat. Scramble eggs, chop into pieces, set aside.",
    "Mix sugar, soy sauce, vinegar, garlic, and ginger in a small bowl.",
    "Heat vegetable oil in a large skillet/wok over medium-high. Sauté carrots 2 min, add white parts of green onions 1 min, add frozen peas 1-2 min.",
    "Add chilled rice, break up clumps. Cook 5 min, stirring regularly.",
    "Pour sauce over rice, mix thoroughly.",
    "Fold in scrambled eggs and green onion tops. Drizzle with sesame oil. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=2pfPNpFIKA4',
  NULL,
  'Joshua Weissman',
  'Day-old rice is essential — fresh rice turns mushy.'
),

(
  'Lo Mein Noodles',
  'Chinese',
  15,
  'Easy',
  '3',
  '[
    {"name": "fresh egg noodles", "quantity": "500", "unit": "g", "category": "Grains"},
    {"name": "chicken breast or thigh", "quantity": "300", "unit": "g", "category": "Protein"},
    {"name": "vegetable oil", "quantity": "1.5", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "onion", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "carrots", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "red bell pepper", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "green onions", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "cornstarch", "quantity": "4", "unit": "tsp", "category": "Pantry"},
    {"name": "dark soy sauce", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "soy sauce", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "Chinese cooking wine", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "sugar", "quantity": "1", "unit": "tsp", "category": "Pantry"},
    {"name": "sesame oil", "quantity": "0.5", "unit": "tsp", "category": "Sauces"},
    {"name": "white pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "water", "quantity": "0.25", "unit": "cup", "category": "Other"}
  ]'::jsonb,
  '[
    "Mix all sauce ingredients until smooth.",
    "Coat chicken with 2 tsp of the sauce. Set aside.",
    "Cook noodles per packet. Drain.",
    "Heat oil in wok over high heat. Add onion and garlic, stir 30 sec.",
    "Add chicken, stir 1 min. Add carrots and bell pepper, cook 2 min.",
    "Add noodles and remaining sauce. Toss 30 sec.",
    "Add green onions, toss 1 min until noodles are glossy. Serve."
  ]'::jsonb,
  'https://www.recipetineats.com/lo-mein-noodles/',
  NULL,
  'RecipeTin Eats',
  'Have all ingredients prepped before you start — stir-fries move fast.'
),

(
  'Hoisin Chicken Stir-Fry',
  'Chinese',
  15,
  'Easy',
  '4',
  '[
    {"name": "boneless chicken breast", "quantity": "400", "unit": "g", "category": "Protein"},
    {"name": "vegetable oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "bell peppers", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "spring onions", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "dark soy sauce", "quantity": "0.5", "unit": "tsp", "category": "Sauces"},
    {"name": "Shaoxing wine", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "baking soda", "quantity": "0.5", "unit": "tsp", "category": "Pantry"},
    {"name": "cornstarch", "quantity": "3", "unit": "tsp", "category": "Pantry"},
    {"name": "hoisin sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "Shaoxing wine (for sauce)", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "soy sauce (for sauce)", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "dark soy sauce (for sauce)", "quantity": "0.5", "unit": "tsp", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "2", "unit": "tsp", "category": "Pantry"},
    {"name": "sugar", "quantity": "2", "unit": "tsp", "category": "Pantry"},
    {"name": "black pepper", "quantity": "1.5", "unit": "tsp", "category": "Spices"}
  ]'::jsonb,
  '[
    "Slice chicken thin against the grain. Mix with marinade, set aside 10 min.",
    "Mix hoisin sauce ingredients in a bowl.",
    "Heat oil in wok over high heat. Add onion, stir-fry 30 sec.",
    "Add chicken, leave 3-4 min to form golden crust, then toss with onions.",
    "Add garlic and bell peppers, stir-fry 30 sec.",
    "Pour sauce around edges, stir-fry 30 sec.",
    "Toss in spring onions. Serve over rice."
  ]'::jsonb,
  'https://www.marionskitchen.com/hoisin-chicken-stir-fry/',
  NULL,
  'Marion''s Kitchen',
  'Let the chicken sit undisturbed in the wok to get a good sear before tossing.'
),

(
  'Gyudon (Japanese Beef Rice Bowl)',
  'Japanese',
  10,
  'Easy',
  '4',
  '[
    {"name": "beef (scotch fillet or rump)", "quantity": "500", "unit": "g", "category": "Protein"},
    {"name": "chicken stock or dashi", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "0.25", "unit": "cup", "category": "Sauces"},
    {"name": "sake", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "mirin", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "sugar", "quantity": "2", "unit": "tsp", "category": "Pantry"},
    {"name": "brown onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "cooked short-grain rice", "quantity": "4", "unit": "cups", "category": "Grains"},
    {"name": "spring onions", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "pickled ginger", "quantity": "", "unit": "optional", "category": "Other"}
  ]'::jsonb,
  '[
    "Combine stock, soy sauce, sake, mirin, and sugar in a saucepan. Bring to a boil.",
    "Add onion, simmer 2-3 min until softened.",
    "Simmer rapidly ~10 min until liquid reduces by two-thirds.",
    "Add beef, stir gently 1-2 min until just cooked.",
    "Serve over rice bowls with spring onions and pickled ginger."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=mNzXoRiXxpM',
  NULL,
  'Adam Liaw',
  'Ask your butcher to slice the beef thin, or buy pre-sliced shabu-shabu beef from an Asian grocery.'
),

(
  'Pad See Ew (Thai Stir-Fried Noodles)',
  'Thai',
  18,
  'Easy',
  '2-3',
  '[
    {"name": "dried wide rice noodles", "quantity": "200", "unit": "g", "category": "Grains"},
    {"name": "boneless chicken thighs", "quantity": "150", "unit": "g", "category": "Protein"},
    {"name": "vegetable oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "large egg", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "Chinese broccoli", "quantity": "4", "unit": "stems", "category": "Produce"},
    {"name": "dark soy sauce", "quantity": "2", "unit": "tsp", "category": "Sauces"},
    {"name": "oyster sauce", "quantity": "1.5", "unit": "tbsp", "category": "Sauces"},
    {"name": "light soy sauce", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "2", "unit": "tsp", "category": "Pantry"},
    {"name": "sugar", "quantity": "2", "unit": "tsp", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Cook rice noodles per packet. Drain.",
    "Mix sauce ingredients.",
    "Heat 1 tbsp oil in wok over high heat. Add garlic 15 sec, then chicken. Cook until mostly done. Add broccoli stems, then leaves.",
    "Push to side, crack egg in and scramble.",
    "Remove everything to a plate.",
    "Heat 2 tbsp oil in wok until smoking. Add noodles and sauce. Let sit and char 1-1.5 min (don''t over-stir).",
    "Return chicken mixture, toss together. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=Ohy1DELF4is',
  NULL,
  'Hot Thai Kitchen',
  'The key to great pad see ew is letting the noodles char without over-stirring.'
),

(
  'Korean Ground Beef Bulgogi Bowl',
  'Korean',
  15,
  'Easy',
  '5',
  '[
    {"name": "ground beef", "quantity": "600", "unit": "g", "category": "Protein"},
    {"name": "shiitake mushrooms", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "yellow onion", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "green onions", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "vegetable oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "toasted sesame oil", "quantity": "0.5", "unit": "tbsp", "category": "Sauces"},
    {"name": "cooked rice", "quantity": "5", "unit": "cups", "category": "Grains"},
    {"name": "sesame seeds", "quantity": "", "unit": "garnish", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "sugar", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "mirin", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "oyster sauce", "quantity": "2.5", "unit": "tbsp", "category": "Sauces"},
    {"name": "minced garlic", "quantity": "2", "unit": "tbsp", "category": "Produce"},
    {"name": "toasted sesame oil (for sauce)", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "black pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Mix sauce ingredients. Add ground beef and mushrooms, mix thoroughly.",
    "Heat oil in wok over medium-high. Sauté onion whites and diced onion 3 min.",
    "Add beef mixture. Cook 7-8 min, breaking up beef, until browned and liquid evaporates.",
    "Off heat, add green onion tops and sesame oil.",
    "Serve over rice with sesame seeds."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=s2RDzkr1zgE',
  NULL,
  'Aaron and Claire',
  'Break up the beef constantly while cooking for even browning.'
),

(
  'Fried Rice (Basics)',
  'Chinese-American',
  25,
  'Easy',
  '2',
  '[
    {"name": "cooked chilled rice (day-old)", "quantity": "4.5", "unit": "cups", "category": "Grains"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "vegetable oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "mushrooms", "quantity": "0.5", "unit": "cup", "category": "Produce"},
    {"name": "frozen peas", "quantity": "0.5", "unit": "cup", "category": "Produce"},
    {"name": "chopped ham", "quantity": "1", "unit": "cup", "category": "Protein"},
    {"name": "garlic cloves", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "oyster sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "scallions", "quantity": "", "unit": "sliced", "category": "Produce"},
    {"name": "butter", "quantity": "1", "unit": "tbsp", "category": "Dairy"},
    {"name": "sesame oil", "quantity": "1", "unit": "drizzle", "category": "Sauces"},
    {"name": "sesame seeds", "quantity": "", "unit": "garnish", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Prepare rice ahead — refrigerate overnight.",
    "Scramble eggs in oiled pan. Set aside.",
    "Cook protein until done. Set aside.",
    "Sauté mushrooms 2 min, add peas.",
    "Add garlic 30 sec.",
    "Add rice. Pour mixed oyster sauce + soy sauce over rice.",
    "Fry on high 3-5 min until hot and slightly crispy.",
    "Return eggs and protein. Add sesame oil, scallions, sesame seeds, butter. Toss and serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=Dk0axPbD2pc',
  NULL,
  'Basics with Babish',
  'Day-old rice is essential — fresh rice turns mushy.'
),

(
  'Pasta Aglio e Olio',
  'Italian',
  20,
  'Easy',
  '2',
  '[
    {"name": "linguine", "quantity": "0.5", "unit": "lb", "category": "Grains"},
    {"name": "garlic", "quantity": "0.5", "unit": "head", "category": "Produce"},
    {"name": "olive oil", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "red pepper flakes", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "flat-leaf parsley", "quantity": "0.5", "unit": "cup", "category": "Produce"},
    {"name": "lemon", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "kosher salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "black pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Boil heavily salted water. Cook linguine 1 min less than package says. Reserve 1/4 cup pasta water.",
    "Heat olive oil in pan over medium. Add garlic, stir until golden (don''t burn).",
    "Add red pepper flakes, reduce heat.",
    "Add drained pasta + reserved pasta water. Squeeze lemon, add parsley, toss.",
    "Season and serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=bJUiWdM__Qw',
  NULL,
  'Babish',
  'Watch the garlic closely — it goes from golden to burnt very quickly.'
),

(
  'Grilled Cheese Sandwich',
  'American',
  10,
  'Easy',
  '1',
  '[
    {"name": "white bread", "quantity": "2", "unit": "slices", "category": "Grains"},
    {"name": "unsalted butter", "quantity": "2", "unit": "tbsp", "category": "Dairy"},
    {"name": "American cheese", "quantity": "2", "unit": "slices", "category": "Dairy"}
  ]'::jsonb,
  '[
    "Heat nonstick pan over medium. Melt 1 tbsp butter.",
    "Place bread in butter, top with both cheese slices, then second bread slice.",
    "Reduce to medium-low. Toast until golden, ~2-3 min.",
    "Add remaining butter, flip. Toast 2-3 more min.",
    "Slice diagonally. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=WcGYBX6Ucvg',
  NULL,
  'Joshua Weissman',
  'Use medium-low heat to melt the cheese without burning the bread.'
),

(
  'Fried Chicken Sandwich',
  'American',
  20,
  'Easy',
  '2',
  '[
    {"name": "boneless chicken thighs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "milk", "quantity": "100", "unit": "g", "category": "Dairy"},
    {"name": "white vinegar", "quantity": "1", "unit": "tsp", "category": "Pantry"},
    {"name": "flour", "quantity": "50", "unit": "g", "category": "Pantry"},
    {"name": "cornstarch", "quantity": "25", "unit": "g", "category": "Pantry"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "paprika", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "chili powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "garlic powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "oregano", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "neutral oil for frying", "quantity": "2", "unit": "inches in pot", "category": "Pantry"},
    {"name": "mayo", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "Dijon mustard", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "hot sauce", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "brioche buns", "quantity": "2", "unit": "whole", "category": "Grains"},
    {"name": "lettuce", "quantity": "", "unit": "as needed", "category": "Produce"},
    {"name": "pickled onions", "quantity": "", "unit": "as needed", "category": "Produce"}
  ]'::jsonb,
  '[
    "Soak chicken in milk + salt + vinegar.",
    "Heat oil to 375°F/190°C in a deep pot.",
    "Mix flour, cornstarch, and spices. Drizzle in some milk to create shaggy clumps.",
    "Press chicken into dredge for thick coating.",
    "Fry 8 min, flipping halfway. Internal temp 165°F/73°C.",
    "Rest on paper towels, sprinkle salt.",
    "Mix sauce. Assemble on buns with lettuce and pickled onions."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=K4UW4kovH-c',
  NULL,
  'Ethan Chlebowski',
  'Use a thermometer to keep the oil at 375°F for best results.'
),

(
  'Tomato Soup + Grilled Cheese',
  'American',
  30,
  'Easy',
  '6-8',
  '[
    {"name": "large onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "butter", "quantity": "4", "unit": "oz", "category": "Dairy"},
    {"name": "black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "flour", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "whole/crushed tomatoes", "quantity": "2", "unit": "cans (28 oz each)", "category": "Pantry"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "sugar", "quantity": "", "unit": "if needed", "category": "Pantry"},
    {"name": "water", "quantity": "", "unit": "to thin", "category": "Other"}
  ]'::jsonb,
  '[
    "Melt butter, cook onion 5 min. Add pepper.",
    "Stir in flour, cook 1-2 min.",
    "Add tomatoes, simmer 30 min.",
    "Blend until smooth. Season with salt.",
    "Make grilled cheese while soup simmers (see grilled cheese recipe)."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=r4bGuZSur0E',
  NULL,
  'Adam Ragusea',
  'Use an immersion blender right in the pot if you have one — much easier than transferring to a blender.'
),

(
  '15-Min Alfredo with Peas',
  'Italian-American',
  15,
  'Easy',
  '2',
  '[
    {"name": "penne pasta", "quantity": "227", "unit": "g", "category": "Grains"},
    {"name": "butter", "quantity": "56", "unit": "g", "category": "Dairy"},
    {"name": "Parmigiano Reggiano", "quantity": "70", "unit": "g", "category": "Dairy"},
    {"name": "garlic clove", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "peas (frozen is fine)", "quantity": "50", "unit": "g", "category": "Produce"},
    {"name": "fresh basil", "quantity": "", "unit": "sliced", "category": "Produce"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Put penne in skillet, cover with hot water, pinch of salt.",
    "High heat, stir first 60 sec. Set timer 8 min, stir occasionally.",
    "Drain excess water, leaving a few tbsp in pan.",
    "Add butter, stir until melted and emulsified.",
    "Add Parmigiano, stir vigorously until creamy.",
    "Mix in garlic, peas, basil. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=Pz3zl2qE_vE',
  NULL,
  'Ethan Chlebowski',
  'Keep some starchy pasta water — it helps the cheese sauce stay smooth instead of clumping.'
),

(
  'Fettuccine al Burro (3-Ingredient Butter Pasta)',
  'Italian',
  15,
  'Easy',
  '4',
  '[
    {"name": "fettuccine", "quantity": "1", "unit": "lb", "category": "Grains"},
    {"name": "salted butter", "quantity": "0.5", "unit": "cup", "category": "Dairy"},
    {"name": "Parmigiano Reggiano", "quantity": "1", "unit": "cup", "category": "Dairy"}
  ]'::jsonb,
  '[
    "Boil salted water. Cook fettuccine al dente (~7 min). Reserve 1/2 cup pasta water.",
    "Drain pasta, return to pot (off heat).",
    "Add butter, toss vigorously until melted and emulsified.",
    "Splash pasta water as needed for silky consistency.",
    "Stir in Parmigiano. Season with salt. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=WcGYBX6Ucvg',
  NULL,
  'Joshua Weissman',
  'Toss the pasta vigorously with the butter — this creates the emulsion that makes the sauce silky.'
),

(
  'Chicken with Lemon Pan Sauce',
  'French/American',
  25,
  'Easy',
  '2',
  '[
    {"name": "chicken breasts", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "olive oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "kosher salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "black pepper", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "shallot", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "white wine", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "chicken stock", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "fresh thyme", "quantity": "1", "unit": "tsp", "category": "Produce"},
    {"name": "fresh sage", "quantity": "1", "unit": "tsp", "category": "Produce"},
    {"name": "butter", "quantity": "2", "unit": "tbsp", "category": "Dairy"},
    {"name": "lemon juice", "quantity": "1", "unit": "tbsp", "category": "Produce"}
  ]'::jsonb,
  '[
    "Preheat oven to 400°F/200°C. Season chicken with salt and pepper.",
    "Heat olive oil in oven-safe skillet over medium-high.",
    "Sear chicken 3-4 min per side until golden.",
    "Transfer skillet to oven 10-15 min (internal temp 160°F).",
    "Remove chicken, rest on cutting board.",
    "Return skillet to stovetop (careful, handle is hot). Sauté shallot 1 min.",
    "Add wine, scrape up browned bits. Add stock, herbs. Reduce 3-4 min.",
    "Off heat, stir in butter and lemon juice.",
    "Slice chicken, spoon sauce over top. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=hR6agVkRRUo',
  NULL,
  'Babish',
  'The handle will be extremely hot from the oven — use a towel or oven mitt every time you touch it.'
),

(
  'Brazilian Coconut Chickpea Curry',
  'Brazilian/Indian',
  25,
  'Easy',
  '4',
  '[
    {"name": "olive oil", "quantity": "1.5", "unit": "tbsp", "category": "Pantry"},
    {"name": "onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "red bell pepper", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "canned chickpeas", "quantity": "2", "unit": "cans", "category": "Protein"},
    {"name": "coconut milk", "quantity": "400", "unit": "ml", "category": "Pantry"},
    {"name": "crushed tomatoes", "quantity": "400", "unit": "ml can", "category": "Pantry"},
    {"name": "chicken/veg stock", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "paprika", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "cumin", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "cayenne pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "sugar", "quantity": "1.5", "unit": "tsp", "category": "Pantry"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "baby spinach", "quantity": "50", "unit": "g", "category": "Produce"},
    {"name": "cilantro", "quantity": "3", "unit": "tbsp", "category": "Produce"},
    {"name": "lime juice", "quantity": "1", "unit": "tbsp", "category": "Produce"},
    {"name": "rice for serving", "quantity": "", "unit": "as needed", "category": "Grains"}
  ]'::jsonb,
  '[
    "Heat oil over high. Cook garlic and onion 1 min.",
    "Add bell pepper, cook 2 min.",
    "Add chickpeas, coconut milk, tomatoes, stock, spices, sugar, salt. Stir.",
    "Simmer on medium-low 12-15 min until sauce turns orangey-red.",
    "Stir in spinach until wilted. Add cilantro and lime juice.",
    "Serve over rice."
  ]'::jsonb,
  'https://youtu.be/jpQoJTMMJoc',
  NULL,
  'RecipeTin Eats',
  'The sauce will change from pale pink to orangey-red when it''s ready.'
),

(
  'Chicken Burrito',
  'Mexican',
  18,
  'Easy',
  '3-4',
  '[
    {"name": "boneless chicken thighs", "quantity": "3-4", "unit": "whole", "category": "Protein"},
    {"name": "mayo", "quantity": "30", "unit": "g", "category": "Sauces"},
    {"name": "garlic cloves", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "lime", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "salt", "quantity": "5", "unit": "g", "category": "Spices"},
    {"name": "chili powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "oregano", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "canned pinto beans", "quantity": "1", "unit": "can", "category": "Protein"},
    {"name": "jalapeño", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "cumin seeds", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "large flour tortillas", "quantity": "3-4", "unit": "whole", "category": "Grains"},
    {"name": "sour cream", "quantity": "", "unit": "as needed", "category": "Dairy"},
    {"name": "lettuce", "quantity": "", "unit": "as needed", "category": "Produce"},
    {"name": "tomatoes", "quantity": "", "unit": "as needed", "category": "Produce"},
    {"name": "cilantro", "quantity": "", "unit": "as needed", "category": "Produce"},
    {"name": "hot sauce", "quantity": "", "unit": "as needed", "category": "Sauces"}
  ]'::jsonb,
  '[
    "Coat chicken in mayo + garlic + lime + spices. Sear in pan until cooked (internal 176°F). Slice into strips.",
    "In same pan, cook jalapeño + cumin seeds 1 min. Add beans, sauté 4-5 min.",
    "Warm tortillas in dry pan.",
    "Assemble: sour cream, beans, chicken, toppings. Roll tightly."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=FBWMT6srU1g',
  NULL,
  'Ethan Chlebowski',
  'Mayo on the chicken helps it brown faster and stay juicy.'
),

(
  'Red Lentil Curry (Dal)',
  'Indian',
  35,
  'Easy',
  '4',
  '[
    {"name": "coconut oil", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "ginger", "quantity": "2", "unit": "inch", "category": "Produce"},
    {"name": "serrano pepper", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "turmeric", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "cumin", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "kosher salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "coriander", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "chili powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "curry powder", "quantity": "2", "unit": "tsp", "category": "Spices"},
    {"name": "garam masala", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "red lentils", "quantity": "1.5", "unit": "cups", "category": "Protein"},
    {"name": "vegetable broth", "quantity": "2", "unit": "cups", "category": "Pantry"},
    {"name": "crushed tomatoes", "quantity": "1", "unit": "can", "category": "Pantry"},
    {"name": "coconut milk", "quantity": "1", "unit": "can", "category": "Pantry"},
    {"name": "almond butter", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "lemon", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "cilantro", "quantity": "0.5", "unit": "cup", "category": "Produce"},
    {"name": "rice for serving", "quantity": "", "unit": "as needed", "category": "Grains"}
  ]'::jsonb,
  '[
    "Rinse lentils until water runs clear.",
    "Heat oil, cook garlic + ginger + serrano 2 min.",
    "Add all spices, cook 30-60 sec until fragrant.",
    "Add lentils, broth, tomatoes. Boil, then simmer 20-25 min until lentils are soft.",
    "Stir in coconut milk and almond butter, cook 5 more min.",
    "Off heat, add lemon juice and cilantro. Serve over rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=mK3B0gjEjRc',
  NULL,
  'Rainbow Plant Life',
  'Red lentils don''t need soaking — just rinse until water runs clear.'
),

(
  'Power Greek Salad',
  'Mediterranean',
  15,
  'Easy',
  '1-2',
  '[
    {"name": "chicken breast", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "mayo", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "black pepper (for chicken)", "quantity": "0.5", "unit": "tbsp", "category": "Spices"},
    {"name": "Brussels sprouts", "quantity": "2", "unit": "cups", "category": "Produce"},
    {"name": "cucumber", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "red onion", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "grape tomatoes", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "canned chickpeas", "quantity": "0.5", "unit": "cup", "category": "Protein"},
    {"name": "feta cheese", "quantity": "0.5", "unit": "cup", "category": "Dairy"},
    {"name": "olive oil", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "lemon juice", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "oregano", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "dried mint", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "chili flakes", "quantity": "1", "unit": "pinch", "category": "Spices"},
    {"name": "vinegar", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Coat chicken with mayo + pepper. Cook in skillet 5-6 min per side (internal 165°F).",
    "Combine salad ingredients in a bowl.",
    "Shake dressing ingredients in a jar.",
    "Slice chicken. Add feta and dressing to salad, toss. Top with chicken."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=UIOW18kRDEA',
  NULL,
  'Ethan Chlebowski',
  'Coating chicken with mayo helps it develop a great crust without sticking.'
),

(
  'Quick Butter Chicken',
  'Indian',
  30,
  'Easy',
  '6',
  '[
    {"name": "chicken thighs", "quantity": "1.5", "unit": "lb", "category": "Protein"},
    {"name": "yogurt", "quantity": "0.75", "unit": "cup", "category": "Dairy"},
    {"name": "Kashmiri chili powder", "quantity": "2.5", "unit": "tsp", "category": "Spices"},
    {"name": "lemon juice", "quantity": "2", "unit": "tsp", "category": "Produce"},
    {"name": "turmeric", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "cumin", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "garam masala", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "ginger", "quantity": "2", "unit": "inch", "category": "Produce"},
    {"name": "ghee (or butter)", "quantity": "2", "unit": "tbsp", "category": "Dairy"},
    {"name": "onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "crushed tomatoes", "quantity": "1", "unit": "can", "category": "Pantry"},
    {"name": "heavy cream", "quantity": "0.75", "unit": "cup", "category": "Dairy"},
    {"name": "butter", "quantity": "2", "unit": "tbsp", "category": "Dairy"},
    {"name": "sugar", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "basmati rice", "quantity": "", "unit": "for serving", "category": "Grains"},
    {"name": "cilantro", "quantity": "", "unit": "for garnish", "category": "Produce"}
  ]'::jsonb,
  '[
    "Marinate chicken in yogurt + spices + ginger (even 5 min helps).",
    "Heat ghee in skillet. Sear chicken until golden. Remove.",
    "Cook onion, garlic, ginger until soft. Add spices + sugar.",
    "Add tomatoes, cook 2 min. Blend until smooth.",
    "Add cream + chicken back. Simmer covered 5-7 min.",
    "Off heat, stir in 2 tbsp butter. Serve over rice with cilantro."
  ]'::jsonb,
  'https://youtu.be/mrDJ2K3JXsA',
  NULL,
  'Joshua Weissman',
  'Even a 5-minute marinade makes a big difference in flavor.'
),

(
  'Falafel + Hummus + Tahini Sauce',
  'Middle Eastern',
  30,
  'Easy',
  '4',
  '[
    {"name": "dried chickpeas (soaked overnight)", "quantity": "225", "unit": "g", "category": "Protein"},
    {"name": "cumin", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "coriander", "quantity": "2", "unit": "tsp", "category": "Spices"},
    {"name": "Aleppo pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "garlic cloves (falafel)", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "small onion", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "parsley", "quantity": "0.25", "unit": "cup", "category": "Produce"},
    {"name": "dill", "quantity": "3", "unit": "tbsp", "category": "Produce"},
    {"name": "mint", "quantity": "3", "unit": "tbsp", "category": "Produce"},
    {"name": "lemon zest", "quantity": "2", "unit": "tsp", "category": "Produce"},
    {"name": "salt", "quantity": "2", "unit": "tsp", "category": "Spices"},
    {"name": "black pepper", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "baking powder", "quantity": "1", "unit": "tsp", "category": "Pantry"},
    {"name": "flour", "quantity": "3.5", "unit": "tbsp", "category": "Pantry"},
    {"name": "oil for cooking", "quantity": "", "unit": "as needed", "category": "Pantry"},
    {"name": "canned chickpeas (hummus)", "quantity": "12", "unit": "oz", "category": "Protein"},
    {"name": "garlic (hummus)", "quantity": "2", "unit": "cloves", "category": "Produce"},
    {"name": "lemon juice (hummus)", "quantity": "2", "unit": "tbsp", "category": "Produce"},
    {"name": "tahini (hummus)", "quantity": "0.33", "unit": "cup", "category": "Pantry"},
    {"name": "olive oil (hummus)", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "ice water (hummus)", "quantity": "0.25", "unit": "cup", "category": "Other"},
    {"name": "tahini (sauce)", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "lemon juice (sauce)", "quantity": "0.25", "unit": "cup", "category": "Produce"},
    {"name": "cumin (sauce)", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "garlic (sauce)", "quantity": "1", "unit": "clove", "category": "Produce"},
    {"name": "ice water (sauce)", "quantity": "0.25", "unit": "cup", "category": "Other"}
  ]'::jsonb,
  '[
    "Drain soaked chickpeas. Toast spices in dry pan. Pulse everything in food processor (not a paste). Add baking powder + flour.",
    "Shape into balls, refrigerate 30 min.",
    "Bake at 375°F for 15-20 min, flipping halfway (easiest for beginners).",
    "Blend hummus ingredients until smooth.",
    "Whisk tahini sauce ingredients.",
    "Serve in pita with hummus, tahini sauce, veggies."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=-98r0kpLbIM',
  NULL,
  'Basics with Babish',
  'Use dried chickpeas soaked overnight, NOT canned — canned chickpeas are too soft for falafel.'
),

(
  'Poblano Con Queso Tacos',
  'Mexican',
  15,
  'Easy',
  '1-2',
  '[
    {"name": "poblano peppers", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "Monterey Jack cheese", "quantity": "1", "unit": "block", "category": "Dairy"},
    {"name": "grape tomatoes", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "onion", "quantity": "0.5", "unit": "whole", "category": "Produce"},
    {"name": "chipotle pepper in adobo sauce", "quantity": "1", "unit": "whole", "category": "Sauces"},
    {"name": "fresh cilantro", "quantity": "1", "unit": "handful", "category": "Produce"},
    {"name": "lime juice", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "corn tortillas", "quantity": "3", "unit": "whole", "category": "Grains"},
    {"name": "oil", "quantity": "", "unit": "drizzle", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Set oven to high broil. Remove tops/seeds from poblanos.",
    "Stuff peppers with cheese sticks. Place on sheet pan with tomatoes and onion. Drizzle oil. Broil 5 min.",
    "Blend roasted onion + tomatoes + chipotle + cilantro + lime + salt into salsa.",
    "Chop roasted peppers. Cook in skillet until cheese melts and crisps. Lay tortillas on top, cover to steam 1-2 min.",
    "Flip tortillas onto plates, top with cheesy peppers and salsa."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=UIOW18kRDEA',
  NULL,
  'Ethan Chlebowski',
  'Watch the broiler closely — things can char in seconds.'
),

-- Filipino Recipes

(
  'Chicken Adobo',
  'Filipino',
  35,
  'Easy',
  '4',
  '[
    {"name": "chicken thighs (bone-in)", "quantity": "750", "unit": "g", "category": "Protein"},
    {"name": "garlic cloves, minced", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "soy sauce", "quantity": "0.33", "unit": "cup", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "0.33", "unit": "cup", "category": "Pantry"},
    {"name": "dried bay leaves", "quantity": "3", "unit": "whole", "category": "Spices"},
    {"name": "cooking oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "brown onion, diced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "water", "quantity": "1.5", "unit": "cups", "category": "Other"},
    {"name": "brown sugar", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "whole black peppercorns", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "green onions, sliced", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "steamed white rice", "quantity": "", "unit": "for serving", "category": "Grains"}
  ]'::jsonb,
  '[
    "Marinate chicken with garlic, soy sauce, vinegar, and bay leaves. Refrigerate at least 20 min (1-3 hours is ideal).",
    "Heat 1 tbsp oil in a large pan over high heat. Sear chicken 1-2 min per side until browned. Set aside.",
    "Add remaining oil. Sauté onion and garlic 1-2 min until fragrant.",
    "Pour in reserved marinade, water, brown sugar, and peppercorns. Scrape up browned bits. Simmer 5 min.",
    "Return chicken skin-side down. Simmer uncovered on medium 20-25 min, flipping at 15 min, until sauce reduces to a glaze.",
    "Serve over steamed rice, drenched in sauce, topped with sliced green onions."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=mtyULaM6RfQ',
  NULL,
  'Panlasang Pinoy',
  'Use chicken thighs, not breast — they stay juicy even if slightly overcooked. Don''t stir the vinegar when you first add it so it doesn''t turn bitter.'
),

(
  'Pancit Canton (Stir-Fried Noodles)',
  'Filipino',
  30,
  'Easy',
  '6',
  '[
    {"name": "dried pancit canton noodles", "quantity": "250", "unit": "g", "category": "Grains"},
    {"name": "pork, thinly sliced", "quantity": "115", "unit": "g", "category": "Protein"},
    {"name": "Chinese sausage (lap cheong), sliced", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "medium shrimp, peeled", "quantity": "8", "unit": "whole", "category": "Protein"},
    {"name": "snap peas, trimmed", "quantity": "10", "unit": "whole", "category": "Produce"},
    {"name": "carrot, julienned", "quantity": "0.75", "unit": "cup", "category": "Produce"},
    {"name": "cabbage, chopped", "quantity": "1", "unit": "small head", "category": "Produce"},
    {"name": "onion, sliced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic, minced", "quantity": "1", "unit": "tsp", "category": "Produce"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "oyster sauce", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "chicken broth", "quantity": "1.5", "unit": "cups", "category": "Pantry"},
    {"name": "water", "quantity": "0.75", "unit": "cup", "category": "Other"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Blanch snap peas, carrots, and cabbage in boiling water 35-50 sec. Transfer to ice bath. Drain and set aside.",
    "Heat oil in a wok over medium-high. Sauté onion 1 min, add garlic 30 sec.",
    "Add pork and Chinese sausage, cook 2 min until pork is browned.",
    "Pour in soy sauce and oyster sauce. Stir to coat.",
    "Add chicken broth and water. Season with salt and pepper. Bring to a boil, simmer 5-10 min.",
    "Add shrimp, cook 3 min until pink.",
    "Add dried noodles directly into the broth. Fold and stir until liquid is absorbed and noodles are tender (3-5 min).",
    "Toss in blanched vegetables. Stir 1-2 min. Serve."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=G1SZncDYXzw',
  NULL,
  'Panlasang Pinoy',
  'Do NOT pre-soak or boil the noodles — they cook directly in the broth so they absorb all the flavor.'
),

(
  'Sinangag (Filipino Garlic Fried Rice)',
  'Filipino',
  15,
  'Easy',
  '3-4',
  '[
    {"name": "cooked white rice (day-old, chilled)", "quantity": "4", "unit": "cups", "category": "Grains"},
    {"name": "garlic (1 head), minced", "quantity": "8", "unit": "cloves", "category": "Produce"},
    {"name": "neutral cooking oil", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Break up cold day-old rice with your hands or a fork. Separate all clumps so grains are loose.",
    "Heat oil in a wide skillet over LOW heat. Add minced garlic to the cool oil. Cook slowly, stirring, until golden and crispy (3-4 min).",
    "Remove 3/4 of the crispy garlic with a slotted spoon. Set aside on paper towel for garnish.",
    "Turn heat to HIGH. Add rice, spread in an even layer. Let sit 45 sec to sizzle, then toss. Repeat for 4-5 min until heated and toasty.",
    "Season with salt and pepper. Top with reserved crispy garlic.",
    "Serve alongside a fried egg, tocino, or any main dish."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=6sQA13xd0kY',
  NULL,
  'No Recipes',
  'Start garlic in cold oil, not hot — this gives you evenly crispy garlic instead of burnt bits. Day-old rice is essential.'
),

(
  'Bistek Tagalog (Filipino Beef Steak)',
  'Filipino',
  45,
  'Easy',
  '4-5',
  '[
    {"name": "beef sirloin, thinly sliced against the grain", "quantity": "900", "unit": "g", "category": "Protein"},
    {"name": "soy sauce", "quantity": "0.25", "unit": "cup", "category": "Sauces"},
    {"name": "lemon juice (or calamansi)", "quantity": "0.25", "unit": "cup", "category": "Produce"},
    {"name": "ground black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "large onions", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "water", "quantity": "1", "unit": "cup", "category": "Other"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "steamed white rice", "quantity": "", "unit": "for serving", "category": "Grains"}
  ]'::jsonb,
  '[
    "Marinate beef in soy sauce, lemon juice, and black pepper for at least 30 min (overnight is best).",
    "Slice 1 onion into rings, the other thinly. Heat 1 tbsp oil and fry onion rings until caramelized. Set aside.",
    "Drain beef, reserve marinade. Sear beef in 1 tbsp oil, about 1 min per side. Set aside.",
    "Add remaining oil. Sauté thin-sliced onion and garlic until soft.",
    "Pour in reserved marinade and water. Bring to a boil.",
    "Return beef. Cover and simmer on low 30-45 min until fork-tender, adding water if needed.",
    "Top with fried onion rings. Serve over steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=IiOnMsOJCYI',
  NULL,
  'Kawaling Pinoy',
  'Slice beef thin and against the grain for tender results. Ask your butcher to do it if you''re not confident.'
),

(
  'Pork Sinigang (Sour Tamarind Soup)',
  'Filipino',
  45,
  'Easy',
  '4-6',
  '[
    {"name": "pork spare ribs, cut into 2-inch pieces", "quantity": "900", "unit": "g", "category": "Protein"},
    {"name": "water", "quantity": "8", "unit": "cups", "category": "Other"},
    {"name": "tomatoes, quartered", "quantity": "2", "unit": "large", "category": "Produce"},
    {"name": "onion, quartered", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "fish sauce (patis)", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "tamarind soup base mix (sinigang mix)", "quantity": "1.5", "unit": "packets", "category": "Pantry"},
    {"name": "taro (gabi), peeled and halved", "quantity": "6", "unit": "pieces", "category": "Produce"},
    {"name": "daikon radish, sliced", "quantity": "1", "unit": "piece", "category": "Produce"},
    {"name": "finger chilies", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "long beans (sitaw), cut 3-inch", "quantity": "0.5", "unit": "bunch", "category": "Produce"},
    {"name": "Chinese eggplant, sliced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "okra, trimmed", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "bok choy or pechay", "quantity": "1", "unit": "bunch", "category": "Produce"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Place pork ribs in a large pot, cover with water. Bring to a boil and skim off scum for a clear broth.",
    "Add tomatoes, onion, and fish sauce. Lower heat and simmer covered 40 min until pork is tender.",
    "Add taro, cook 4-6 min. Then add chilies and daikon, simmer 2-3 min.",
    "Add long beans 2 min, then eggplant and okra 1-2 min.",
    "Dissolve tamarind soup base into the broth. Taste and adjust sourness.",
    "Season with salt and pepper. Add bok choy, cover, turn off heat. Let wilt 1-2 min.",
    "Serve hot with steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=WmfwqjdJH3Y',
  NULL,
  'Kawaling Pinoy',
  'Use tamarind soup base packets (like Knorr Sinigang mix from Asian grocery stores) — easiest option for beginners with authentic flavor. Add vegetables in stages so nothing gets mushy.'
),

(
  'Lumpia Shanghai (Filipino Spring Rolls)',
  'Filipino',
  25,
  'Easy',
  '5-6',
  '[
    {"name": "ground pork", "quantity": "680", "unit": "g", "category": "Protein"},
    {"name": "onions, minced", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "carrots, minced", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "garlic powder", "quantity": "1.5", "unit": "tsp", "category": "Spices"},
    {"name": "soy sauce", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "salt", "quantity": "1.5", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "sesame oil", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "lumpia (spring roll) wrappers", "quantity": "50", "unit": "sheets", "category": "Grains"},
    {"name": "cooking oil for deep frying", "quantity": "3", "unit": "cups", "category": "Pantry"},
    {"name": "sweet chili sauce", "quantity": "", "unit": "for dipping", "category": "Sauces"}
  ]'::jsonb,
  '[
    "Combine ground pork, onions, carrots, garlic, garlic powder, soy sauce, salt, pepper, sesame oil, and eggs. Mix thoroughly.",
    "Place 1-1.5 tbsp filling along the bottom edge of a wrapper. Fold sides inward, roll tightly. Dab water on top edge to seal.",
    "Heat 2-3 inches of oil in a deep pot to 350°F/175°C.",
    "Fry in batches 3-4 min, turning occasionally, until golden brown and crispy.",
    "Drain on a wire rack (not paper towels — keeps them crispier).",
    "Serve immediately with sweet chili sauce or vinegar-garlic dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=7lhbplkueu0',
  NULL,
  'Kawaling Pinoy',
  'Don''t overfill the wrappers — about 1 tbsp is the sweet spot. Roll tightly to prevent bursting. You can freeze uncooked lumpia and fry straight from frozen.'
),

(
  'Mechado (Filipino Beef Stew)',
  'Filipino',
  50,
  'Easy',
  '4',
  '[
    {"name": "beef chuck, cut into 2-inch cubes", "quantity": "1.5", "unit": "lb", "category": "Protein"},
    {"name": "tomato sauce", "quantity": "1", "unit": "8 oz can", "category": "Sauces"},
    {"name": "soy sauce", "quantity": "4", "unit": "tbsp", "category": "Sauces"},
    {"name": "lemon or calamansi juice", "quantity": "0.25", "unit": "cup", "category": "Produce"},
    {"name": "beef broth", "quantity": "1.5", "unit": "cups", "category": "Other"},
    {"name": "baking potato, peeled and cubed", "quantity": "1", "unit": "large", "category": "Produce"},
    {"name": "carrots, peeled and cut into 2-inch pieces", "quantity": "2", "unit": "medium", "category": "Produce"},
    {"name": "red bell pepper, cut into squares", "quantity": "1", "unit": "large", "category": "Produce"},
    {"name": "green bell pepper, cut into squares", "quantity": "1", "unit": "small", "category": "Produce"},
    {"name": "ripe tomato, cubed", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "red onion, chopped", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "dried bay leaves", "quantity": "2", "unit": "whole", "category": "Spices"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Combine beef cubes with soy sauce and lemon juice in a bowl. Marinate for at least 1 hour (overnight is best).",
    "Heat oil in a large pot or pressure cooker over medium-high heat. Sauté onion until translucent, about 2 min.",
    "Add garlic and cubed tomato. Cook 2-3 min until tomato softens and breaks down.",
    "Add marinated beef along with the marinade. Brown the beef on all sides, about 3-4 min.",
    "Pour in tomato sauce and beef broth. Stir well and bring to a boil.",
    "Add bay leaves. If using a pressure cooker, cover and cook 20-25 min. If using a regular pot, lower heat, cover, and simmer 1.5-2 hours until beef is fork-tender.",
    "Add potatoes and carrots. Cook uncovered on medium heat 8-10 min until vegetables are tender.",
    "Add bell peppers. Cook 2-3 min until tender-crisp.",
    "Season with salt and pepper. Discard bay leaves. Serve hot over steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=DQTzWfE6mZg',
  NULL,
  'Panlasang Pinoy',
  'A pressure cooker cuts braising time from 2 hours to 25 minutes. Marinate the beef overnight for maximum flavor. If you don''t have calamansi, regular lemon juice works great.'
),

(
  'Pinakbet (Filipino Vegetable Stew)',
  'Filipino',
  40,
  'Easy',
  '4-5',
  '[
    {"name": "pork belly, cut into 1-inch cubes", "quantity": "0.5", "unit": "lb", "category": "Protein"},
    {"name": "shrimp paste (bagoong alamang)", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "kabocha squash (kalabasa), peeled and cubed", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "okra, ends trimmed and halved", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "long beans (sitaw), cut into 3-inch lengths", "quantity": "0.5", "unit": "bunch", "category": "Produce"},
    {"name": "bitter melon (ampalaya), seeded and sliced", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "eggplant, cut into 1-inch pieces", "quantity": "1", "unit": "large", "category": "Produce"},
    {"name": "Roma tomatoes, chopped", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "onion, chopped", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "water", "quantity": "2", "unit": "cups", "category": "Other"},
    {"name": "cooking oil", "quantity": "1", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Heat oil in a large pot over medium heat. Sauté onion and garlic until softened, about 2 min.",
    "Add pork belly cubes. Cook 3-5 min, stirring occasionally, until lightly browned on all sides.",
    "Add shrimp paste (bagoong). Stir and cook 2 min until it starts to caramelize and become fragrant.",
    "Add chopped tomatoes. Cook 3-4 min, mashing with a spoon, until softened and juices release.",
    "Pour in water and bring to a boil. Lower heat, cover, and simmer 15-20 min until pork is tender. Keep about 1 cup of liquid — add more water if needed.",
    "Add squash (kalabasa). Cook 4 min until nearly tender.",
    "Add long beans and cook 2 min until tender-crisp.",
    "Add bitter melon, eggplant, and okra. Cook 4-5 min until all vegetables are tender but still have a slight bite.",
    "Season with salt and pepper to taste. Serve hot over steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=kqjPLRwQ71U',
  NULL,
  'Kawaling Pinoy',
  'Add vegetables in stages from hardest to softest — squash first, leafy greens last. This keeps everything perfectly cooked. If you can''t find bitter melon, just leave it out — the dish is still delicious without it.'
),

(
  'Lechon Kawali (Crispy Pork Belly)',
  'Filipino',
  50,
  'Medium',
  '6',
  '[
    {"name": "pork belly, skin on, whole slab", "quantity": "2", "unit": "lb", "category": "Protein"},
    {"name": "salt", "quantity": "2", "unit": "tbsp", "category": "Spices"},
    {"name": "whole black peppercorns", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "dried bay leaves", "quantity": "3", "unit": "whole", "category": "Spices"},
    {"name": "garlic head, crushed", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "water, enough to cover pork", "quantity": "6", "unit": "cups", "category": "Other"},
    {"name": "cooking oil for deep frying", "quantity": "3", "unit": "cups", "category": "Pantry"},
    {"name": "white vinegar (for brushing)", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "onion, minced (for dipping sauce)", "quantity": "0.25", "unit": "whole", "category": "Produce"},
    {"name": "chili pepper, chopped (for dipping sauce)", "quantity": "1", "unit": "whole", "category": "Produce"}
  ]'::jsonb,
  '[
    "Place pork belly in a large deep pot. Add garlic, 1 tbsp salt, peppercorns, bay leaves, and enough water to cover. Bring to a boil.",
    "Skim off any scum that floats to the top. Lower heat, cover, and simmer 45 min to 1 hour until pork is fork-tender but not falling apart.",
    "Remove pork from pot and discard liquid. Pat the pork completely dry with paper towels — this is crucial for crispy skin.",
    "Score the skin with a fork (poke holes all over). Brush the skin lightly with vinegar.",
    "Rub remaining 1 tbsp salt generously over the pork, especially the skin. Place on a wire rack and refrigerate uncovered for at least 4 hours (overnight is best) to dry the skin completely.",
    "When ready to fry, heat 3 cups oil in a deep pot or wok to 350°F (175°C). The oil should be deep enough to submerge the pork halfway.",
    "Carefully lower pork into hot oil, skin-side down first. Partially cover with a lid to reduce splatter — do NOT cover fully. Fry 7-10 min, turning occasionally, until skin is golden, puffed, and ultra-crispy.",
    "Remove pork and drain on a wire rack (not paper towels). Rest 5 min before slicing into pieces.",
    "Make dipping sauce: mix soy sauce, vinegar, minced onion, and chopped chili. Serve with the crispy pork."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=Z0Nxh1yACBQ',
  NULL,
  'Kawaling Pinoy',
  'The secret to super crispy skin is drying the pork uncovered in the fridge overnight. Pat it bone-dry before frying. Use a splatter guard or partially cover with a lid when frying — hot oil WILL pop. Never drop wet pork into hot oil.'
),

(
  'Pancit Bihon (Rice Noodle Stir-Fry)',
  'Filipino',
  40,
  'Easy',
  '8',
  '[
    {"name": "dried rice noodles (bihon)", "quantity": "8", "unit": "oz", "category": "Grains"},
    {"name": "chicken breast or thigh, sliced thinly", "quantity": "0.5", "unit": "lb", "category": "Protein"},
    {"name": "shrimp, peeled and deveined", "quantity": "0.5", "unit": "lb", "category": "Protein"},
    {"name": "chicken stock", "quantity": "4", "unit": "cups", "category": "Other"},
    {"name": "soy sauce", "quantity": "0.25", "unit": "cup", "category": "Sauces"},
    {"name": "large carrots, peeled and sliced thinly on a bias", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "celery stalks, sliced thinly on a bias", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "small cabbage, chopped", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "onion, sliced thinly", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "green onions, chopped", "quantity": "3", "unit": "stalks", "category": "Produce"},
    {"name": "vegetable oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "calamansi or lemon wedges", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Combine chicken stock and soy sauce in a pot, bring to a boil. Submerge rice noodles and cook 1-2 min, using tongs to loosen strands. Drain noodles and reserve 1.5-2 cups of the flavored liquid.",
    "Heat 1 tbsp oil in a large wok or skillet over high heat. Add shrimp, cook 1-2 min until pink. Remove and set aside on paper towels.",
    "In the same wok, cook chicken slices 3-5 min, stirring regularly, until lightly browned. Remove and set aside.",
    "Add remaining 1 tbsp oil. Sauté onion and garlic until softened, about 1 min.",
    "Add carrots and celery, stir-fry 30-40 seconds. Add cabbage, cook another 30-40 seconds. Vegetables should be tender-crisp.",
    "Return shrimp and chicken to the wok. Add parboiled noodles.",
    "Pour in reserved liquid in 0.5-cup increments. Gently toss and stir with tongs, adding more liquid as needed, until noodles are fully cooked but still firm and all liquid is absorbed.",
    "Season with salt and pepper to taste. Transfer to a serving platter.",
    "Garnish with chopped green onions. Serve with calamansi or lemon wedges for squeezing on top."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=rs8mpWy7XVg',
  NULL,
  'Kawaling Pinoy',
  'Parboil the noodles in the stock-soy sauce mixture first — this infuses flavor directly into the noodles. Add the reserved liquid gradually so you don''t end up with soggy noodles. Bihon noodles cook fast, so have everything prepped before you start.'
),

-- Filipino Comfort Dishes

(
  'Sisig (Sizzling Chopped Pork)',
  'Filipino',
  90,
  'Medium',
  '6',
  '[
    {"name": "pork belly", "quantity": "680", "unit": "g", "category": "Protein"},
    {"name": "onions, finely chopped", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "Thai chili peppers, chopped", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "long green peppers, chopped", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "calamansi or lime", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "cooking oil for deep frying", "quantity": "2", "unit": "cups", "category": "Pantry"},
    {"name": "liver spread", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "mayonnaise", "quantity": "0.5", "unit": "cup", "category": "Sauces"},
    {"name": "margarine or butter", "quantity": "0.25", "unit": "cup", "category": "Dairy"},
    {"name": "soy sauce", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "liquid seasoning (Knorr or Maggi)", "quantity": "1", "unit": "sachet", "category": "Sauces"},
    {"name": "ground black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"}
  ]'::jsonb,
  '[
    "Boil pork belly in water for 1 hour until tender. Drain and let cool completely.",
    "Deep fry pork belly in 2 cups oil until golden and crispy (8-10 min). Drain and chop into small cubes.",
    "Melt half the margarine in a pan. Sauté half the onions until soft, about 2 min.",
    "Add chopped pork, liquid seasoning, soy sauce, and black pepper. Stir 1 min.",
    "Add chili peppers, green peppers, mayonnaise, and liver spread. Mix until coated.",
    "Add remaining raw onions for crunch. Squeeze calamansi over top.",
    "Heat a cast iron plate until very hot. Melt remaining margarine, transfer sisig onto it. Serve sizzling with rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=kapD-91ZUH8',
  NULL,
  'Panlasang Pinoy',
  'Use pork belly instead of pig face for the beginner-friendly version. Liver spread from a can gives the same creamy depth as fresh liver but is much easier.'
),

(
  'Tinola (Chicken Ginger Soup)',
  'Filipino',
  60,
  'Easy',
  '6',
  '[
    {"name": "chicken (bone-in, serving pieces)", "quantity": "900", "unit": "g", "category": "Protein"},
    {"name": "green papaya or chayote, cut into wedges", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "malunggay leaves (or baby spinach)", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "garlic cloves, crushed and chopped", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "onion, sliced", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "ginger, julienned", "quantity": "3", "unit": "thumb-sized pieces", "category": "Produce"},
    {"name": "fish sauce (patis)", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "ground black pepper", "quantity": "0.125", "unit": "tsp", "category": "Spices"},
    {"name": "water", "quantity": "6", "unit": "cups", "category": "Other"},
    {"name": "chicken bouillon cube", "quantity": "1", "unit": "whole", "category": "Pantry"},
    {"name": "vegetable oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Heat oil in a large pot over medium heat. Sauté garlic, onion, and ginger 2-3 min until fragrant.",
    "Add chicken pieces. Cook 5 min, turning occasionally, until lightly browned.",
    "Pour in 6 cups water. Bring to a boil, then reduce heat to low. Cover and simmer 40 min until chicken is very tender.",
    "Skim any scum from the surface. Add bouillon cube, stir to dissolve.",
    "Add papaya or chayote wedges. Cover and cook 5 min until just tender.",
    "Add malunggay leaves and fish sauce. Cook 2 min until greens wilt. Serve hot with steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=pEMMBceYyMw',
  NULL,
  'Panlasang Pinoy',
  'If you can''t find malunggay leaves, baby spinach works great — add it at the very end. Chayote is easier to find than green papaya and works just as well.'
),

(
  'Arroz Caldo (Chicken Rice Porridge)',
  'Filipino',
  50,
  'Easy',
  '6',
  '[
    {"name": "chicken (bone-in, serving pieces)", "quantity": "450", "unit": "g", "category": "Protein"},
    {"name": "ginger, julienned", "quantity": "4", "unit": "thumb-sized pieces", "category": "Produce"},
    {"name": "onion, chopped", "quantity": "1", "unit": "large", "category": "Produce"},
    {"name": "garlic cloves (for sauté)", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, thinly sliced (for toasted topping)", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "green onions, chopped", "quantity": "0.25", "unit": "cup", "category": "Produce"},
    {"name": "jasmine rice", "quantity": "0.5", "unit": "cup", "category": "Grains"},
    {"name": "glutinous rice (sweet rice)", "quantity": "0.5", "unit": "cup", "category": "Grains"},
    {"name": "fish sauce (patis)", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "ground black pepper", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "chicken broth or water", "quantity": "6", "unit": "cups", "category": "Other"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "hard-boiled eggs, halved", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "calamansi or lemon wedges", "quantity": "4", "unit": "whole", "category": "Produce"}
  ]'::jsonb,
  '[
    "Fry sliced garlic slowly in 3 tbsp oil over low heat until golden and crispy (3-4 min). Remove and set aside. Keep the garlic oil in the pot.",
    "Sauté onion in the garlic oil until soft. Add ginger and crushed garlic, cook 1 min until fragrant.",
    "Add chicken pieces. Cook until lightly browned, about 3-4 min.",
    "Add both jasmine and glutinous rice. Stir 1 min to toast and coat in oil.",
    "Pour in 6 cups broth. Bring to a boil, then simmer on low 35-40 min, stirring every 5-7 min to prevent sticking.",
    "Season with fish sauce and pepper. Ladle into bowls, top with crispy garlic, hard-boiled egg, green onions, and calamansi wedges."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=3jUtOPlkZPo',
  NULL,
  'Panlasang Pinoy',
  'Stir every 5-7 minutes to prevent sticking. The mix of jasmine + glutinous rice gives the perfect texture — glutinous breaks down for creaminess while jasmine holds shape. Add more water if it gets too thick.'
),

(
  'Kare-Kare (Oxtail Peanut Stew)',
  'Filipino',
  180,
  'Medium',
  '4-5',
  '[
    {"name": "oxtail, cut into 2-inch slices", "quantity": "1.3", "unit": "kg", "category": "Protein"},
    {"name": "Chinese eggplant, sliced", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "string beans (sitaw), cut into 3-inch lengths", "quantity": "1", "unit": "bundle", "category": "Produce"},
    {"name": "bok choy (pechay)", "quantity": "1", "unit": "bundle", "category": "Produce"},
    {"name": "onion, chopped", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "peanut butter (creamy, unsweetened)", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "ground roasted peanuts", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "annatto seeds (atsuete)", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "toasted ground rice or rice flour", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "fish sauce (patis)", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "shrimp paste (bagoong alamang)", "quantity": "0.5", "unit": "cup", "category": "Sauces"},
    {"name": "water", "quantity": "6", "unit": "cups", "category": "Other"},
    {"name": "salt and pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Soak annatto seeds in 3/4 cup warm water for 15 min. Squeeze to release color, strain out seeds. Set aside.",
    "Boil oxtail in 6 cups water. Skim scum, then simmer covered 2.5-3 hours until fork-tender. Reserve the broth.",
    "In a separate pot, heat oil. Sauté garlic and onion 2 min. Add oxtail and fish sauce.",
    "Pour in 3-4 cups reserved broth. Add peanut butter and ground peanuts, stir until dissolved. Add annatto water.",
    "Add toasted rice flour, stir. Simmer 5-7 min until sauce thickens to a gravy.",
    "Cook vegetables separately: blanch eggplant, string beans, and bok choy until just tender.",
    "Arrange oxtail on a platter, top with vegetables. Serve with steamed rice and bagoong (shrimp paste) on the side."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=ll0lufTkGq4',
  NULL,
  'Panlasang Pinoy',
  'Don''t rush the oxtail — it must be fork-tender or it will be chewy. A pressure cooker cuts time to 35-40 min. Cook vegetables separately to keep them vibrant. The bagoong on the side is essential — salty-funky contrast with the sweet peanut sauce.'
),

-- Filipino Breakfast & Grilled Recipes

(
  'Tapsilog (Beef Tapa + Garlic Rice + Egg)',
  'Filipino',
  30,
  'Easy',
  '3',
  '[
    {"name": "beef sirloin, sliced thinly", "quantity": "1", "unit": "lb", "category": "Protein"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "garlic cloves, crushed", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "pineapple juice", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "brown sugar", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "ground white pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "cooked white rice (day-old, chilled)", "quantity": "5", "unit": "cups", "category": "Grains"},
    {"name": "garlic cloves, crushed (for rice)", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "salt (for rice)", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "eggs", "quantity": "3", "unit": "whole", "category": "Protein"},
    {"name": "cooking oil", "quantity": "6", "unit": "tbsp", "category": "Pantry"},
    {"name": "water", "quantity": "0.75", "unit": "cup", "category": "Other"},
    {"name": "white vinegar (for dipping)", "quantity": "3", "unit": "tbsp", "category": "Pantry"}
  ]'::jsonb,
  '[
    "BEEF TAPA: Place sliced beef in a large bowl. Add soy sauce, crushed garlic, pineapple juice, brown sugar, and white pepper. Mix well, cover, and refrigerate overnight (minimum 2 hours).",
    "GARLIC RICE: Heat 3 tbsp oil in a wide pan. Add 5 crushed garlic cloves and fry until light golden brown (2-3 min).",
    "Add day-old rice to the pan. Stir-fry for 3 min, breaking up clumps. Season with 1 tsp salt. Continue stir-frying 3-5 min until rice is hot and lightly toasted. Set aside and keep warm.",
    "COOK THE TAPA: Heat a pan over medium heat. Pour in marinated beef with all the marinade. Add 3/4 cup water. Bring to a boil, cover, and cook until liquid reduces by half (about 8-10 min).",
    "Add 2 tbsp oil to the pan. Continue cooking uncovered until liquid evaporates completely. Fry the beef until medium brown on both sides (3-5 min).",
    "FRY THE EGGS: In a separate pan, heat 1 tbsp oil per egg. Crack egg in, season with a pinch of salt. Add 2 tbsp water to the side of the pan, cover, and cook until the white is set but yolk is still slightly runny (about 1-2 min).",
    "PLATE IT: Arrange a mound of garlic rice, beef tapa, and a fried egg on each plate. Serve with a small dish of vinegar for dipping."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=E2uATy7iKkg',
  NULL,
  'Panlasang Pinoy',
  'Marinate the beef overnight for the best flavor. Use pineapple juice as a tenderizer — it breaks down tough fibers. Day-old rice is essential for sinangag; fresh rice turns mushy when fried.'
),

(
  'Skinless Longganisa (Filipino Sweet Sausage)',
  'Filipino',
  10,
  'Easy',
  '26 links',
  '[
    {"name": "ground pork", "quantity": "1.75", "unit": "lb", "category": "Protein"},
    {"name": "dark brown sugar", "quantity": "9", "unit": "tbsp", "category": "Pantry"},
    {"name": "smoked paprika", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "coarse salt", "quantity": "1.25", "unit": "tbsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "garlic (2 heads), peeled and minced", "quantity": "2", "unit": "heads", "category": "Produce"},
    {"name": "vegetable oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "water (for cooking)", "quantity": "1", "unit": "cup", "category": "Other"},
    {"name": "cooking oil (for frying)", "quantity": "4", "unit": "tbsp", "category": "Pantry"},
    {"name": "wax paper sheets", "quantity": "26", "unit": "sheets", "category": "Other"},
    {"name": "steamed white rice", "quantity": "", "unit": "for serving", "category": "Grains"},
    {"name": "fried egg", "quantity": "", "unit": "for serving", "category": "Protein"}
  ]'::jsonb,
  '[
    "Peel garlic cloves from 2 heads. Crush thoroughly using a mortar and pestle, then mince finely.",
    "In a large mixing bowl, combine ground pork, dark brown sugar, smoked paprika, coarse salt, ground black pepper, minced garlic, and 3 tbsp vegetable oil. Mix well with your hands until everything is evenly distributed.",
    "Cover the bowl with plastic wrap. Refrigerate for at least 2 hours (overnight is even better) to let the flavors meld and the mixture firm up.",
    "SHAPE THE SAUSAGES: Lay a sheet of wax paper on a flat surface. Scoop about 3 tablespoons of mixture onto the paper. Fold the wax paper over the mixture, then use a card or spatula to push and shape it into a sausage form (about 3-4 inches long). Repeat until all mixture is used.",
    "COOK: Place longganisa in a pan. Add 1 cup water and 4 tbsp cooking oil. Bring to a boil over medium heat.",
    "Reduce to the lowest heat setting. Let it simmer until all the water evaporates completely.",
    "Once the water is gone, fry both sides of the longganisa in the remaining oil until caramelized and brown (2-3 min per side).",
    "Serve hot with steamed rice and a fried egg (longsilog style). Pairs well with a vinegar-garlic dipping sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=xm0YBwkyzGo',
  NULL,
  'Panlasang Pinoy',
  'No casings needed — skinless longganisa is the easiest version for beginners. Refrigerate the mixture before shaping so it holds together. The water-then-fry method ensures the sausages cook through without burning.'
),

(
  'Tortang Talong (Eggplant Omelette)',
  'Filipino',
  15,
  'Easy',
  '4',
  '[
    {"name": "Chinese eggplant (long, slender variety)", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "large eggs", "quantity": "4", "unit": "whole", "category": "Protein"},
    {"name": "salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "banana ketchup", "quantity": "", "unit": "for serving", "category": "Sauces"},
    {"name": "steamed white rice", "quantity": "", "unit": "for serving", "category": "Grains"}
  ]'::jsonb,
  '[
    "CHAR THE EGGPLANT: Prick each eggplant a few times with a fork (prevents bursting). Place directly on a gas stovetop flame over high heat. Roast, turning occasionally with tongs, until the skin is evenly charred and the flesh is very soft (about 5-7 min per eggplant). If you don''t have a gas stove, broil in the oven at the highest setting for 10-12 min, turning once.",
    "Let the charred eggplants cool until you can handle them (about 3 min). Peel off all the blackened skin with your fingers. Rinse gently under cold water to remove any stray skin bits. Keep the stems intact — they act as handles.",
    "Lay each peeled eggplant on a plate. Using the back of a fork, gently flatten the eggplant into an even, fan-like shape. Don''t press too hard — you want it about 1/2 inch thick.",
    "In a shallow bowl, beat 1 egg with 1/4 tsp salt and a pinch of pepper until foamy. (Prepare one egg per eggplant.)",
    "Heat about 1 tbsp oil in a wide pan over medium heat. Holding the eggplant by the stem, dip it fully into the beaten egg, coating both sides.",
    "Quickly slide the egg-coated eggplant into the hot pan. Pour any remaining egg on top. Fry 2-3 min until the bottom is golden brown.",
    "Carefully flip and fry the other side for 2-3 min until golden. Repeat with remaining eggplants.",
    "Serve hot with banana ketchup and steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=hM24u0gRjIM',
  NULL,
  'Panlasang Pinoy',
  'Use Chinese/Japanese eggplant (the long, slender kind) — not the round globe variety. Charring over an open flame gives the best smoky flavor. Keep the stem on as a handle for dipping and flipping.'
),

(
  'Filipino Pork BBQ Skewers',
  'Filipino',
  15,
  'Easy',
  '6',
  '[
    {"name": "pork shoulder, sliced into thin 1-inch wide pieces", "quantity": "3", "unit": "lb", "category": "Protein"},
    {"name": "soy sauce", "quantity": "0.5", "unit": "cup", "category": "Sauces"},
    {"name": "banana ketchup", "quantity": "0.5", "unit": "cup", "category": "Sauces"},
    {"name": "lemon juice (or calamansi)", "quantity": "3", "unit": "tbsp", "category": "Produce"},
    {"name": "brown sugar", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "garlic powder", "quantity": "1", "unit": "tbsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "salt", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "lemon-lime soda (Sprite or 7-Up)", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "bamboo skewers (soaked in water 30 min)", "quantity": "20", "unit": "whole", "category": "Other"},
    {"name": "white vinegar (for dipping sauce)", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "garlic cloves, minced (for dipping sauce)", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "onion, finely chopped (for dipping sauce)", "quantity": "0.25", "unit": "whole", "category": "Produce"},
    {"name": "chili pepper, chopped (for dipping sauce)", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "steamed white rice", "quantity": "", "unit": "for serving", "category": "Grains"}
  ]'::jsonb,
  '[
    "MARINADE: In a large bowl, combine soy sauce, banana ketchup, lemon juice, brown sugar, garlic powder, black pepper, and salt. Stir until sugar dissolves (you can microwave for 1 min to help it dissolve).",
    "Add the lemon-lime soda to the marinade and stir gently. The soda helps tenderize the pork and adds a subtle sweetness.",
    "Add sliced pork to the marinade. Massage the meat to ensure every piece is well coated. Cover and refrigerate for at least 5 hours (overnight is best for maximum flavor).",
    "SOAK SKEWERS: At least 30 min before grilling, submerge bamboo skewers in water. This prevents them from burning on the grill.",
    "SKEWER: Thread 5-6 pieces of marinated pork onto each skewer, weaving them back and forth so they lay flat. Alternate lean and fatty pieces.",
    "BASTING SAUCE: Reserve some of the leftover marinade. Mix it with an extra splash of banana ketchup for basting while grilling.",
    "GRILL: Heat grill to medium heat. Place skewers on the grill and cook 5 min per side. Baste generously with sauce each time you flip. Repeat flipping and basting 2-3 times until pork is cooked through and slightly charred (about 15-20 min total).",
    "VINEGAR DIP: While grilling, combine vinegar, minced garlic, chopped onion, chili peppers, and a pinch of salt in a small bowl.",
    "Serve hot off the grill with steamed rice and the spicy vinegar dipping sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=UqKW7yZwyBg',
  NULL,
  'Panlasang Pinoy',
  'Marinate overnight for the best flavor — the soda tenderizes the pork beautifully. Soak bamboo skewers in water to prevent burning. Baste often while grilling to build up a sticky, caramelized glaze. If you don''t have a grill, a grill pan or oven broiler works too.'
);

-- Easy fried food recipes (18 recipes)
INSERT INTO recipes (name, cuisine, cook_time, difficulty, servings, ingredients, steps, youtube_url, image_url, source, tips)
VALUES

(
  'Spamsilog (Fried Spam + Garlic Rice + Egg)',
  'Filipino',
  15,
  'Easy',
  '2',
  '[
    {"name": "Spam (classic)", "quantity": "1", "unit": "can (12 oz)", "category": "Protein"},
    {"name": "cooked day-old rice", "quantity": "3", "unit": "cups", "category": "Grains"},
    {"name": "garlic cloves, minced", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Slice Spam into 6-8 pieces about 1/4 inch thick.",
    "Heat 1 tbsp oil in a pan over medium-high heat. Fry Spam slices 2-3 min per side until golden and crispy. Set aside on paper towels.",
    "SINANGAG (Garlic Rice): In the same pan, add 1 tbsp oil. Fry minced garlic over medium heat until golden and fragrant, about 1 min.",
    "Add day-old rice, break up clumps. Stir-fry 3-4 min until rice is heated through and coated with garlic. Season with salt.",
    "In a separate pan, fry eggs sunny-side up in remaining oil until whites are set but yolk is still runny.",
    "Plate: garlic rice on one side, Spam slices next to it, fried egg on top. Serve with banana ketchup or vinegar dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=plLgIKR4KCE',
  NULL,
  'Sam The Cooking Guy',
  'Use day-old rice for the best garlic fried rice — fresh rice turns mushy. You can also try Spam Lite or Spam with Tocino Seasoning for variety.'
),

(
  'Tocilog (Sweet Pork Tocino + Garlic Rice + Egg)',
  'Filipino',
  25,
  'Easy',
  '2',
  '[
    {"name": "pork belly or shoulder, thinly sliced", "quantity": "500", "unit": "g", "category": "Protein"},
    {"name": "brown sugar", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "pineapple juice", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "garlic cloves, minced", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "annatto powder (atsuete)", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "cooked day-old rice", "quantity": "3", "unit": "cups", "category": "Grains"},
    {"name": "garlic cloves, minced (for rice)", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"}
  ]'::jsonb,
  '[
    "MARINATE: Mix brown sugar, soy sauce, pineapple juice, garlic, salt, and annatto powder. Add sliced pork and marinate at least 1 hour (overnight is best).",
    "COOK TOCINO: Place marinated pork with all the marinade in a pan. Add 1/2 cup water. Bring to a boil over medium heat.",
    "Let water evaporate completely, then fry the pork in its own rendered fat for 2-3 min per side until caramelized and slightly charred.",
    "SINANGAG: In a separate pan, fry garlic in 1 tbsp oil until golden. Add rice, stir-fry 3-4 min. Season with salt.",
    "Fry eggs sunny-side up.",
    "Plate together: garlic rice, tocino, and fried egg. Serve with vinegar-garlic dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=x33Lf7dGbfc',
  NULL,
  'Panlasang Pinoy',
  'The boil-then-fry method is key — it cooks the pork through and creates a caramelized glaze. Overnight marination gives the best color and flavor. No annatto? Use paprika for color.'
),

(
  'Hotsilog (Fried Hotdog + Garlic Rice + Egg)',
  'Filipino',
  15,
  'Easy',
  '2',
  '[
    {"name": "Filipino-style red hotdogs", "quantity": "4", "unit": "whole", "category": "Protein"},
    {"name": "cooked day-old rice", "quantity": "3", "unit": "cups", "category": "Grains"},
    {"name": "garlic cloves, minced", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "banana ketchup", "quantity": "", "unit": "for serving", "category": "Sauces"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Score diagonal slits on each hotdog about 1/4 inch deep — this gives them the classic fanned look when fried.",
    "Heat 1 tbsp oil in a pan over medium heat. Fry hotdogs, turning occasionally, until heated through and slightly charred, about 4-5 min. Set aside.",
    "SINANGAG: In the same pan, fry garlic in 1 tbsp oil until golden. Add rice, stir-fry 3-4 min. Season with salt.",
    "Fry eggs sunny-side up in remaining oil.",
    "Plate: garlic rice, hotdogs, and fried egg. Serve with banana ketchup."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=bq1BaxFY0uw',
  NULL,
  'Panlasang Pinoy',
  'Filipino red hotdogs (like Tender Juicy) are sweeter than American ones — if you can''t find them, any hotdog works. Scoring the slits makes them curl and cook more evenly.'
),

(
  'Cornsilog (Corned Beef + Garlic Rice + Egg)',
  'Filipino',
  20,
  'Easy',
  '2',
  '[
    {"name": "canned corned beef", "quantity": "1", "unit": "can (12 oz)", "category": "Protein"},
    {"name": "potato, diced small", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "onion, diced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "cooked day-old rice", "quantity": "3", "unit": "cups", "category": "Grains"},
    {"name": "garlic cloves, minced (for rice)", "quantity": "4", "unit": "whole", "category": "Produce"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "cooking oil", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Heat 1 tbsp oil in a pan over medium heat. Fry diced potato until golden and cooked through, about 5-6 min. Remove and set aside.",
    "In the same pan, sauté garlic and onion until softened, about 2 min.",
    "Add corned beef, break it up with a spatula. Cook 3-4 min, stirring occasionally.",
    "Add fried potatoes back in. Season with pepper (careful with salt — corned beef is already salty). Mix well and cook 2 more min.",
    "SINANGAG: In a separate pan, fry garlic in 1 tbsp oil until golden. Add rice, stir-fry 3-4 min. Season with salt.",
    "Fry eggs sunny-side up.",
    "Plate together: garlic rice, corned beef hash, and fried egg."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=CBQV38d9-tQ',
  NULL,
  'Panlasang Pinoy',
  'Use chunky corned beef for better texture. The potatoes are optional but add a nice crispy contrast. Taste before adding salt — corned beef is already very salty.'
),

(
  'Ginisang Corned Beef (Filipino Corned Beef Hash)',
  'Filipino',
  15,
  'Easy',
  '2',
  '[
    {"name": "canned corned beef", "quantity": "1", "unit": "can (12 oz)", "category": "Protein"},
    {"name": "potato, diced", "quantity": "1", "unit": "medium", "category": "Produce"},
    {"name": "onion, chopped", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "cooking oil", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "water", "quantity": "2", "unit": "tbsp", "category": "Other"}
  ]'::jsonb,
  '[
    "Heat oil in a pan over medium heat. Fry diced potato until golden brown and crispy, about 5 min. Remove and drain on paper towels.",
    "In the same pan, sauté garlic until fragrant, about 30 sec. Add onion and cook until soft, about 2 min.",
    "Add corned beef. Break up with a spatula and stir-fry for 3-4 min.",
    "Add fried potatoes back in. Add water and pepper. Stir well and cook 2 more min.",
    "Serve hot over steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=gbuWPCakbWI',
  NULL,
  'Kawaling Pinoy',
  'This is the Filipino pantry staple meal — fast, cheap, and satisfying. Use chunky-style corned beef for better texture. Goes great with a fried egg on top.'
),

(
  'Spam Musubi',
  'Filipino',
  20,
  'Easy',
  '6',
  '[
    {"name": "Spam (classic)", "quantity": "1", "unit": "can (12 oz)", "category": "Protein"},
    {"name": "cooked sushi rice", "quantity": "4", "unit": "cups", "category": "Grains"},
    {"name": "nori seaweed sheets", "quantity": "3", "unit": "whole", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "brown sugar", "quantity": "2", "unit": "tbsp", "category": "Pantry"},
    {"name": "mirin", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "cooking oil", "quantity": "1", "unit": "tbsp", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Slice Spam lengthwise into 6 even pieces.",
    "Mix soy sauce, brown sugar, and mirin in a small bowl.",
    "Heat oil in a pan over medium-high heat. Fry Spam slices 2 min per side until golden and caramelized.",
    "Pour sauce into the pan. Flip Spam to coat each piece. Cook 30 sec more until glaze is sticky. Remove from heat.",
    "Cut nori sheets in half lengthwise. Lay a strip of nori shiny-side down.",
    "Use the empty Spam can as a mold: place on center of nori, press in a layer of rice, place a glazed Spam slice, press another layer of rice.",
    "Remove mold. Fold nori ends up and over the rice block, sealing with a dab of water. Flip seam-side down. Repeat for all 6.",
    "Slice in half or serve whole."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=D5Ef5AAi0LI',
  NULL,
  'Jessica Gavin',
  'Use the empty Spam can as a mold — just remove both ends. Wet your hands before pressing rice to prevent sticking. The soy-sugar glaze is what makes it addictive.'
),

(
  'Daing na Bangus (Fried Marinated Milkfish)',
  'Filipino',
  15,
  'Easy',
  '2',
  '[
    {"name": "bangus (milkfish), butterflied and deboned", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "white vinegar", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "garlic cloves, crushed", "quantity": "5", "unit": "whole", "category": "Produce"},
    {"name": "whole peppercorns, cracked", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil", "quantity": "0.25", "unit": "cup", "category": "Pantry"}
  ]'::jsonb,
  '[
    "MARINATE: Combine vinegar, crushed garlic, peppercorns, and salt in a container. Place butterflied bangus in the marinade, flesh-side down. Cover and refrigerate overnight (minimum 3 hours).",
    "Remove bangus from marinade. Pat dry with paper towels — this is key for crispy skin.",
    "Heat oil in a pan over medium heat. Place bangus skin-side down first. Fry 3-5 min until skin is golden and crispy.",
    "Flip carefully. Fry flesh side 3-4 min until cooked through.",
    "Serve with garlic fried rice, fried egg, and a spiced vinegar (sinamak) dipping sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=CAG5dcT2gis',
  NULL,
  'Kawaling Pinoy',
  'Pat the fish completely dry before frying — wet fish will splatter and won''t crisp. The vinegar marinade both flavors and preserves the fish. Overnight marination is best.'
),

(
  'Fried Tilapia with Toyomansi',
  'Filipino',
  15,
  'Easy',
  '2',
  '[
    {"name": "whole tilapia, cleaned and scaled", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "salt", "quantity": "2", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "calamansi juice (or lemon)", "quantity": "2", "unit": "tbsp", "category": "Produce"},
    {"name": "red onion, diced", "quantity": "1", "unit": "small", "category": "Produce"},
    {"name": "Thai chili (optional)", "quantity": "1", "unit": "whole", "category": "Produce"}
  ]'::jsonb,
  '[
    "TOYOMANSI DIP: Mix soy sauce, calamansi juice, diced onion, and sliced chili in a small bowl. Set aside.",
    "Pat tilapia dry. Rub salt all over the fish including inside the cavity.",
    "Heat oil in a pan over medium heat. The oil should be about 1/2 inch deep.",
    "Fry tilapia 5-6 min per side. Cover the pan but leave a gap for steam to escape. Don''t move the fish while frying — let a crust form.",
    "Flip carefully when the bottom is golden brown. Fry the other side until crispy.",
    "Drain on paper towels. Serve with toyomansi dip and steamed rice."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=abYQbPzsJ-c',
  NULL,
  'Panlasang Pinoy',
  'The #1 rule for crispy fried fish: pat it completely dry and make sure the oil is hot before adding the fish. Don''t flip too early — let it form a crust first. Calamansi is ideal but lemon works as a substitute.'
),

(
  'Calamares (Crispy Fried Squid)',
  'Filipino',
  15,
  'Easy',
  '2-3',
  '[
    {"name": "squid, cleaned and sliced into rings", "quantity": "500", "unit": "g", "category": "Protein"},
    {"name": "all-purpose flour", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "egg, beaten", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "breadcrumbs", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "garlic powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil (for deep frying)", "quantity": "2", "unit": "cups", "category": "Pantry"},
    {"name": "lemon wedges", "quantity": "2", "unit": "whole", "category": "Produce"}
  ]'::jsonb,
  '[
    "Clean squid: remove head, innards, and clear cartilage. Slice body into 1/2 inch rings. Pat dry.",
    "Set up breading station: flour mixed with salt, pepper, and garlic powder in one bowl, beaten egg in another, breadcrumbs in a third.",
    "Dredge squid rings in flour, dip in egg, then coat in breadcrumbs. Place on a tray.",
    "Heat oil to 350°F (175°C) in a deep pan.",
    "Fry squid in small batches for 2-3 min until golden brown. Don''t overcrowd the pan.",
    "Drain on paper towels. Serve immediately with lemon wedges and a garlic mayo or banana ketchup dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=nmV5c7tGlH8',
  NULL,
  'Panlasang Pinoy',
  'Don''t overcook squid — 2-3 min max or it gets rubbery. Fry in small batches to keep oil temperature steady. If you want extra tender squid, soak in milk for 30 min before breading.'
),

(
  'Shrimp Tempura',
  'Japanese',
  20,
  'Easy',
  '2-3',
  '[
    {"name": "large shrimp, peeled and deveined", "quantity": "500", "unit": "g", "category": "Protein"},
    {"name": "all-purpose flour", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "cornstarch", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "baking powder", "quantity": "0.5", "unit": "tsp", "category": "Pantry"},
    {"name": "egg", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "ice-cold water", "quantity": "1", "unit": "cup", "category": "Other"},
    {"name": "cooking oil (for deep frying)", "quantity": "3", "unit": "cups", "category": "Pantry"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"}
  ]'::jsonb,
  '[
    "Peel and devein shrimp, leaving tails on. Make small cuts on the belly side to prevent curling. Pat dry.",
    "Mix flour, cornstarch, baking powder, and salt in a bowl.",
    "Whisk egg and ice-cold water together. Pour into dry ingredients. Stir gently — lumpy batter is fine! Don''t overmix.",
    "Heat oil to 350°F (175°C).",
    "Hold shrimp by the tail, dip in batter, let excess drip off.",
    "Fry in small batches for 2-3 min until light golden and crispy. Drain on a wire rack.",
    "Serve immediately with soy sauce, tempura dipping sauce, or sweet chili sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=3tsOnvUhZ6I',
  NULL,
  'Pinoy Family Recipes',
  'The secret to crispy tempura: ice-cold water and don''t overmix the batter — lumps are your friend. Fry in small batches so the oil stays hot.'
),

(
  'Tokwa''t Baboy (Fried Tofu with Pork)',
  'Filipino',
  40,
  'Easy',
  '4',
  '[
    {"name": "pork belly", "quantity": "300", "unit": "g", "category": "Protein"},
    {"name": "firm tofu", "quantity": "1", "unit": "block (14 oz)", "category": "Protein"},
    {"name": "soy sauce", "quantity": "3", "unit": "tbsp", "category": "Sauces"},
    {"name": "white vinegar", "quantity": "3", "unit": "tbsp", "category": "Pantry"},
    {"name": "onion, diced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "Thai chili, sliced", "quantity": "2", "unit": "whole", "category": "Produce"},
    {"name": "sugar", "quantity": "1", "unit": "tsp", "category": "Pantry"},
    {"name": "bay leaves", "quantity": "2", "unit": "whole", "category": "Spices"},
    {"name": "peppercorns", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "water", "quantity": "4", "unit": "cups", "category": "Other"}
  ]'::jsonb,
  '[
    "BOIL PORK: Place pork belly in a pot with bay leaves, peppercorns, and water. Boil for 25-30 min until tender. Remove pork and let cool. Reserve 2 tbsp of the broth. Slice pork into bite-sized pieces.",
    "DEEP FRY TOFU: Cut tofu into cubes. Heat oil in a pan. Fry tofu until golden on all sides, about 5-6 min. Drain and set aside.",
    "In the same oil, fry boiled pork slices until crispy on the edges, about 3-4 min. Drain.",
    "SAUCE: Combine soy sauce, vinegar, sugar, reserved broth, diced onion, garlic, and sliced chili in a bowl. Mix well.",
    "Arrange fried tofu and pork on a plate. Pour sauce over the top. Serve immediately as a side dish or pulutan (bar snack)."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=bSB-qsLAJe8',
  NULL,
  'Kawaling Pinoy',
  'Classic Filipino pulutan (drinking snack). The soy-vinegar sauce is the star — adjust chili to your spice level. Fry the tofu until really golden for the best texture contrast.'
),

(
  'Crispy Kangkong (Water Spinach Fritters)',
  'Filipino',
  15,
  'Easy',
  '2-3',
  '[
    {"name": "kangkong (water spinach) leaves", "quantity": "2", "unit": "bunches", "category": "Produce"},
    {"name": "all-purpose flour", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "cornstarch", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "baking powder", "quantity": "0.5", "unit": "tsp", "category": "Pantry"},
    {"name": "egg", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "ice-cold water", "quantity": "0.5", "unit": "cup", "category": "Other"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "garlic powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil (for deep frying)", "quantity": "2", "unit": "cups", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Wash kangkong leaves and dry thoroughly — wet leaves will splatter in oil. Pick leaves off the stems.",
    "Mix flour, cornstarch, baking powder, salt, and garlic powder.",
    "Whisk egg with ice-cold water. Pour into dry mix and stir until just combined. Batter should be thin enough to coat leaves.",
    "Heat oil to 350°F (175°C).",
    "Dip kangkong leaves in batter, shake off excess. Fry in batches for 1-2 min until crispy and light golden.",
    "Drain on paper towels. Serve immediately with garlic mayo or spiced vinegar dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=H8GQFL1V6_8',
  NULL,
  'Yummy PH',
  'Make sure leaves are bone dry before battering — water and hot oil don''t mix. Use ice-cold water or soda water in the batter for extra crispiness. Eat immediately — they lose their crunch fast.'
),

(
  'Ukoy (Shrimp and Vegetable Fritters)',
  'Filipino',
  20,
  'Easy',
  '3-4',
  '[
    {"name": "small shrimp (shell-on)", "quantity": "200", "unit": "g", "category": "Protein"},
    {"name": "cornstarch", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "all-purpose flour", "quantity": "0.25", "unit": "cup", "category": "Pantry"},
    {"name": "mung bean sprouts (togue)", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "egg", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "baking powder", "quantity": "0.5", "unit": "tsp", "category": "Pantry"},
    {"name": "water", "quantity": "0.5", "unit": "cup", "category": "Other"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil (for deep frying)", "quantity": "2", "unit": "cups", "category": "Pantry"},
    {"name": "spiced vinegar", "quantity": "", "unit": "for dipping", "category": "Sauces"}
  ]'::jsonb,
  '[
    "Mix cornstarch, flour, baking powder, salt, and pepper in a bowl.",
    "Add egg and water. Whisk until smooth batter forms.",
    "Add bean sprouts and shrimp to the batter. Mix gently.",
    "Heat oil in a deep pan over medium-high heat.",
    "Scoop a spoonful of the mixture, making sure to include shrimp and sprouts. Carefully drop into hot oil.",
    "Flatten slightly with the back of the spoon. Fry 2-3 min per side until golden and crispy.",
    "Drain on paper towels. Serve with spiced vinegar (sinamak) dipping sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=Eei6b8GFCqI',
  NULL,
  'Panlasang Pinoy',
  'Use small shrimp with shells on — the shells get crispy and add texture. Make sure each fritter has at least one shrimp on top for presentation. Serve immediately while hot and crunchy.'
),

(
  'Turon (Banana Spring Rolls)',
  'Filipino',
  15,
  'Easy',
  '6',
  '[
    {"name": "saba bananas (or plantains), halved lengthwise", "quantity": "6", "unit": "whole", "category": "Produce"},
    {"name": "ripe jackfruit, sliced", "quantity": "1", "unit": "cup", "category": "Produce"},
    {"name": "brown sugar", "quantity": "1.5", "unit": "cups", "category": "Pantry"},
    {"name": "lumpia wrappers (spring roll wrappers)", "quantity": "12", "unit": "whole", "category": "Pantry"},
    {"name": "cooking oil (for deep frying)", "quantity": "2", "unit": "cups", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Roll each banana half in brown sugar to coat generously.",
    "Lay a lumpia wrapper flat. Place a sugar-coated banana and a few strips of jackfruit near one edge.",
    "Roll tightly, tucking in the sides as you go. Seal the edge with a dab of water.",
    "Repeat for all bananas.",
    "Heat oil in a pan over medium heat. Sprinkle 2-3 tbsp of remaining brown sugar into the oil — it will caramelize.",
    "Fry turon in batches for 2-3 min, turning once, until wrapper is golden and sugar is caramelized.",
    "Drain on a wire rack (not paper towels — they''ll stick). Serve warm."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=4QeQ4O6WHkc',
  NULL,
  'Panlasang Pinoy',
  'Saba bananas are ideal — they hold up to frying. If using regular bananas, pick firm ones. Adding sugar to the oil creates that signature caramel glaze. Use a wire rack to drain, not paper towels.'
),

(
  'Lumpiang Gulay (Vegetable Spring Rolls)',
  'Filipino',
  25,
  'Easy',
  '4-5',
  '[
    {"name": "mung bean sprouts", "quantity": "500", "unit": "g", "category": "Produce"},
    {"name": "firm tofu, cubed and fried", "quantity": "200", "unit": "g", "category": "Protein"},
    {"name": "cabbage, shredded", "quantity": "2", "unit": "cups", "category": "Produce"},
    {"name": "carrot, julienned", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "onion, diced", "quantity": "1", "unit": "whole", "category": "Produce"},
    {"name": "garlic cloves, minced", "quantity": "3", "unit": "whole", "category": "Produce"},
    {"name": "soy sauce", "quantity": "1", "unit": "tbsp", "category": "Sauces"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "spring roll wrappers", "quantity": "20", "unit": "whole", "category": "Pantry"},
    {"name": "cooking oil", "quantity": "2", "unit": "cups", "category": "Pantry"}
  ]'::jsonb,
  '[
    "FILLING: Heat 1 tbsp oil in a pan. Sauté garlic and onion until soft. Add cabbage and carrot, cook 2-3 min.",
    "Add bean sprouts and fried tofu. Season with soy sauce, salt, and pepper. Cook 2 min. Drain excess liquid. Let cool.",
    "WRAP: Place 2-3 tbsp of filling on a wrapper. Fold bottom up, fold sides in, then roll tightly. Seal edge with a dab of water.",
    "Repeat for all wrappers.",
    "Heat oil to 350°F (175°C). Fry spring rolls in batches for 3-4 min, turning once, until golden brown.",
    "Drain on paper towels. Serve with a sweet chili sauce or vinegar-garlic dip."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=M9UE0BwxLGI',
  NULL,
  'Panlasang Pinoy',
  'Drain the filling well before wrapping — wet filling makes soggy lumpia. Roll tightly so they don''t open while frying. Fry from frozen if making ahead — no need to thaw.'
),

(
  'Filipino Breaded Pork Chop',
  'Filipino',
  15,
  'Easy',
  '2-3',
  '[
    {"name": "pork chops", "quantity": "3", "unit": "whole", "category": "Protein"},
    {"name": "egg, beaten", "quantity": "1", "unit": "whole", "category": "Protein"},
    {"name": "all-purpose flour", "quantity": "0.75", "unit": "cup", "category": "Pantry"},
    {"name": "Panko breadcrumbs", "quantity": "1", "unit": "cup", "category": "Pantry"},
    {"name": "soy sauce", "quantity": "2", "unit": "tbsp", "category": "Sauces"},
    {"name": "calamansi juice (or lemon)", "quantity": "1", "unit": "tbsp", "category": "Produce"},
    {"name": "garlic powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "salt", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil", "quantity": "0.5", "unit": "cup", "category": "Pantry"}
  ]'::jsonb,
  '[
    "MARINATE: Combine soy sauce, calamansi juice, and garlic powder. Marinate pork chops for at least 15 min (1 hour is better).",
    "Set up breading station: flour with salt and pepper in one plate, beaten egg in a bowl, Panko breadcrumbs in another plate.",
    "Dredge each pork chop in flour, dip in egg, then press into breadcrumbs to coat evenly.",
    "Heat oil in a pan over medium heat (about 1/4 inch deep).",
    "Pan-fry pork chops 4-5 min per side until golden brown and cooked through (internal temp 145°F / 63°C).",
    "Drain on paper towels. Serve with steamed rice and banana ketchup."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=T_y4tiYz7qU',
  NULL,
  'Panlasang Pinoy',
  'Pound the pork chops to even thickness so they cook uniformly. Panko breadcrumbs give a crunchier coating than regular breadcrumbs. Let the breaded chops rest 5 min before frying so the coating adheres better.'
),

(
  'Homemade Chicken Nuggets',
  'American',
  30,
  'Easy',
  '3-4',
  '[
    {"name": "chicken breast", "quantity": "500", "unit": "g", "category": "Protein"},
    {"name": "all-purpose flour", "quantity": "0.5", "unit": "cup", "category": "Pantry"},
    {"name": "Panko breadcrumbs", "quantity": "1.5", "unit": "cups", "category": "Pantry"},
    {"name": "eggs, beaten", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "garlic powder", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "onion powder", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "paprika", "quantity": "0.5", "unit": "tsp", "category": "Spices"},
    {"name": "salt", "quantity": "1", "unit": "tsp", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "0.25", "unit": "tsp", "category": "Spices"},
    {"name": "cooking oil (for frying)", "quantity": "2", "unit": "cups", "category": "Pantry"}
  ]'::jsonb,
  '[
    "Cut chicken breast into bite-sized nugget pieces (about 1.5 inches).",
    "Mix flour with garlic powder, onion powder, paprika, salt, and pepper in a bowl.",
    "Set up breading station: seasoned flour, beaten eggs, Panko breadcrumbs.",
    "Dredge each chicken piece in flour, dip in egg, coat in Panko. Press firmly so crumbs stick.",
    "Heat oil to 350°F (175°C) in a deep pan.",
    "Fry nuggets in batches for 4-5 min, turning once, until golden brown and cooked through.",
    "Drain on a wire rack. Serve with ketchup, honey mustard, or sweet chili sauce."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=qDRrXpKCk8M',
  NULL,
  'Joshua Weissman',
  'Double-breading (flour → egg → flour → egg → Panko) gives an extra crunchy coating. Don''t overcrowd the pan or the oil temperature drops and nuggets get greasy. These freeze well — reheat in oven at 400°F for 10 min.'
),

(
  'Fried Egg Sandwich',
  'American',
  10,
  'Easy',
  '1',
  '[
    {"name": "bread or burger bun", "quantity": "2", "unit": "slices", "category": "Grains"},
    {"name": "eggs", "quantity": "2", "unit": "whole", "category": "Protein"},
    {"name": "cheese slices", "quantity": "2", "unit": "whole", "category": "Dairy"},
    {"name": "ham or bacon", "quantity": "2", "unit": "slices", "category": "Protein"},
    {"name": "butter", "quantity": "1", "unit": "tbsp", "category": "Dairy"},
    {"name": "salt", "quantity": "", "unit": "to taste", "category": "Spices"},
    {"name": "ground black pepper", "quantity": "", "unit": "to taste", "category": "Spices"}
  ]'::jsonb,
  '[
    "Melt butter in a pan over medium heat. Toast bread or bun cut-side down for 1 min until golden. Set aside.",
    "In the same pan, fry ham or bacon until crispy, about 2 min per side. Set aside.",
    "Crack eggs into the pan. Season with salt and pepper. Fry until whites are set — runny or over-easy for best sandwich results.",
    "Place cheese on the egg while still in the pan so it melts slightly.",
    "Assemble: bottom bun, ham/bacon, cheesy egg, top bun. Serve immediately."
  ]'::jsonb,
  'https://www.youtube.com/watch?v=S-TmmjEN-V0',
  NULL,
  'Joshua Weissman',
  'The key is a runny yolk that acts as sauce when you bite in. Use medium heat — too hot and the egg whites get rubbery before the yolk warms up. Any cheese works but American or provolone melts best.'
);
