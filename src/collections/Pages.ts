import { TestBlock } from '@/app/blocks/Sections'
import type { CollectionConfig, Field } from 'payload'

const PageTitle: Field = {
  name: 'title',
  label: 'Page Title',
  type: 'text',
  required: true,
  unique: true,
}

const PageSlug: Field = {
  name: 'slug',
  type: 'text',
  required: true,
  unique: true,
  hooks: {
    beforeValidate: [
      ({ value, data }) => {
        const string = value || (data?.title !== 'Home' ? data?.title : '')
        const slugified = string.replaceAll(' ', '-').toLowerCase()

        return value?.includes('/') ? slugified : '/' + slugified
      },
    ],
  },
}

const PageTabs: Field = {
  type: 'tabs',
  tabs: [
    {
      name: 'pageLayout',
      fields: [
        {
          name: 'Sections',
          type: 'blocks',
          required: false,
          blocks: [TestBlock],
        },
      ],
    },
  ],
}

export const Pages: CollectionConfig = {
  slug: 'pages',
  admin: {
    useAsTitle: 'title',
  },
  labels: { plural: 'Pages', singular: 'Page' },
  versions: { drafts: true },
  access: {
    read: () => true,
  },
  fields: [PageTitle, PageSlug, PageTabs],
}
