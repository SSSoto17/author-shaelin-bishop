import { getPayload } from 'payload'
import config from '@payload-config'

import { draftMode } from 'next/headers'
import { cache } from 'react'

export const getPageBySlug = cache(async (slug) => {
  const payload = await getPayload({ config })
  const { isEnabled: isDraft } = await draftMode()

  const page = await payload
    .find({
      collection: 'pages',
      depth: 3,
      limit: 1,
      draft: isDraft,
      where: {
        slug: {
          equals: slug,
        },
      },
    })
    .then((data) => data.docs[0])

  return page
})
