import { GlobalConfig } from 'payload'

export const Hero: GlobalConfig = {
  slug: 'hero',
  access: { read: () => true },
  fields: [
    {
      name: 'image',
      type: 'relationship',
      relationTo: 'media',
      required: true,
    },
  ],
}
