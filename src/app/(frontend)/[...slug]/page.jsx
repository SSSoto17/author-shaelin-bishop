import { getPayload } from 'payload'
import config from '@payload-config'

import { headers, draftMode } from 'next/headers'
import { redirect } from 'next/navigation'
import { cache } from 'react'

import { RefreshRouteOnSave } from './RefreshRouteOnSave'
import RenderHero from '@/components/Hero/RenderHero'

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

const getPageBySlug = cache(async (slug) => {
  const payload = await getPayload({ config })
  const { isEnabled } = await draftMode()

  const page = await payload
    .find({
      collection: 'pages',
      depth: 2,
      limit: 1,
      draft: isEnabled,
      where: {
        slug: {
          equals: slug,
        },
      },
    })
    .then((data) => data.docs[0])

  return page
})

export default async function Page({ params }) {
  const { slug = 'home' } = await params
  const url = '/' + slug
  let page = await getPageBySlug(url)

  if (!page) {
    return redirect('/')
  }

  const { title, hero } = page

  return (
    <main className="full-bleed">
      <RefreshRouteOnSave />
      <RenderHero {...hero} />
      <h2 className="font-accent text-2xl font-extrabold">{title}</h2>
    </main>
  )
}
