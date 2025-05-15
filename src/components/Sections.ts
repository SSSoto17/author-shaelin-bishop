import { Field } from 'payload'
import { AuthorBio } from './AuthorBio/ConfigAuthorBio'
import { Newsletter } from './Newsletter/ConfigNewsletter'

export const Sections: Field = {
  name: 'sections',
  type: 'blocks',
  minRows: 1,
  maxRows: 20,
  blocks: [AuthorBio, Newsletter],
}
