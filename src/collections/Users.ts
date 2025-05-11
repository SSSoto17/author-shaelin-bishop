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
      saveToJWT: true,
      name: 'role',
      type: 'select',
      options: ['admin', 'user'],
    },
  ],
}
