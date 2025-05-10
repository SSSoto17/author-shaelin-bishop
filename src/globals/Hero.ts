import { GlobalConfig } from 'payload'
// import { TestBlock } from './Blocks'

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
    // TestBlock,
  ],
}
