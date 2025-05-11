export default function RenderContent({ content }) {
  return content.map((section, id) => {
    return (
      <section key={id}>
        <p>{section.headline}</p>
      </section>
    )
  })
}
