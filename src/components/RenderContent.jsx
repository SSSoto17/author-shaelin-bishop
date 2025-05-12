import AuthorBio from './AuthorBio/RenderAuthorBio'

export default function RenderContent({ content }) {
  return content.map((section, id) => {
    console.log(section)
    return section.blockType === 'bio' && <AuthorBio key={id} {...section} />
  })
}
