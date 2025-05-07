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
    <main className="full-bleed">
      <section className="full-bleed">
        <Image
          src={'http://localhost:3000' + heroImg.url}
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
            repellendus enim, maiores vel animi neque id magni dolores adipisci accusantium
            cupiditate ipsa est, excepturi dolorum. Et, eligendi repellendus!
          </p>{' '}
        </article>
      </section>
    </main>
  )
}
