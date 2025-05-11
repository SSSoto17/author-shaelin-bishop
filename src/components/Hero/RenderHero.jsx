import { getPayload } from 'payload'
import config from '@payload-config'

import Image from 'next/image'

export default async function Hero({ alt, sizes }) {
  // const payload = await getPayload({ config })

  return (
    <section className="full-bleed">
      <Image
        src={sizes.screen.url}
        alt={alt}
        width={sizes.screen.width}
        height={sizes.screen.height}
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
