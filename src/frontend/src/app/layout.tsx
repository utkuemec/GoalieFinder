import type { Metadata } from 'next';
import { Inter } from 'next/font/google';
import './globals.css';
import Navbar from '@/components/layout/Navbar';
import Footer from '@/components/layout/Footer';
import { AuthProvider } from '@/lib/auth-context';
import { QueryProvider } from '@/lib/query-provider';
import { GoogleProvider } from '@/lib/google-provider';

const inter = Inter({ subsets: ['latin'] });

const siteUrl = 'https://www.goaliefinders.com';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: 'GoalieFinder — Rent a Goalkeeper for Your Soccer Game in Canada',
    template: '%s | GoalieFinder Canada',
  },
  description:
    'Rent a goalkeeper or goalie for your soccer match anywhere in Canada. Browse verified goalkeepers near you, book instantly, and pay securely. No sign-up needed for teams. 20+ cities covered.',
  keywords: [
    'rent a goalkeeper',
    'rent a goalie',
    'hire a goalkeeper',
    'find a goalkeeper',
    'soccer goalkeeper for hire',
    'goalkeeper for rent Canada',
    'goalie for rent',
    'rent goalkeeper Toronto',
    'rent goalkeeper Vancouver',
    'rent goalkeeper Montreal',
    'rent goalkeeper Calgary',
    'soccer goalie Canada',
    'book a goalkeeper',
    'goalkeeper near me',
    'pickup soccer goalkeeper',
    'spare goalkeeper',
    'sub goalkeeper',
    'goalkeeper marketplace',
    'GoalieFinder',
    'goaliefinders',
  ],
  authors: [{ name: 'GoalieFinder Canada' }],
  creator: 'GoalieFinder',
  publisher: 'GoalieFinder Canada',
  alternates: {
    canonical: siteUrl,
  },
  icons: {
    icon: [
      { url: '/favicon.ico', sizes: '48x48' },
      { url: '/icon-192.png', sizes: '192x192', type: 'image/png' },
      { url: '/icon-512.png', sizes: '512x512', type: 'image/png' },
    ],
    apple: [{ url: '/apple-touch-icon.png', sizes: '180x180' }],
  },
  openGraph: {
    type: 'website',
    locale: 'en_CA',
    url: siteUrl,
    siteName: 'GoalieFinder',
    title: 'GoalieFinder — Rent a Goalkeeper for Your Soccer Game in Canada',
    description:
      'Need a goalie for tonight? Rent a goalkeeper instantly in Toronto, Vancouver, Montreal, Calgary & 20+ Canadian cities. Book online, pay securely.',
    images: [
      {
        url: '/og-image.png',
        width: 1200,
        height: 630,
        alt: 'GoalieFinder — Rent a Goalkeeper in Canada',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'GoalieFinder — Rent a Goalkeeper in Canada',
    description:
      'Rent a goalkeeper for your soccer match anywhere in Canada. 20+ cities, verified goalkeepers, secure payments.',
    images: ['/og-image.png'],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  verification: {
    google: process.env.NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION || undefined,
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: 'GoalieFinder',
    url: siteUrl,
    description:
      'Rent a goalkeeper for your soccer match anywhere in Canada. Browse verified goalkeepers, book instantly, pay securely.',
    potentialAction: {
      '@type': 'SearchAction',
      target: {
        '@type': 'EntryPoint',
        urlTemplate: `${siteUrl}/matches/new?city={search_term_string}`,
      },
      'query-input': 'required name=search_term_string',
    },
  };

  const orgJsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Organization',
    name: 'GoalieFinder',
    url: siteUrl,
    logo: `${siteUrl}/logo.png`,
    description:
      'Canada\'s marketplace for renting goalkeepers. Connecting soccer teams with available goalkeepers across 20+ cities.',
    areaServed: {
      '@type': 'Country',
      name: 'Canada',
    },
    serviceType: 'Goalkeeper Rental Marketplace',
  };

  return (
    <html lang="en">
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(orgJsonLd) }}
        />
      </head>
      <body className={`${inter.className} min-h-screen flex flex-col bg-slate-50`}>
        <GoogleProvider>
          <QueryProvider>
            <AuthProvider>
              <Navbar />
              <main className="flex-1">{children}</main>
              <Footer />
            </AuthProvider>
          </QueryProvider>
        </GoogleProvider>
      </body>
    </html>
  );
}
