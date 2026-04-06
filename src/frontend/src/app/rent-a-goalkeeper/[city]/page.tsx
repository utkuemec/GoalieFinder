import type { Metadata } from 'next';
import Link from 'next/link';
import { CANADIAN_CITIES } from '@/lib/fields-data';
import Button from '@/components/ui/Button';
import { Search, MapPin, Shield, Star, CreditCard, CheckCircle } from 'lucide-react';

const citySlugMap: Record<string, string> = {};
CANADIAN_CITIES.forEach((c) => {
  citySlugMap[c.name.toLowerCase().replace(/[\s'.]+/g, '-')] = c.id;
});

function getCityBySlug(slug: string) {
  const cityId = citySlugMap[slug];
  return CANADIAN_CITIES.find((c) => c.id === cityId) || null;
}

interface Props {
  params: Promise<{ city: string }>;
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { city: slug } = await params;
  const city = getCityBySlug(slug);
  const cityName = city?.name || slug.replace(/-/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase());

  return {
    title: `Rent a Goalkeeper in ${cityName} — Book a Goalie Today`,
    description: `Rent a goalkeeper for your soccer game in ${cityName}, ${city?.province || 'Canada'}. Browse verified goalies near you, see ratings & prices, and book instantly. No sign-up needed.`,
    keywords: [
      `rent a goalkeeper ${cityName}`,
      `rent a goalie ${cityName}`,
      `hire goalkeeper ${cityName}`,
      `soccer goalkeeper ${cityName}`,
      `find a goalkeeper ${cityName}`,
      `book a goalie ${cityName}`,
      `goalkeeper for rent ${cityName}`,
    ],
    alternates: {
      canonical: `https://www.goaliefinders.com/rent-a-goalkeeper/${slug}`,
    },
    openGraph: {
      title: `Rent a Goalkeeper in ${cityName} | GoalieFinder`,
      description: `Need a goalie in ${cityName}? Browse available goalkeepers, check ratings, and book instantly.`,
    },
  };
}

export async function generateStaticParams() {
  return CANADIAN_CITIES.map((city) => ({
    city: city.name.toLowerCase().replace(/[\s'.]+/g, '-'),
  }));
}

export default async function CityPage({ params }: Props) {
  const { city: slug } = await params;
  const city = getCityBySlug(slug);
  const cityName = city?.name || slug.replace(/-/g, ' ').replace(/\b\w/g, (l) => l.toUpperCase());
  const province = city?.province || '';
  const fieldCount = city?.fields?.length || 0;

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Service',
    name: `Rent a Goalkeeper in ${cityName}`,
    description: `Goalkeeper rental service for soccer matches in ${cityName}, ${province}. Book a verified goalkeeper online.`,
    provider: {
      '@type': 'Organization',
      name: 'GoalieFinder',
      url: 'https://www.goaliefinders.com',
    },
    areaServed: {
      '@type': 'City',
      name: cityName,
      containedInPlace: { '@type': 'Country', name: 'Canada' },
    },
    serviceType: 'Goalkeeper Rental',
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <section className="relative overflow-hidden bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-900">
        <div className="absolute inset-0 bg-[url('/grid.svg')] opacity-10" />
        <div className="relative mx-auto max-w-7xl px-4 py-20 sm:px-6 lg:px-8 lg:py-28">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 rounded-full bg-emerald-500/10 px-4 py-1.5 text-sm text-emerald-400 mb-6">
              <MapPin size={14} />
              {cityName}, {province} &middot; {fieldCount} fields listed
            </div>
            <h1 className="text-4xl font-bold tracking-tight text-white sm:text-5xl lg:text-6xl">
              Rent a Goalkeeper
              <span className="block text-emerald-400">in {cityName}</span>
            </h1>
            <p className="mt-6 text-lg text-slate-300 max-w-xl">
              Need a goalie for your soccer match in {cityName}? Browse verified goalkeepers near your field,
              compare prices and ratings, and book instantly. No sign-up required for teams.
            </p>
            <div className="mt-10 flex flex-col sm:flex-row gap-4">
              <Link href="/matches/new">
                <Button size="lg" className="w-full sm:w-auto text-base">
                  <Search size={20} className="mr-2" />
                  Find a Goalkeeper in {cityName}
                </Button>
              </Link>
              <Link href="/auth/register">
                <Button variant="outline" size="lg" className="w-full sm:w-auto text-base border-white/30 text-white hover:bg-white/10">
                  <Shield size={20} className="mr-2" />
                  Join as Goalkeeper
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <h2 className="text-2xl font-bold text-slate-900 sm:text-3xl mb-4">
            How to Rent a Goalkeeper in {cityName}
          </h2>
          <p className="text-slate-500 mb-10 max-w-2xl">
            GoalieFinder makes it easy to rent a goalie for your soccer game in {cityName}. Whether
            you play indoor or outdoor, weekday or weekend, you can find a verified goalkeeper in minutes.
          </p>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              { icon: Search, title: 'Search', desc: `Select ${cityName} as your city, pick a field, and enter your match date and time.` },
              { icon: Star, title: 'Compare', desc: 'See available goalkeepers near your field with their ratings, experience, and price per match.' },
              { icon: CreditCard, title: 'Book & Play', desc: 'Pick your goalkeeper, pay securely with your card, and show up to play. It\'s that simple.' },
            ].map((step) => (
              <div key={step.title} className="text-center p-8 rounded-2xl bg-slate-50">
                <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mb-5">
                  <step.icon size={28} />
                </div>
                <h3 className="text-xl font-semibold text-slate-900 mb-3">{step.title}</h3>
                <p className="text-slate-500">{step.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {fieldCount > 0 && city?.fields && (
        <section className="py-16 bg-slate-50">
          <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
            <h2 className="text-2xl font-bold text-slate-900 sm:text-3xl mb-2">
              Soccer Fields in {cityName}
            </h2>
            <p className="text-slate-500 mb-8">
              Popular fields where you can rent a goalkeeper through GoalieFinder
            </p>
            <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {city.fields.map((field) => (
                <div key={field.name} className="flex items-start gap-3 p-4 rounded-xl bg-white border border-slate-200">
                  <MapPin size={18} className="text-emerald-500 mt-0.5 shrink-0" />
                  <div>
                    <p className="font-medium text-slate-900 text-sm">{field.name}</p>
                    <p className="text-xs text-slate-400 mt-0.5">{field.address}</p>
                    <span className="inline-block mt-1 text-xs bg-slate-100 text-slate-500 rounded px-2 py-0.5">{field.type}</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>
      )}

      <section className="py-16 bg-emerald-50">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <h2 className="text-2xl font-bold text-slate-900 sm:text-3xl mb-8">
            Why Rent a Goalkeeper with GoalieFinder?
          </h2>
          <div className="grid sm:grid-cols-2 gap-4 max-w-3xl">
            {[
              'Verified goalkeepers with ratings and reviews',
              'Secure payment through Stripe — money held until match is confirmed',
              'No sign-up needed for teams — just search and book',
              `${fieldCount}+ fields listed in ${cityName}`,
              'Goalkeepers set their own prices — transparent pricing',
              'Cancellation options for both teams and goalkeepers',
            ].map((item) => (
              <div key={item} className="flex items-center gap-3 p-3">
                <CheckCircle size={18} className="text-emerald-500 shrink-0" />
                <span className="text-slate-700 text-sm">{item}</span>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="py-16 bg-emerald-600">
        <div className="mx-auto max-w-4xl px-4 text-center">
          <h2 className="text-3xl font-bold text-white">Ready to Rent a Goalkeeper in {cityName}?</h2>
          <p className="mt-4 text-lg text-emerald-100">
            Find a verified goalie for your next soccer match. No sign-up needed.
          </p>
          <div className="mt-8">
            <Link href="/matches/new">
              <Button size="lg" className="bg-white text-emerald-700 hover:bg-slate-100">
                <Search size={20} className="mr-2" />
                Find a Goalkeeper Now
              </Button>
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <h2 className="text-2xl font-bold text-slate-900 mb-8">
            Rent a Goalkeeper in Other Canadian Cities
          </h2>
          <div className="flex flex-wrap gap-2">
            {CANADIAN_CITIES.filter((c) => c.id !== city?.id).map((c) => (
              <Link
                key={c.id}
                href={`/rent-a-goalkeeper/${c.name.toLowerCase().replace(/[\s'.]+/g, '-')}`}
                className="text-sm px-4 py-2 rounded-full bg-slate-100 text-slate-600 hover:bg-emerald-50 hover:text-emerald-700 transition-colors"
              >
                {c.name}
              </Link>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
