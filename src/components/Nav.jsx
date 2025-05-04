import Link from 'next/link'
import { getPayload } from 'payload'
import config from '@payload-config'

export async function Nav() {
  const payload = await getPayload({ config })
  const nav = await payload
    .findGlobal({
      slug: 'header', // required
      depth: 2,
    })
    .then((data) => data.items)

  return (
    <header className="full-bleed bg-slate-400 p-1">
      <nav className="flex gap-6">
        {nav.map((item, id) => {
          return (
            <Link key={id} href={item.page.path}>
              {item.page.title}
            </Link>
          )
        })}
      </nav>
    </header>
  )
}

export function Footer() {
  return (
    <footer className="full-bleed bg-slate-400 p-1">
      <p>Footer content</p>
    </footer>
  )
}
