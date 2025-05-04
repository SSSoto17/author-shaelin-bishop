import Link from 'next/link'

const url = process.env.REST_API
const endpoint = '/api/globals/header?depth=2&draft=false&locale=undefined'

export async function Nav() {
  const navItems = await fetch(url + endpoint)
    .then((res) => res.json())
    .then((data) => data.items)

  return (
    <header className="full-bleed bg-slate-400 p-1">
      <nav className="flex gap-6">
        {navItems.map((item, id) => {
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
