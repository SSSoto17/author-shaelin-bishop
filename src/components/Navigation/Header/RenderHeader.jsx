import { getPayload } from 'payload'
import config from '@payload-config'
import Link from 'next/link'

function Logo() {
  return (
    <Link href="/" className="font-logo text-lg uppercase hover:opacity-60">
      Shaelin Bishop
    </Link>
  )
}

export async function Nav({ children }) {
  const payload = await getPayload({ config })

  const nav = await payload.findGlobal({
    slug: 'header',
    depth: 2,
    showHiddenFields: true,
  })

  return (
    <header className="sticky top-0 full-bleed bg-neutral-50 drop-shadow-md">
      {children}
      <NavBar {...nav} />
    </header>
  )
}

function NavBar({ items }) {
  return (
    <nav className="grid grid-cols-[auto_1fr] items-center justify-items-end gap-2xl justify-self-stretch py-2xs">
      <Logo />
      <ul className="flex flex-wrap gap-x-l font-logo tracking-tight">
        {items.map((item, id) => {
          return (
            <li key={id}>
              <Link href={item.page.slug}>{item.page.title}</Link>
            </li>
          )
        })}
      </ul>
    </nav>
  )
}

export function Footer() {
  return (
    <footer className="full-bleed bg-accent-500 p-1 font-accent text-accent-50">
      <p>Footer content</p>
    </footer>
  )
}
