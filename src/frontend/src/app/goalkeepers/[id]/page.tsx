'use client';

import { useState, useEffect } from 'react';
import { useParams, useSearchParams, useRouter } from 'next/navigation';
import Card from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Badge from '@/components/ui/Badge';
import StarRating from '@/components/ui/StarRating';
import { goalkeepersApi, bookingsApi, type BookingRequest } from '@/lib/api';
import { formatCurrency } from '@/lib/utils';
import { calculateTax, getTaxInfo } from '@/lib/tax-rates';
import { MapPin, Trophy, Navigation, Shield, ArrowLeft, Loader2, CheckCircle, Calendar, CreditCard } from 'lucide-react';
import { loadStripe } from '@stripe/stripe-js';
import { Elements, PaymentElement, useStripe, useElements } from '@stripe/react-stripe-js';
import Link from 'next/link';
import type { GoalkeeperProfile } from '@/types';

const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY || '');

type PageStep = 'profile' | 'booking' | 'payment' | 'success';

export default function GoalkeeperProfilePage() {
  const params = useParams();
  const searchParams = useSearchParams();
  const router = useRouter();
  const id = params.id as string;

  // Read search context from URL
  const ctxField = searchParams.get('field') || '';
  const ctxAddress = searchParams.get('address') || '';
  const ctxLat = parseFloat(searchParams.get('lat') || '0');
  const ctxLng = parseFloat(searchParams.get('lng') || '0');
  const ctxDate = searchParams.get('date') || '';
  const ctxTime = searchParams.get('time') || '';
  const ctxDuration = searchParams.get('dur') || '60';
  const ctxProvince = searchParams.get('prov') || 'ON';

  const [goalkeeper, setGoalkeeper] = useState<GoalkeeperProfile | null>(null);
  const [loading, setLoading] = useState(true);
  const [step, setStep] = useState<PageStep>('profile');

  useEffect(() => {
    if (!ctxField || !ctxDate || !ctxTime) {
      router.replace('/matches/new');
    }
  }, [ctxField, ctxDate, ctxTime, router]);

  // Booking form — captain info + notes
  const [captainName, setCaptainName] = useState('');
  const [captainEmail, setCaptainEmail] = useState('');
  const [captainPhone, setCaptainPhone] = useState('');
  const [notes, setNotes] = useState('');

  const [clientSecret, setClientSecret] = useState('');
  const [bookingId, setBookingId] = useState('');
  const [bookingLoading, setBookingLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetch = async () => {
      try {
        const data = await goalkeepersApi.getById(id);
        setGoalkeeper(data);
      } catch {
        setError('Goalkeeper not found');
      } finally {
        setLoading(false);
      }
    };
    fetch();
  }, [id]);

  const taxInfo = getTaxInfo(ctxProvince);
  const gkPrice = goalkeeper?.pricePerMatch || 0;
  const serviceFee = Math.round(gkPrice * 0.10 * 100) / 100;
  const subtotal = gkPrice + serviceFee;
  const tax = calculateTax(subtotal, ctxProvince);

  const handleBookingSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!goalkeeper) return;
    setError('');
    setBookingLoading(true);

    try {
      const bookingData: BookingRequest = {
        goalkeeperProfileId: goalkeeper.id,
        fieldName: ctxField || 'TBD',
        fieldAddress: ctxAddress || '',
        fieldLatitude: ctxLat || goalkeeper.latitude,
        fieldLongitude: ctxLng || goalkeeper.longitude,
        matchDateTime: ctxDate && ctxTime
          ? new Date(`${ctxDate}T${ctxTime}`).toISOString()
          : new Date().toISOString(),
        durationMinutes: parseInt(ctxDuration),
        captainName,
        captainEmail,
        captainPhone,
        provinceCode: ctxProvince,
        notes: notes || undefined,
      };

      const result = await bookingsApi.create(bookingData);
      setClientSecret(result.clientSecret);
      setBookingId(result.bookingId);
      setStep('payment');
    } catch (err: unknown) {
      const e = err as { response?: { data?: { error?: string } } };
      setError(e.response?.data?.error || 'Failed to create booking');
    } finally {
      setBookingLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 size={32} className="animate-spin text-emerald-600" />
      </div>
    );
  }

  if (!goalkeeper) {
    return (
      <div className="mx-auto max-w-2xl px-4 py-16 text-center">
        <p className="text-slate-500">Goalkeeper not found</p>
        <Link href="/matches/new"><Button className="mt-4">Back to Search</Button></Link>
      </div>
    );
  }

  // ===== SUCCESS =====
  if (step === 'success') {
    return (
      <div className="mx-auto max-w-lg px-4 py-16 text-center">
        <div className="inline-flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100 text-emerald-600 mb-6">
          <CheckCircle size={36} />
        </div>
        <h1 className="text-2xl font-bold text-slate-900 mb-2">Booking Request Sent!</h1>
        <p className="text-slate-500 mb-2">
          Your payment has been pre-authorized. {goalkeeper.fullName} will be notified and can accept or decline.
        </p>
        <p className="text-sm text-slate-400 mb-8">
          If the goalkeeper accepts, your card will be charged {formatCurrency(tax.total)}. If they decline, the hold is released automatically.
        </p>
        <Link href="/matches/new">
          <Button>Find Another Goalkeeper</Button>
        </Link>
      </div>
    );
  }

  // ===== PAYMENT (Stripe Elements) =====
  if (step === 'payment' && clientSecret) {
    return (
      <div className="mx-auto max-w-lg px-4 py-12">
        <button onClick={() => setStep('booking')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
          <ArrowLeft size={16} /> Back
        </button>
        <Card>
          <div className="text-center mb-6">
            <CreditCard size={28} className="text-emerald-600 mx-auto mb-3" />
            <h2 className="text-xl font-bold text-slate-900">Complete Payment</h2>
            <p className="text-sm text-slate-500 mt-1">
              Pre-authorize {formatCurrency(tax.total)} for {goalkeeper.fullName}
            </p>
            <p className="text-xs text-slate-400 mt-1">
              Your card won&apos;t be charged until the goalkeeper accepts
            </p>
          </div>

          <div className="p-4 rounded-lg bg-slate-50 mb-6 space-y-1.5 text-sm">
            <div className="flex justify-between">
              <span className="text-slate-500">Goalkeeper fee</span>
              <span className="text-slate-900">{formatCurrency(gkPrice)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-500">Service fee (10%)</span>
              <span className="text-slate-900">{formatCurrency(serviceFee)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-500">Tax ({taxInfo.breakdown})</span>
              <span className="text-slate-900">{formatCurrency(tax.taxAmount)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-500">Processing fee</span>
              <span className="text-slate-900">{formatCurrency(tax.stripeFee)}</span>
            </div>
            <div className="flex justify-between border-t border-slate-200 pt-1.5 font-semibold">
              <span className="text-slate-900">Total hold</span>
              <span className="text-emerald-600">{formatCurrency(tax.total)}</span>
            </div>
          </div>

          <Elements stripe={stripePromise} options={{ clientSecret, appearance: { theme: 'stripe' } }}>
            <PaymentForm bookingId={bookingId} onSuccess={() => setStep('success')} />
          </Elements>
        </Card>
      </div>
    );
  }

  // ===== BOOKING FORM (just captain info) =====
  if (step === 'booking') {
    return (
      <div className="mx-auto max-w-lg px-4 py-12">
        <button onClick={() => setStep('profile')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
          <ArrowLeft size={16} /> Back to profile
        </button>

        <div className="flex items-center gap-4 mb-6">
          <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-emerald-700 font-bold text-lg">
            {goalkeeper.fullName.charAt(0)}
          </div>
          <div>
            <h1 className="text-xl font-bold text-slate-900">Book {goalkeeper.fullName}</h1>
            <p className="text-sm text-slate-500">{formatCurrency(goalkeeper.pricePerMatch)} / match</p>
          </div>
        </div>

        {/* Match info summary from search */}
        {ctxField && (
          <div className="flex flex-wrap gap-2 text-xs mb-6">
            <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-3 py-1.5 text-slate-600">
              <MapPin size={12} /> {ctxField}
            </span>
            {ctxDate && (
              <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-3 py-1.5 text-slate-600">
                <Calendar size={12} /> {ctxDate} at {ctxTime}
              </span>
            )}
          </div>
        )}

        <form onSubmit={handleBookingSubmit} className="space-y-6">
          {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}

          <Card>
            <div className="flex items-center gap-2 mb-4">
              <Shield size={20} className="text-emerald-600" />
              <h2 className="font-semibold text-slate-900">Your Info</h2>
            </div>
            <div className="grid grid-cols-2 gap-4 mb-4">
              <Input id="name" label="Full Name" placeholder="John Smith" value={captainName} onChange={(e) => setCaptainName(e.target.value)} required />
              <Input id="phone" label="Phone" type="tel" placeholder="+1 416 555 0123" value={captainPhone} onChange={(e) => setCaptainPhone(e.target.value)} required />
            </div>
            <div className="mb-4">
              <Input id="email" label="Email" type="email" placeholder="you@example.com" value={captainEmail} onChange={(e) => setCaptainEmail(e.target.value)} required />
            </div>
            <div>
              <label className="block text-sm font-medium text-slate-700 mb-1">Notes (optional)</label>
              <textarea
                placeholder="Anything the goalkeeper should know..."
                value={notes}
                onChange={(e) => setNotes(e.target.value)}
                rows={2}
                className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
              />
            </div>
          </Card>

          {/* Price breakdown with service fee, tax, and processing fee */}
          <div className="p-5 rounded-xl bg-emerald-50 border border-emerald-200 space-y-2 text-sm">
            <div className="flex justify-between">
              <span className="text-slate-600">Goalkeeper fee</span>
              <span className="text-slate-900">{formatCurrency(gkPrice)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-600">Service fee (10%)</span>
              <span className="text-slate-900">{formatCurrency(serviceFee)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-600">Tax ({taxInfo.breakdown})</span>
              <span className="text-slate-900">{formatCurrency(tax.taxAmount)}</span>
            </div>
            <div className="flex justify-between">
              <span className="text-slate-600">Processing fee</span>
              <span className="text-slate-900">{formatCurrency(tax.stripeFee)}</span>
            </div>
            <div className="flex justify-between font-bold border-t border-emerald-200 pt-2">
              <span className="text-slate-900">Total</span>
              <span className="text-emerald-700">{formatCurrency(tax.total)}</span>
            </div>
            <p className="text-xs text-slate-500 pt-1">Card will be held (not charged) until goalkeeper accepts</p>
          </div>

          <Button type="submit" size="lg" className="w-full" isLoading={bookingLoading}>
            Continue to Payment — {formatCurrency(tax.total)}
          </Button>
        </form>
      </div>
    );
  }

  // ===== PROFILE VIEW =====
  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <Link href="/matches/new" className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
        <ArrowLeft size={16} /> Back to search
      </Link>

      <Card className="mb-6">
        <div className="flex flex-col sm:flex-row gap-6">
          <div className="flex h-24 w-24 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-emerald-700 font-bold text-3xl">
            {goalkeeper.fullName.charAt(0)}
          </div>
          <div className="flex-1">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-2xl font-bold text-slate-900">{goalkeeper.fullName}</h1>
                <StarRating rating={goalkeeper.rating} size={18} className="mt-1" />
              </div>
              {goalkeeper.isAvailable ? <Badge variant="success">Available</Badge> : <Badge variant="danger">Unavailable</Badge>}
            </div>

            <div className="flex flex-wrap gap-4 mt-4 text-sm text-slate-600">
              <div className="flex items-center gap-1"><Trophy size={16} className="text-amber-500" /> {goalkeeper.totalMatches} matches</div>
              <div className="flex items-center gap-1"><Calendar size={16} className="text-blue-500" /> {goalkeeper.experienceYears} yrs experience</div>
              <div className="flex items-center gap-1"><MapPin size={16} className="text-emerald-500" /> {goalkeeper.maxTravelDistanceKm}km travel range</div>
              {goalkeeper.distanceKm != null && (
                <div className="flex items-center gap-1"><Navigation size={16} className="text-purple-500" /> {goalkeeper.distanceKm}km away</div>
              )}
            </div>

            {goalkeeper.bio && <p className="mt-4 text-slate-600">{goalkeeper.bio}</p>}
          </div>
        </div>
      </Card>

      <Card className="mb-6">
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm text-slate-500">Price per match</p>
            <p className="text-3xl font-bold text-emerald-600">{formatCurrency(goalkeeper.pricePerMatch)}</p>
            <p className="text-xs text-slate-400 mt-1">+ 10% service fee + tax + processing fee</p>
          </div>
          <div className="text-right">
            <p className="text-sm text-slate-500">{goalkeeper.totalReviews} reviews</p>
            <p className="text-sm text-slate-500">{goalkeeper.rating > 0 ? `${goalkeeper.rating.toFixed(1)} / 5.0` : 'New goalkeeper'}</p>
          </div>
        </div>
      </Card>

      {/* Match context from search */}
      {ctxField && (
        <Card className="mb-6 bg-slate-50">
          <p className="text-sm font-medium text-slate-700 mb-2">Your match details</p>
          <div className="flex flex-wrap gap-2 text-xs">
            <span className="inline-flex items-center gap-1 rounded-full bg-white border border-slate-200 px-3 py-1.5 text-slate-600">
              <MapPin size={12} /> {ctxField}
            </span>
            {ctxDate && (
              <span className="inline-flex items-center gap-1 rounded-full bg-white border border-slate-200 px-3 py-1.5 text-slate-600">
                <Calendar size={12} /> {ctxDate} at {ctxTime}
              </span>
            )}
          </div>
        </Card>
      )}

      {goalkeeper.isAvailable && (
        <Button size="lg" className="w-full" onClick={() => setStep('booking')}>
          Book This Goalkeeper — {formatCurrency(tax.total)}
        </Button>
      )}
    </div>
  );
}

function PaymentForm({ bookingId, onSuccess }: { bookingId: string; onSuccess: () => void }) {
  const stripe = useStripe();
  const elements = useElements();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!stripe || !elements) return;
    setLoading(true);
    setError('');

    const { error: submitError } = await elements.submit();
    if (submitError) { setError(submitError.message || 'Payment failed'); setLoading(false); return; }

    const { error: confirmError } = await stripe.confirmPayment({
      elements,
      confirmParams: { return_url: window.location.href },
      redirect: 'if_required',
    });

    if (confirmError) {
      setError(confirmError.message || 'Payment failed');
      setLoading(false);
    } else {
      // Payment succeeded — notify goalkeeper now
      try {
        await bookingsApi.paymentComplete(bookingId);
      } catch { /* notification will still be visible in dashboard */ }
      onSuccess();
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
      <PaymentElement />
      <Button type="submit" size="lg" className="w-full" isLoading={loading} disabled={!stripe}>
        Pre-authorize Payment
      </Button>
    </form>
  );
}
