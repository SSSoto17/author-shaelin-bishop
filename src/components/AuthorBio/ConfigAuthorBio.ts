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
      type: 'textarea',
    },
    {
      type: 'group',
      name: 'images',
      fields: [
        { name: 'imageGroup', type: 'upload', relationTo: 'media', hasMany: true },
        {
          name: 'imagesTitle',
          type: 'text',
        },
      ],
    },
  ],
}
