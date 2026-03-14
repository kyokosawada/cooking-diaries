'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { Input } from '@/components/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

const cuisines = [
  'All',
  'American',
  'Brazilian/Indian',
  'Chinese',
  'Chinese-American',
  'Filipino',
  'French/American',
  'Indian',
  'Italian',
  'Italian-American',
  'Japanese',
  'Korean',
  'Mediterranean',
  'Mexican',
  'Middle Eastern',
  'Thai',
]

const difficulties = ['All', 'Easy', 'Medium']

export function RecipeFilters() {
  const router = useRouter()
  const searchParams = useSearchParams()

  function updateParam(key: string, value: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (value && value !== 'All') {
      params.set(key, value)
    } else {
      params.delete(key)
    }
    router.push(`/recipes?${params.toString()}`)
  }

  return (
    <div className="flex flex-col gap-3 sm:flex-row">
      <Input
        placeholder="Search your recipes..."
        defaultValue={searchParams.get('q') ?? ''}
        onChange={(e) => updateParam('q', e.target.value)}
        className="sm:max-w-xs"
      />
      <Select
        defaultValue={searchParams.get('cuisine') ?? 'All'}
        onValueChange={(v) => updateParam('cuisine', v)}
      >
        <SelectTrigger className="sm:w-48">
          <SelectValue placeholder="Cuisine" />
        </SelectTrigger>
        <SelectContent>
          {cuisines.map((c) => (
            <SelectItem key={c} value={c}>
              {c}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
      <Select
        defaultValue={searchParams.get('difficulty') ?? 'All'}
        onValueChange={(v) => updateParam('difficulty', v)}
      >
        <SelectTrigger className="sm:w-40">
          <SelectValue placeholder="Difficulty" />
        </SelectTrigger>
        <SelectContent>
          {difficulties.map((d) => (
            <SelectItem key={d} value={d}>
              {d}
            </SelectItem>
          ))}
        </SelectContent>
      </Select>
    </div>
  )
}
