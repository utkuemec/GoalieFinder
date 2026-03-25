import Link from 'next/link';
import Button from '@/components/ui/Button';
import { Shield, MapPin, CreditCard, Star, Clock, Users, ChevronRight, CheckCircle, Search, DollarSign, UserPlus, Bell, Handshake } from 'lucide-react';

export default function Home() {
  return (
    <>
      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-900">
        <div className="absolute inset-0 bg-[url('/grid.svg')] opacity-10" />
        <div className="relative mx-auto max-w-7xl px-4 py-24 sm:px-6 lg:px-8 lg:py-32">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 rounded-full bg-emerald-500/10 px-4 py-1.5 text-sm text-emerald-400 mb-6">
              <span className="h-2 w-2 rounded-full bg-emerald-400 animate-pulse" />
              Now serving 20+ cities across Canada
            </div>
            <h1 className="text-4xl font-bold tracking-tight text-white sm:text-6xl lg:text-7xl">
              Find a Goalkeeper
              <span className="block text-emerald-400">in Minutes</span>
            </h1>
            <p className="mt-6 text-lg text-slate-300 max-w-xl">
              Need a keeper for tonight&apos;s game? Just fill in your match details and
              find available goalkeepers near your field. No sign-up required.
            </p>
            <div className="mt-10 flex flex-col sm:flex-row gap-4">
              <Link href="/matches/new">
                <Button size="lg" className="w-full sm:w-auto text-base">
                  <Search size={20} className="mr-2" />
                  Find a Goalkeeper
                  <ChevronRight size={20} className="ml-1" />
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

      {/* How It Works — For Teams */}
      <section className="py-20 bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold text-slate-900 sm:text-4xl">How It Works for Teams</h2>
            <p className="mt-4 text-lg text-slate-500">Three simple steps to get a goalkeeper for your game</p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                icon: Search,
                title: '1. Fill in Your Match',
                desc: 'Select your city, pick a field, enter your match date and time. No account needed — just fill the form and search.',
              },
              {
                icon: MapPin,
                title: '2. See Nearby Goalkeepers',
                desc: 'We instantly show you available goalkeepers near your field with their ratings, experience, and price.',
              },
              {
                icon: CreditCard,
                title: '3. Book & Pay',
                desc: 'Pick a goalkeeper, pay securely with your card. The goalkeeper gets notified and confirms. Show up and play!',
              },
            ].map((step) => (
              <div key={step.title} className="text-center p-8 rounded-2xl bg-slate-50 hover:bg-emerald-50 transition-colors">
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

      {/* How It Works — For Goalkeepers */}
      <section className="py-20 bg-emerald-50">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <div className="inline-flex items-center gap-2 rounded-full bg-emerald-600 px-4 py-1.5 text-sm text-white mb-4">
              <Shield size={16} /> For Goalkeepers
            </div>
            <h2 className="text-3xl font-bold text-slate-900 sm:text-4xl">How It Works for Goalkeepers</h2>
            <p className="mt-4 text-lg text-slate-500">Get paid to play the sport you love</p>
          </div>
          <div className="grid md:grid-cols-4 gap-6">
            {[
              {
                icon: UserPlus,
                title: '1. Create Your Profile',
                desc: 'Sign up with Google or email. Set your price, city, travel range, and experience level.',
              },
              {
                icon: Bell,
                title: '2. Get Booking Requests',
                desc: 'Teams near you find your profile and send booking requests with match details and payment.',
              },
              {
                icon: Handshake,
                title: '3. Accept & Play',
                desc: 'Review the booking, accept it, and show up to play. The team captain confirms attendance after the match.',
              },
              {
                icon: DollarSign,
                title: '4. Get Paid',
                desc: 'Payment is released to your bank account automatically via Stripe after the match is confirmed.',
              },
            ].map((step) => (
              <div key={step.title} className="text-center p-6 rounded-2xl bg-white border border-emerald-200 hover:shadow-md transition-all">
                <div className="inline-flex h-12 w-12 items-center justify-center rounded-xl bg-emerald-600 text-white mb-4">
                  <step.icon size={24} />
                </div>
                <h3 className="text-lg font-semibold text-slate-900 mb-2">{step.title}</h3>
                <p className="text-sm text-slate-500">{step.desc}</p>
              </div>
            ))}
          </div>
          <div className="text-center mt-10">
            <Link href="/auth/register">
              <Button size="lg">
                <Shield size={20} className="mr-2" />
                Join as Goalkeeper — It&apos;s Free
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="py-20 bg-slate-50">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold text-slate-900 sm:text-4xl">Why GoalieFinder?</h2>
          </div>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {[
              { icon: Clock, title: 'Fast Matching', desc: 'Find a goalkeeper within minutes, not hours. Instant notifications to nearby keepers.' },
              { icon: Star, title: 'Verified & Rated', desc: 'Every goalkeeper is verified. Check ratings and reviews before booking.' },
              { icon: CreditCard, title: 'Secure Payments', desc: 'Pay securely through Stripe. Money held until the match is confirmed.' },
              { icon: MapPin, title: '20+ Cities in Canada', desc: 'From Toronto to Vancouver, Montreal to Calgary — 100+ fields across the country.' },
              { icon: Shield, title: 'No Account Needed', desc: 'Teams don\'t need to sign up. Just fill in the form and find your goalkeeper.' },
              { icon: Users, title: 'Growing Community', desc: 'Join a growing network of teams and goalkeepers across Canada.' },
            ].map((feature) => (
              <div key={feature.title} className="flex gap-4 p-6 rounded-xl bg-white border border-slate-200">
                <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-emerald-100 text-emerald-600">
                  <feature.icon size={20} />
                </div>
                <div>
                  <h3 className="font-semibold text-slate-900 mb-1">{feature.title}</h3>
                  <p className="text-sm text-slate-500">{feature.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Two-sided value prop */}
      <section className="py-20 bg-white">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
            <div className="p-8 rounded-2xl border-2 border-slate-200 bg-white">
              <h3 className="text-xl font-bold text-slate-900 mb-2">Need a Goalkeeper?</h3>
              <p className="text-slate-500 mb-6">No sign-up needed. Find one in minutes.</p>
              <ul className="space-y-3 mb-6">
                {['No account required', 'Choose from 20+ cities', 'See nearby goalkeepers instantly', 'View ratings & experience', 'Secure payment with Stripe'].map((item) => (
                  <li key={item} className="flex items-center gap-2 text-sm text-slate-600">
                    <CheckCircle size={16} className="text-emerald-500 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
              <Link href="/matches/new">
                <Button className="w-full">Find a Goalkeeper</Button>
              </Link>
            </div>
            <div className="p-8 rounded-2xl border-2 border-emerald-500 bg-emerald-50 relative">
              <div className="absolute -top-3 left-6 bg-emerald-600 text-white text-xs font-medium px-3 py-1 rounded-full">
                Free to join
              </div>
              <h3 className="text-xl font-bold text-slate-900 mb-2">Are You a Goalkeeper?</h3>
              <p className="text-slate-500 mb-6">Get paid to play. Set your own rates.</p>
              <ul className="space-y-3 mb-6">
                {['Free registration', 'Sign up with Google or email', 'Set your own price per match', 'Get paid directly to your bank', 'Build your reputation with reviews'].map((item) => (
                  <li key={item} className="flex items-center gap-2 text-sm text-slate-600">
                    <CheckCircle size={16} className="text-emerald-500 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
              <Link href="/auth/register">
                <Button variant="outline" className="w-full">Join as Goalkeeper</Button>
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-20 bg-emerald-600">
        <div className="mx-auto max-w-4xl px-4 text-center">
          <h2 className="text-3xl font-bold text-white sm:text-4xl">Ready to Play?</h2>
          <p className="mt-4 text-lg text-emerald-100">
            Find a goalkeeper for your next game anywhere in Canada. No sign-up needed.
          </p>
          <div className="mt-10 flex flex-col sm:flex-row justify-center gap-4">
            <Link href="/matches/new">
              <Button size="lg" className="w-full sm:w-auto bg-white text-emerald-700 hover:bg-slate-100">
                <Search size={20} className="mr-2" />
                Find a Goalkeeper
              </Button>
            </Link>
            <Link href="/auth/register">
              <Button variant="outline" size="lg" className="w-full sm:w-auto border-white text-white hover:bg-emerald-700">
                Join as Goalkeeper
              </Button>
            </Link>
          </div>
        </div>
      </section>
    </>
  );
}
