import { Field } from 'payload'
import { AuthorBio } from './AuthorBio/AuthorBio'

export const Sections: Field = {
  name: 'sections',
  type: 'blocks',
  minRows: 1,
  maxRows: 20,
  blocks: [AuthorBio],
}
