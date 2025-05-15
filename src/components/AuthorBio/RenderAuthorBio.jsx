import Image from 'next/image'

export default function AuthorBio({ image, headline, description, images }) {
  const { alt, sizes } = image
  const { imageGroup, imagesTitle } = images
  return (
    <>
      <section className="grid gap-x-xl gap-y-m py-xl sm:grid-cols-2 lg:grid-cols-3">
        <Image
          src={sizes.card.url}
          alt={alt}
          width={sizes.card.width}
          height={sizes.card.height}
          className="place-self-stretch object-cover sm:order-2"
        />
        <article className="grid place-content-center flow-space lg:col-span-2">
          <h2 className="text-3xl font-black text-balance">{headline}</h2>
          <p className="max-w-prose text-lg text-pretty">{description}</p>
        </article>
      </section>
      <section className="grid grid-cols-3 gap-x-l place-self-stretch py-m">
        <Image
          src={imageGroup[0].sizes.card.url}
          alt={imageGroup[0].alt}
          width={imageGroup[0].sizes.card.width}
          height={imageGroup[0].sizes.card.height}
          className="row-span-2 max-h-140 object-cover"
        />
        <Image
          src={imageGroup[1].sizes.card.url}
          alt={imageGroup[1].alt}
          width={imageGroup[1].sizes.card.width}
          height={imageGroup[1].sizes.card.height}
          className="max-h-80 object-cover"
        />
        <h2 className="col-span-2 text-4xl font-bold text-balance">{imagesTitle}</h2>
      </section>

      <section className="grid grid-cols-2 gap-x-l py-3xl">
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem voluptates
          molestiae voluptas repellat doloribus. Voluptate pariatur minima quod saepe? Consectetur
          provident labore aliquid, assumenda quas quis error molestias ex impedit!
        </p>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Cumque reiciendis nam
          repudiandae soluta facilis.
        </p>
      </section>
    </>
  )
}
