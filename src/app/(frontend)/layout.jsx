import { Footer, Nav } from '@/components/Nav'
import './globals.css'

export const metadata = {
  title: 'Shaelin Bishop',
  description: 'Victoria-based author.',
}

export default async function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        {/* <Nav /> */}
        <main>{children}</main>
        {/* <Footer /> */}
      </body>
    </html>
  )
}
