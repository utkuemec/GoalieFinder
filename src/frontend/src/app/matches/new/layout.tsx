import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Find a Goalkeeper — Rent a Goalie for Your Soccer Match',
  description:
    'Search for available goalkeepers near your soccer field. Select your city, pick a field, choose a date, and rent a goalkeeper instantly. 20+ Canadian cities covered.',
  alternates: { canonical: 'https://www.goaliefinders.com/matches/new' },
};

export default function MatchesNewLayout({ children }: { children: React.ReactNode }) {
  return children;
}
