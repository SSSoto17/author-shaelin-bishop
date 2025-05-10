import { getPayload } from 'payload'
import config from '@payload-config'

import Image from 'next/image'
import { ConsoleLogWriter } from '@payloadcms/db-postgres/drizzle'
import { redirect } from 'next/navigation'

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

const getPageBySlug = async (slug) => {
  const payload = await getPayload({ config })
  const page = await payload
    .find({
      collection: 'pages',
      depth: 2,
      limit: 1,
      where: {
        slug: {
          equals: slug,
        },
      },
    })
    .then((data) => data.docs[0])

  return page
}

export default async function Page({ params }) {
  const { slug = 'home' } = await params
  const url = '/' + slug

  let page = await getPageBySlug(url)

  if (!page) {
    return redirect(url)
  }

  return (
    <main className="full-bleed">
      <h2 className="font-accent text-2xl font-extrabold">{page.title}</h2>
      <Hero />
    </main>
  )
}

async function Hero() {
  const payload = await getPayload({ config })
  const heroImg = await payload
    .findGlobal({
      slug: 'hero',
      depth: 2,
      showHiddenFields: true,
    })
    .then((data) => data.image)

  console.log(heroImg)

  return (
    <section className="full-bleed">
      <Image
        src={heroImg.sizes.screen.url}
        alt={heroImg.alt}
        width={heroImg.sizes.screen.width}
        height={heroImg.sizes.screen.height}
        className="full-bleed h-screen object-cover"
      />
      <article className="grid gap-1 py-2">
        <h1 className="font-accent text-5xl leading-6 font-extrabold tracking-tighter uppercase">
          Nanum Gothic Coding
        </h1>
        <h2 className="text-xl font-extrabold">Nanum Myeongjo</h2>
        <p className="max-w-prose tracking-wide">
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad vitae, voluptatibus
          repellendus enim, maiores vel animi neque id magni dolores adipisci accusantium cupiditate
          ipsa est, excepturi dolorum. Et, eligendi repellendus!
        </p>{' '}
      </article>
    </section>
  )
}
