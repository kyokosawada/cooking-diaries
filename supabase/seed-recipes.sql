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
);
