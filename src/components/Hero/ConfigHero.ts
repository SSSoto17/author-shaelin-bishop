import { Field } from 'payload'

const Type: Field = {
  name: 'type',
  type: 'select',
  options: ['High Impact', 'Low Impact', 'Banner', 'None'],
  defaultValue: 'None',
}

const Image: Field = {
  admin: {
    condition: (siblingData) => {
      return siblingData.hero.type == 'None' ? false : true
    },
  },
  name: 'image',
  type: 'relationship',
  relationTo: 'media',
  required: true,
}

export const Hero = {
  name: 'hero',
  fields: [Type, Image],
}
