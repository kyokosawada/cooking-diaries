import { Skeleton } from '@/components/ui/skeleton'

export default function CalendarLoading() {
  return (
    <div className="space-y-6">
      <div>
        <Skeleton className="h-9 w-48" />
        <Skeleton className="mt-1 h-5 w-72" />
      </div>

      <div className="flex items-center justify-between">
        <Skeleton className="h-8 w-8 rounded" />
        <Skeleton className="h-6 w-40" />
        <Skeleton className="h-8 w-8 rounded" />
      </div>

      <div className="space-y-3">
        {Array.from({ length: 7 }, (_, i) => (
          <div key={i} className="rounded-xl border p-4">
            <div className="flex items-center justify-between mb-3">
              <Skeleton className="h-5 w-32" />
            </div>
            <div className="grid gap-2 sm:grid-cols-2">
              <Skeleton className="h-16 rounded-lg" />
              <Skeleton className="h-16 rounded-lg" />
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
