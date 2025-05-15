'use client'

import { Button, useDocumentInfo } from '@payloadcms/ui'
import { useRouter } from 'next/navigation'

import { IoMdArrowForward } from 'react-icons/io'

export default function ViewPageButton({ label }) {
  const router = useRouter()
  const { savedDocumentData } = useDocumentInfo()

  return (
    <Button
      onClick={() => {
        router.push(savedDocumentData.slug)
      }}
    >
      {label} <IoMdArrowForward />
    </Button>
  )
}
