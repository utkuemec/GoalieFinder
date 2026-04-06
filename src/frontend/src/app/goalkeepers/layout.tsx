import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Browse Goalkeepers — Rent a Goalie Near You',
  description:
    'Browse all verified goalkeepers available for rent across Canada. See ratings, experience, prices, and book a goalkeeper for your next soccer match.',
  alternates: { canonical: 'https://www.goaliefinders.com/goalkeepers' },
};

export default function GoalkeepersLayout({ children }: { children: React.ReactNode }) {
  return children;
}
