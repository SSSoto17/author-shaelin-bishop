import type { CollectionConfig } from 'payload'

export const Media: CollectionConfig = {
  slug: 'media',
  access: {
    read: () => true,
  },
  fields: [
    {
      name: 'alt',
      type: 'text',
      required: true,
    },
  ],
  upload: {
    staticDir: 'media',
    imageSizes: [
      {
        name: 'thumbnail',
        width: 400,
        height: 300,
        fit: 'cover',
        position: 'centre',
      },
      {
        name: 'screen',
        width: 2048,
        fit: 'cover',
        position: 'centre',
        formatOptions: { format: 'webp' },
      },
      {
        name: 'card',
        width: 648,
        height: 1024,
        fit: 'cover',
        formatOptions: { format: 'webp' },
      },
    ],
    adminThumbnail: 'thumbnail',
  },
}
