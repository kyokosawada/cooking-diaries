import { Skeleton } from '@/components/ui/skeleton'
import { Card, CardContent, CardHeader } from '@/components/ui/card'

export default function DashboardLoading() {
  return (
    <div className="space-y-6">
      <div>
        <Skeleton className="h-9 w-48" />
        <Skeleton className="mt-1 h-5 w-64" />
      </div>

      <div className="grid gap-4 sm:grid-cols-3">
        {Array.from({ length: 3 }, (_, i) => (
          <Card key={i}>
            <CardHeader className="flex flex-row items-center justify-between pb-2">
              <Skeleton className="h-4 w-20" />
              <Skeleton className="h-4 w-4 rounded" />
            </CardHeader>
            <CardContent>
              <Skeleton className="h-9 w-12" />
              <Skeleton className="mt-1 h-3 w-28" />
            </CardContent>
          </Card>
        ))}
      </div>

      <div>
        <Skeleton className="mb-3 h-7 w-40" />
        <Card>
          <CardContent className="py-8">
            <Skeleton className="mx-auto h-4 w-48" />
          </CardContent>
        </Card>
      </div>

      <div>
        <Skeleton className="mb-3 h-7 w-32" />
        <div className="grid grid-cols-4 gap-2 sm:grid-cols-7">
          {Array.from({ length: 7 }, (_, i) => (
            <div key={i} className="rounded-xl border p-2 text-center">
              <Skeleton className="mx-auto h-3 w-8" />
              <Skeleton className="mx-auto mt-1 h-7 w-6" />
              <Skeleton className="mx-auto mt-1 h-3 w-12" />
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
