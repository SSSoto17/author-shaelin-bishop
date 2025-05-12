import { getPayload } from 'payload'
import config from '@payload-config'
import { headers as getHeaders, cookies } from 'next/headers'
import Link from 'next/link'

import { MdCompassCalibration, MdEdit, MdFolder, MdPerson, MdLogout } from 'react-icons/md'
import { getPage } from '@/lib/PageQueries'

function Logo() {
  return (
    <Link href="/" className="font-logo text-lg uppercase hover:opacity-60">
      Shaelin Bishop
    </Link>
  )
}

export async function Nav({ page }) {
  const headers = await getHeaders()
  const payload = await getPayload({ config })

  const { user } = await payload.auth({ headers })
  console.log(user)

  const nav = await payload.findGlobal({
    slug: 'header',
    depth: 2,
    showHiddenFields: true,
  })

  return (
    <header className="sticky top-0 full-bleed bg-neutral-50">
      {user && <AdminBar page={page} {...user} />}
      <NavBar {...nav} />
    </header>
  )
}

function NavBar({ items }) {
  return (
    <nav className="grid grid-cols-[auto_1fr] items-center justify-items-end gap-4 justify-self-stretch py-1">
      <Logo />
      <ul className="flex flex-wrap gap-x-4 font-logo tracking-tight">
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

async function AdminBar({ page, email, userName, role }) {
  const { id } = await getPage({ id: true }, { slug: { equals: `/${page}` } })

  return (
    <section className="full-bleed bg-neutral-900 py-0.5 font-accent text-neutral-50">
      <nav className="grid grid-cols-[auto_1fr] items-center justify-items-end gap-4 justify-self-stretch">
        <Link href="/admin" className="flex items-center gap-1">
          <MdCompassCalibration size={20} />
          <p>
            {userName || email} <span className="font-logo">|</span> {role}
          </p>
        </Link>
        <ul className="flex gap-2">
          <li className="relative flex items-center gap-0.5">
            <Link href={`/admin/collections/pages/${id}`} className="after:absolute after:inset-0">
              Edit Page
            </Link>
            <MdEdit size={16} />
          </li>
          <li className="relative flex items-center gap-0.5">
            <Link href={`/admin/collections/media`} className="after:absolute after:inset-0">
              Media Library
            </Link>
            <MdFolder size={16} />
          </li>
          <li className="relative flex items-center gap-0.5">
            <Link href={`/admin/account`} className="after:absolute after:inset-0">
              Account
            </Link>
            <MdPerson size={16} />
          </li>
          <li className="relative flex items-center gap-0.5">
            <Link href={`/admin/logout`} className="after:absolute after:inset-0">
              Logout
            </Link>
            <MdLogout size={16} />
          </li>
        </ul>
      </nav>
    </section>
  )
}

export function Footer() {
  return (
    <footer className="full-bleed bg-accent-500 p-1 font-accent text-accent-50">
      <p>Footer content</p>
    </footer>
  )
}
