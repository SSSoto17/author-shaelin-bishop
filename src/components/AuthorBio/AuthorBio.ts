import { Block } from 'payload'

export const AuthorBio: Block = {
  slug: 'bio',
  fields: [
    {
      name: 'image',
      type: 'relationship',
      relationTo: 'media',
    },
    {
      name: 'headline',
      type: 'text',
    },
    {
      name: 'description',
      type: 'richText',
    },
  ],
}
