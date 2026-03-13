import { Skeleton } from '@/components/ui/skeleton'

export default function GroceryLoading() {
  return (
    <div className="space-y-6">
      <div>
        <Skeleton className="h-9 w-44" />
        <Skeleton className="mt-1 h-5 w-64" />
      </div>

      <Skeleton className="h-10 w-48" />

      <div className="space-y-4">
        {Array.from({ length: 3 }, (_, i) => (
          <div key={i}>
            <Skeleton className="mb-2 h-5 w-24" />
            <div className="space-y-2">
              {Array.from({ length: 4 }, (_, j) => (
                <div key={j} className="flex items-center gap-3">
                  <Skeleton className="h-5 w-5 rounded" />
                  <Skeleton className="h-4 flex-1" />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
