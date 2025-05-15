export default function AuthorBio() {
  return (
    <>
      <section className="gap-x-xl gap-y-m py-xl grid sm:grid-cols-2 lg:grid-cols-3">
        <Image
          src={sizes.card.url}
          alt={alt}
          width={sizes.card.width}
          height={sizes.card.height}
          className="place-self-stretch object-cover sm:order-2"
        />
        <article className="flow-space grid place-content-center lg:col-span-2">
          <h2 className="text-3xl font-black text-balance">{headline}</h2>
          <p className="max-w-prose text-lg text-pretty">{description}</p>
        </article>
      </section>
      <section className="gap-x-l py-m grid grid-cols-3 place-self-stretch">
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

      <section className="gap-x-l py-3xl grid grid-cols-2">
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
