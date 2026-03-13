'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { UtensilsCrossed, CalendarDays, ShoppingCart, Home } from 'lucide-react'
import { cn } from '@/lib/utils'

const links = [
  { href: '/', label: 'Dashboard', icon: Home },
  { href: '/recipes', label: 'Recipes', icon: UtensilsCrossed },
  { href: '/calendar', label: 'Calendar', icon: CalendarDays },
  { href: '/grocery', label: 'Grocery', icon: ShoppingCart },
]

export function Nav() {
  const pathname = usePathname()

  return (
    <nav className="border-b bg-white">
      <div className="mx-auto flex h-14 max-w-5xl items-center gap-6 px-4">
        <Link href="/" className="text-lg font-bold">
          Cook
        </Link>
        <div className="flex gap-1">
          {links.map(({ href, label, icon: Icon }) => (
            <Link
              key={href}
              href={href}
              className={cn(
                'flex items-center gap-2 rounded-md px-3 py-2 text-sm font-medium transition-colors hover:bg-gray-100',
                pathname === href
                  ? 'bg-gray-100 text-gray-900'
                  : 'text-gray-500'
              )}
            >
              <Icon className="h-4 w-4" />
              {label}
            </Link>
          ))}
        </div>
      </div>
    </nav>
  )
}
