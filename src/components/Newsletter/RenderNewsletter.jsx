import Form from 'next/form'

import { Button, Input } from '@headlessui/react'

export default function RenderNewsletter({ heading, body, buttonLabel }) {
  return (
    <section className="full-bleed bg-accent-400 py-3xl">
      <article>
        <h2 className="font-accent text-3xl text-balance">{heading}</h2>
        <p className="max-w-prose text-lg">{body}</p>
      </article>
      <Form action="/">
        <Input
          name="email"
          type="email"
          className="border-2 border-accent-800 bg-neutral-50 py-2xs"
        />
        <Button>{buttonLabel}</Button>
      </Form>
    </section>
  )
}
