import { Block, CollectionConfig } from 'payload'

export const TestBlock: Block = {
  slug: 'Test',
  fields: [
    {
      name: 'Image',
      type: 'relationship',
      relationTo: 'media',
    },
    {
      name: 'Test field',
      type: 'text',
    },
  ],
}

export const ExampleCollection: CollectionConfig = {
  slug: 'example-collection',
  fields: [
    {
      name: 'layout', // required
      type: 'blocks', // required
      minRows: 1,
      maxRows: 20,
      blocks: [
        // required
        TestBlock,
      ],
    },
  ],
}
