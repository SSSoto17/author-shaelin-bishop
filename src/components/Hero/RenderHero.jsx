export default function RenderHero({ type, image }) {
  const heroImg = `url(${image?.sizes.screen.url})`

  if (type !== 'none')
    return (
      <section style={{ backgroundImage: heroImg }} className="full-bleed py-4 text-neutral-50">
        {type === 'highImpact' && <HighImpact />}
        {type === 'lowImpact' && <LowImpact />}
        {type === 'banner' && <Banner />}
      </section>
    )

  return null
}

// LARGE HERO
function HighImpact() {
  return (
    <article className="grid gap-1 py-2">
      <h1 className="font-accent text-5xl leading-6 font-extrabold tracking-tighter uppercase">
        Nanum Gothic Coding
      </h1>
      <h2 className="text-xl font-extrabold">Nanum Myeongjo</h2>
      <p className="max-w-prose tracking-wide">
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad vitae, voluptatibus repellendus
        enim, maiores vel animi neque id magni dolores adipisci accusantium cupiditate ipsa est,
        excepturi dolorum. Et, eligendi repellendus!
      </p>
    </article>
  )
}

// SMALL HERO
function LowImpact() {
  return (
    <article className="grid gap-1 justify-self-end py-2">
      <h1 className="font-accent text-2xl leading-2 font-extrabold tracking-tighter">
        Nanum Gothic Coding
      </h1>
      <p className="max-w-prose tracking-wide">
        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolores labore molestias provident
        voluptas earum, minus magni quas sapiente recusandae saepe doloribus cumque ratione
        inventore aut placeat expedita dolorum vitae. Optio?
      </p>
    </article>
  )
}

// BANNER
function Banner() {
  return (
    <article>
      <h1>Banner</h1>
    </article>
  )
}
