import type { CollectionConfig, Field } from 'payload'
import { Sections } from '@/components/Sections'
import { Hero } from '@/components/Hero/ConfigHero'

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
        const string = value || data?.title
        const slugified = string.replaceAll(' ', '-').toLowerCase()

        return slugified.includes('/') ? slugified : '/' + slugified
      },
    ],
  },
}

const ViewPage: Field = {
  name: 'viewPage',
  type: 'ui',
  label: 'Go To Page',
  admin: {
    position: 'sidebar',
    components: {
      Field: {
        path: '@/components/ViewPageButton',
        clientProps: {
          label: 'Go to Page',
        },
      },
    },
  },
}

const PageTabs: Field = {
  type: 'tabs',
  tabs: [
    {
      label: 'Hero',
      fields: [Hero],
    },
    {
      label: 'Content',
      fields: [Sections],
    },
  ],
}

export const Pages: CollectionConfig = {
  slug: 'pages',
  admin: {
    useAsTitle: 'title',
    preview: ({ slug }) => `/preview?slug=${slug}`,
    livePreview: {
      url: ({ data }) => '/preview?slug=' + data.slug,
    },
    defaultColumns: ['title', 'slug', 'status', 'updatedAt'],
  },
  labels: { plural: 'Pages', singular: 'Page' },
  versions: {
    drafts: {
      autosave: {
        interval: 100,
      },
    },
  },
  access: {
    read: ({ req }) => {
      if (req.user) return true
      return {
        status: {
          equals: 'published',
        },
      }
    },
  },
  fields: [PageTitle, PageSlug, ViewPage, PageTabs],
}
