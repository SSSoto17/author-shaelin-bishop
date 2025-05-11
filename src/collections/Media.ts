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
      defaultValue: 'Alt text pending',
    },
  ],
  upload: {
    staticDir: 'media',
    formatOptions: { format: 'webp' },
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
      },
      {
        name: 'card',
        width: 648,
        height: 1024,
        fit: 'cover',
      },
    ],
    adminThumbnail: 'thumbnail',
  },
}
