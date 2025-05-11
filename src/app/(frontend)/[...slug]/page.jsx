import { getPayload } from 'payload'
import config from '@payload-config'

import { redirect } from 'next/navigation'
import { RefreshRouteOnSave } from './RefreshRouteOnSave'
import { getPageBySlug } from 'src/lib/queries'

import RenderHero from '@/components/Hero/RenderHero'
import RenderContent from '@/components/RenderContent'

export async function generateStaticParams() {
  const payload = await getPayload({ config })
  const pages = await payload
    .find({
      collection: 'pages',
      depth: 2,
      limit: 1000,
      pagination: false,
      select: {
        slug: true,
      },
    })
    .then((data) => data.docs)

  return pages
    .filter((page) => page.slug !== 'home')
    .map((page) => ({
      slug: [page.slug],
    }))
}

export default async function Page({ params }) {
  const { slug = 'home' } = await params
  const url = '/' + slug
  const page = await getPageBySlug(url)

  if (!page) {
    return redirect('/')
  }

  const { title, hero, sections } = page

  return (
    <main className="full-bleed">
      <RefreshRouteOnSave />
      <RenderHero {...hero} />
      <h2 className="font-accent text-2xl font-extrabold">{title}</h2>
      <RenderContent content={sections} />
    </main>
  )
}
