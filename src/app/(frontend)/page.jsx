import Image from 'next/image'
import { getPayload } from 'payload'
import config from '@payload-config'

export default async function Home() {
  const payload = await getPayload({ config })
  const heroImg = await payload
    .findGlobal({
      slug: 'hero',
      depth: 2,
      showHiddenFields: true,
    })
    .then((data) => data.image)

  return (
    <main>
      <section className="grid gap-2 py-2">
        <Image
          src={'http://localhost:3000' + heroImg.url}
          alt={heroImg.alt}
          width={heroImg.width}
          height={heroImg.height}
        />
        <h1 className="font-accent text-4xl font-bold tracking-tighter uppercase">Hello</h1>
      </section>
    </main>
  )
}
