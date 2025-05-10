import { getPayload } from 'payload'
import config from '@payload-config'

import Image from 'next/image'
import MiniBio from '@/components/AuthorBio'

export async function generateStaticParams() {
  const payload = await getPayload({ config })
  const pages = await payload
    .find({
      collection: 'pages',
      depth: 2,
    })
    .then((data) => data.docs)

  return pages.map((page) => ({
    slug: [page.slug],
  }))
}

export default async function Page({ params }) {
  const { slug } = await params
  // const payload = await getPayload({ config })

  // const pages = await payload
  //   .find({
  //     collection: 'pages',
  //     depth: 2,
  //     where: {
  //       slug: { equals: slug ? '/' + slug[0] : '/' },
  //     },
  //   })
  //   .then((data) => data.docs)

  // const pageDetails = pages[0]

  return (
    <main className="full-bleed">
      {/* <h2 className="font-accent text-2xl font-extrabold">{pageDetails.title}</h2> */}
      <Hero />
      {/* <MiniBio /> */}
    </main>
  )
}

const endpoint = process.env.REST_API

async function Hero() {
  const payload = await getPayload({ config })
  const heroImg = await payload
    .findGlobal({
      slug: 'hero',
      depth: 2,
      showHiddenFields: true,
    })
    .then((data) => data.image)
  return (
    <section className="full-bleed">
      <Image
        src={endpoint + heroImg.url}
        alt={heroImg.alt}
        width={heroImg.width}
        height={heroImg.height}
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
