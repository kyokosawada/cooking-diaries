import { supabase } from '@/lib/supabase/client'
import { NextRequest, NextResponse } from 'next/server'

export async function POST(request: NextRequest) {
  const { items, dateStart, dateEnd } = await request.json()

  // Clear existing items for this date range
  await supabase
    .from('grocery_items')
    .delete()
    .eq('date_range_start', dateStart)
    .eq('date_range_end', dateEnd)

  // Insert new items
  const rows = items.map((item: { name: string; quantity: string; unit: string; category: string }) => ({
    name: item.name,
    quantity: item.quantity,
    unit: item.unit,
    category: item.category,
    checked: false,
    date_range_start: dateStart,
    date_range_end: dateEnd,
  }))

  const { data, error } = await supabase.from('grocery_items').insert(rows).select()

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json(data)
}

export async function PATCH(request: NextRequest) {
  const { id, checked } = await request.json()
  const { error } = await supabase
    .from('grocery_items')
    .update({ checked })
    .eq('id', id)

  if (error) return NextResponse.json({ error: error.message }, { status: 400 })
  return NextResponse.json({ success: true })
}
