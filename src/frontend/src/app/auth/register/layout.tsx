import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Sign Up as Goalkeeper — Get Paid to Play',
  description:
    'Join GoalieFinder as a goalkeeper. Set your own price, choose your city and travel range, and get paid to play soccer. Free registration with Google or email.',
  alternates: { canonical: 'https://www.goaliefinders.com/auth/register' },
};

export default function RegisterLayout({ children }: { children: React.ReactNode }) {
  return children;
}
