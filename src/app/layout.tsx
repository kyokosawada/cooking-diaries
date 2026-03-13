import type { Metadata } from 'next'
import { Caveat, Lora } from 'next/font/google'
import './globals.css'
import { Nav } from '@/components/nav'

const caveat = Caveat({ subsets: ['latin'], weight: ['400', '700'], variable: '--font-caveat' })
const lora = Lora({ subsets: ['latin'], weight: ['400', '500', '600', '700'], variable: '--font-lora' })

export const metadata: Metadata = {
  title: 'Cooking Diary — Personal Cooking Guide',
  description: 'Your personal recipe journal, meal planner, and grocery list',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={`${caveat.variable} ${lora.variable} font-serif`}>
        <Nav />
        <main className="mx-auto max-w-5xl px-4 py-6">
          {children}
        </main>
      </body>
    </html>
  )
}
