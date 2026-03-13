# Cook — Personal Cooking Guide & Planner

## Overview
A personal Next.js web app that helps a cooking beginner decide what to cook, shows how to cook it with verified recipes and YouTube video guides, and organizes meals on a calendar.

## Core Features

### 1. Recipe Library
- Browse pre-loaded beginner recipes (~25 to start)
- Each recipe includes: name, cuisine tag, cook time, difficulty, ingredients list, step-by-step instructions, YouTube video link
- Search and filter by cuisine, cook time, difficulty
- Recipes are sourced from established cooking channels and cross-referenced for accuracy

### 2. Meal Calendar
- Weekly/monthly view
- Slot recipes into lunch or dinner for any day
- Flexible — fill in whenever, no rigid schedule required
- Dashboard shows current week's plan at a glance

### 3. Grocery List
- Select a date range to generate a shopping list
- Aggregates all ingredients from planned meals
- Check off items as you buy them
- Combines duplicate ingredients across meals

## Technical Architecture

### Stack
- **Next.js 14 (App Router)** — React framework with server components
- **Supabase** — Postgres database + file storage (no auth, personal app)
- **Tailwind CSS** — Styling
- **shadcn/ui** — UI component library

### Database Tables
- `recipes` — name, cuisine, cook_time, difficulty, ingredients (JSON), steps (JSON), youtube_url, image_url
- `meal_plan` — date, meal_type (lunch/dinner), recipe_id
- `grocery_items` — name, quantity, unit, checked, meal_plan_id

### Pages
- `/` — Dashboard with this week's meal plan
- `/recipes` — Browse/search/filter recipe library
- `/recipes/[id]` — Full recipe view with embedded video, ingredients, steps
- `/calendar` — Monthly/weekly calendar to plan meals
- `/grocery` — Generated grocery list from planned meals

## Recipe Research Approach
- Source from established beginner YouTube channels (Joshua Weissman, Basics with Babish, RecipeTin Eats, etc.)
- Cross-reference ingredients and quantities against multiple sources
- Include YouTube link as primary guide — written recipe matches the video
- Keep measurements explicit — no vague amounts
- Present all recipes for user review before loading into app

## Project Phases

### Phase 1 — Recipe Research
Deep research ~25 beginner recipes across cuisines (Asian, Western, Mediterranean, etc.). Each verified with ingredients, steps, and YouTube link. Present for review/approval.

### Phase 2 — Build the App
Set up Next.js + Supabase + Tailwind + shadcn/ui. Build core pages: recipe library, recipe detail with embedded video, meal calendar, grocery list generator.

### Phase 3 — Load Recipes & Polish
Seed approved recipes into database. Final UI polish and testing.
