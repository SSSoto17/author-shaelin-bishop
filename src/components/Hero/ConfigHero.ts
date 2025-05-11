import { Field } from 'payload'

const Type: Field = {
  name: 'type',
  type: 'select',
  required: true,
  options: [
    {
      label: 'High Impact',
      value: 'highImpact',
    },
    {
      label: 'Low Impact',
      value: 'lowImpact',
    },
    { label: 'Banner', value: 'banner' },
    { label: 'None', value: 'none' },
  ],
  defaultValue: 'none',
}

const Image: Field = {
  admin: {
    condition: (siblingData) => {
      return siblingData.hero.type == 'none' ? false : true
    },
  },
  name: 'image',
  type: 'relationship',
  relationTo: 'media',
  required: true,
}

export const Hero: Field = {
  name: 'hero',
  type: 'group',
  fields: [Type, Image],
  label: false,
}
