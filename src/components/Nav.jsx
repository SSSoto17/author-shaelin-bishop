import Link from 'next/link'
import { getPayload } from 'payload'
import config from '@payload-config'

function Logo() {
  return (
    <Link href="/" className="font-logo text-lg uppercase hover:opacity-60">
      Shaelin Bishop
    </Link>
  )
}

export async function Nav() {
  const payload = await getPayload({ config })
  const nav = await payload
    .findGlobal({
      slug: 'header',
      depth: 2,
      showHiddenFields: true,
    })
    .then((data) => data.items)

  return (
    <header className="sticky top-0 full-bleed bg-neutral-50 p-1">
      <nav className="flex items-center justify-between">
        <Logo />
        <ul className="flex gap-4 font-logo tracking-tight">
          {nav.map((item, id) => {
            return (
              <li key={id}>
                <Link href={item.page.path}>{item.page.title}</Link>
              </li>
            )
          })}
        </ul>
      </nav>
    </header>
  )
}

export function Footer() {
  return (
    <footer className="full-bleed bg-accent-500 p-1 font-accent text-accent-50">
      <p>Footer content</p>
    </footer>
  )
}
