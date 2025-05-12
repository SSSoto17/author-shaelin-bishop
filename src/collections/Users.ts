import type { CollectionConfig } from 'payload'

export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  auth: {
    cookies: {
      secure: false,
    },
  },
  fields: [
    // Email added by default
    // Add more fields as needed
    {
      name: 'userName',
      label: 'Name',
      type: 'text',
    },
    {
      name: 'role',
      type: 'select',
      options: [
        { label: 'Admin', value: 'Admin' },
        { label: 'User', value: 'User' },
      ],
      defaultValue: 'User',
      required: true,
    },
  ],
}
