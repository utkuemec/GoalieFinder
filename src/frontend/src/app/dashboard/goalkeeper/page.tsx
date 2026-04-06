'use client';

import { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import Card from '@/components/ui/Card';
import Badge from '@/components/ui/Badge';
import Button from '@/components/ui/Button';
import { useAuth } from '@/lib/auth-context';
import { bookingsApi, goalkeepersApi, profileApi, type BookingListItem } from '@/lib/api';
import { formatCurrency, formatDateTime } from '@/lib/utils';
import { DollarSign, Trophy, Star, MapPin, Bell, Loader2, CheckCircle, XCircle, Clock, Phone, CreditCard, AlertTriangle, Settings, Edit3, Shield } from 'lucide-react';
import Input from '@/components/ui/Input';

interface GoalkeeperProfileData {
  pricePerMatch?: number;
  experienceYears?: number;
  bio?: string;
  maxTravelDistanceKm?: number;
  isAvailable?: boolean;
}

export default function GoalkeeperDashboard() {
  const { user } = useAuth();
  const [bookings, setBookings] = useState<BookingListItem[]>([]);
  const [loadingBookings, setLoadingBookings] = useState(true);
  const [profile, setProfile] = useState<{ firstName?: string; lastName?: string; phoneNumber?: string; goalkeeper?: GoalkeeperProfileData } | null>(null);
  const [actionLoading, setActionLoading] = useState<string | null>(null);
  const [connectStatus, setConnectStatus] = useState<{ connected: boolean; payoutsEnabled: boolean; detailsSubmitted?: boolean; isRestricted?: boolean; needsVerification?: boolean; currentlyDue?: string[]; disabledReason?: string } | null>(null);
  const [connectLoading, setConnectLoading] = useState(false);
  const [showPayoutForm, setShowPayoutForm] = useState(false);
  const [payoutError, setPayoutError] = useState('');
  const [verificationLoading, setVerificationLoading] = useState(false);

  // Payout form fields
  const [dobDay, setDobDay] = useState('');
  const [dobMonth, setDobMonth] = useState('');
  const [dobYear, setDobYear] = useState('');
  const [addressLine1, setAddressLine1] = useState('');
  const [payoutCity, setPayoutCity] = useState('');
  const [province, setProvince] = useState('');
  const [postalCode, setPostalCode] = useState('');
  const [transitNumber, setTransitNumber] = useState('');
  const [institutionNumber, setInstitutionNumber] = useState('');
  const [accountNumber, setAccountNumber] = useState('');
  const [addressSuggestions, setAddressSuggestions] = useState<Array<{ display: string; street: string; city: string; state: string; postcode: string }>>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const addressTimerRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [bookingsData, statusData, profileData] = await Promise.all([
          bookingsApi.myRequests(),
          goalkeepersApi.connectStatus(),
          profileApi.get(),
        ]);
        setBookings(bookingsData);
        setConnectStatus(statusData);
        setProfile(profileData);
      } catch {
        console.error('Failed to fetch data');
      } finally {
        setLoadingBookings(false);
      }
    };
    fetchData();
  }, []);

  const PROVINCE_MAP: Record<string, string> = {
    'Ontario': 'ON', 'British Columbia': 'BC', 'Alberta': 'AB', 'Quebec': 'QC',
    'Manitoba': 'MB', 'Saskatchewan': 'SK', 'Nova Scotia': 'NS', 'New Brunswick': 'NB',
    'Newfoundland and Labrador': 'NL', 'Prince Edward Island': 'PE',
    'Northwest Territories': 'NT', 'Nunavut': 'NU', 'Yukon': 'YT',
  };

  const searchAddress = (query: string) => {
    if (addressTimerRef.current) clearTimeout(addressTimerRef.current);
    if (query.length < 3) { setAddressSuggestions([]); setShowSuggestions(false); return; }

    addressTimerRef.current = setTimeout(async () => {
      try {
        const res = await fetch(
          `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(query)}&countrycodes=ca&format=json&addressdetails=1&limit=5`,
          { headers: { 'Accept-Language': 'en' } }
        );
        const data = await res.json();
        const suggestions = data
          .filter((r: { address?: { road?: string } }) => r.address?.road)
          .map((r: { display_name: string; address: { house_number?: string; road?: string; city?: string; town?: string; village?: string; state?: string; postcode?: string } }) => ({
            display: r.display_name,
            street: `${r.address.house_number || ''} ${r.address.road || ''}`.trim(),
            city: r.address.city || r.address.town || r.address.village || '',
            state: r.address.state || '',
            postcode: r.address.postcode || '',
          }));
        setAddressSuggestions(suggestions);
        setShowSuggestions(suggestions.length > 0);
      } catch {
        setShowSuggestions(false);
      }
    }, 400);
  };

  const selectAddress = (suggestion: typeof addressSuggestions[0]) => {
    setAddressLine1(suggestion.street);
    setPayoutCity(suggestion.city);
    setProvince(PROVINCE_MAP[suggestion.state] || '');
    setPostalCode(suggestion.postcode);
    setShowSuggestions(false);
  };

  const handlePayoutSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setPayoutError('');
    setConnectLoading(true);
    try {
      await goalkeepersApi.connectOnboard({
        dobDay: parseInt(dobDay), dobMonth: parseInt(dobMonth), dobYear: parseInt(dobYear),
        addressLine1, city: payoutCity, province, postalCode,
        transitNumber, institutionNumber, accountNumber,
      });
      setShowPayoutForm(false);
      setConnectStatus({ connected: true, payoutsEnabled: true });
    } catch (err: unknown) {
      const e = err as { response?: { data?: { error?: string } } };
      setPayoutError(e.response?.data?.error || 'Failed to set up payouts. Check your bank details.');
    } finally {
      setConnectLoading(false);
    }
  };

  const handleAccept = async (id: string) => {
    setActionLoading(id);
    try {
      await bookingsApi.accept(id);
      setBookings((prev) => prev.map((b) => b.id === id ? { ...b, status: 'Accepted' } : b));
    } catch {
      alert('Failed to accept booking');
    } finally {
      setActionLoading(null);
    }
  };

  const handleDecline = async (id: string) => {
    setActionLoading(id);
    try {
      await bookingsApi.decline(id);
      setBookings((prev) => prev.map((b) => b.id === id ? { ...b, status: 'Cancelled' } : b));
    } catch {
      alert('Failed to decline booking');
    } finally {
      setActionLoading(null);
    }
  };

  const handleGoalkeeperCancel = async (id: string) => {
    if (!confirm('Are you sure you want to cancel this booking? The captain will receive a full refund.')) return;
    setActionLoading(id);
    try {
      await bookingsApi.goalkeeperCancel(id);
      setBookings((prev) => prev.map((b) => b.id === id ? { ...b, status: 'Cancelled' } : b));
    } catch {
      alert('Failed to cancel booking');
    } finally {
      setActionLoading(null);
    }
  };

  const handleStartVerification = async () => {
    setVerificationLoading(true);
    try {
      const { url } = await goalkeepersApi.verificationLink();
      window.location.href = url;
    } catch {
      alert('Failed to create verification link. Please try again.');
    } finally {
      setVerificationLoading(false);
    }
  };

  const pendingBookings = bookings.filter((b) => b.status === 'Open');
  const confirmedBookings = bookings.filter((b) => b.status === 'Accepted');
  const completedBookings = bookings.filter((b) => b.status === 'Completed');

  const totalEarnings = [...confirmedBookings, ...completedBookings].reduce((sum, b) => sum + b.paymentAmount, 0);

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
      <div className="mb-8">
        <h1 className="text-2xl font-bold text-slate-900">Goalkeeper Dashboard</h1>
        <p className="text-slate-500">Welcome back, {user?.firstName}</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {[
          { icon: DollarSign, label: 'Earnings', value: formatCurrency(totalEarnings), color: 'text-emerald-600 bg-emerald-100' },
          { icon: Trophy, label: 'Completed', value: completedBookings.length.toString(), color: 'text-blue-600 bg-blue-100' },
          { icon: Bell, label: 'Pending', value: pendingBookings.length.toString(), color: 'text-amber-600 bg-amber-100' },
          { icon: Star, label: 'Total Bookings', value: bookings.filter((b) => b.status !== 'Cancelled').length.toString(), color: 'text-purple-600 bg-purple-100' },
        ].map((stat) => (
          <Card key={stat.label}>
            <div className="flex items-center gap-3">
              <div className={`flex h-10 w-10 items-center justify-center rounded-lg ${stat.color}`}>
                <stat.icon size={20} />
              </div>
              <div>
                <p className="text-2xl font-bold text-slate-900">{stat.value}</p>
                <p className="text-xs text-slate-500">{stat.label}</p>
              </div>
            </div>
          </Card>
        ))}
      </div>

      {/* My Profile Quick View */}
      {profile?.goalkeeper && (
        <Card className="mb-8">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-2">
              <Edit3 size={20} className="text-emerald-600" />
              <h2 className="text-lg font-semibold text-slate-900">My Profile</h2>
            </div>
            <Link href="/dashboard/goalkeeper/settings">
              <Button variant="outline" className="text-sm">
                <Settings size={16} className="mr-1.5" /> Edit Profile
              </Button>
            </Link>
          </div>
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-4">
            <div className="p-3 rounded-lg bg-slate-50">
              <p className="text-xs text-slate-500 mb-0.5">Price per match</p>
              <p className="text-lg font-bold text-slate-900">${profile.goalkeeper.pricePerMatch || '—'}</p>
            </div>
            <div className="p-3 rounded-lg bg-slate-50">
              <p className="text-xs text-slate-500 mb-0.5">Experience</p>
              <p className="text-lg font-bold text-slate-900">{profile.goalkeeper.experienceYears || 0} yrs</p>
            </div>
            <div className="p-3 rounded-lg bg-slate-50">
              <p className="text-xs text-slate-500 mb-0.5">Travel range</p>
              <p className="text-lg font-bold text-slate-900">{profile.goalkeeper.maxTravelDistanceKm || 15} km</p>
            </div>
            <div className="p-3 rounded-lg bg-slate-50">
              <p className="text-xs text-slate-500 mb-0.5">Status</p>
              <p className={`text-lg font-bold ${profile.goalkeeper.isAvailable !== false ? 'text-emerald-600' : 'text-red-500'}`}>
                {profile.goalkeeper.isAvailable !== false ? 'Available' : 'Unavailable'}
              </p>
            </div>
          </div>
          {profile.goalkeeper.bio && (
            <div className="mt-3 p-3 rounded-lg bg-slate-50">
              <p className="text-xs text-slate-500 mb-0.5">Bio</p>
              <p className="text-sm text-slate-700 line-clamp-2">{profile.goalkeeper.bio}</p>
            </div>
          )}
        </Card>
      )}

      {/* Identity Verification Banner — for restricted accounts */}
      {connectStatus?.isRestricted && connectStatus.needsVerification && (
        <Card className="mb-8 border-l-4 border-l-red-400">
          <div className="flex flex-col sm:flex-row sm:items-center gap-4">
            <div className="flex-1">
              <div className="flex items-center gap-2 mb-1">
                <AlertTriangle size={20} className="text-red-500" />
                <h3 className="font-semibold text-slate-900">Identity Verification Required</h3>
              </div>
              <p className="text-sm text-slate-500">
                Stripe requires you to verify your identity to enable payouts. This is a one-time step — you&apos;ll need to take a quick selfie to confirm your identity.
                Your account is restricted until this is completed.
              </p>
            </div>
            <Button
              onClick={handleStartVerification}
              isLoading={verificationLoading}
              className="shrink-0 bg-red-600 hover:bg-red-700"
            >
              <Shield size={18} className="mr-1.5" /> Verify Identity
            </Button>
          </div>
        </Card>
      )}

      {/* Payout Setup Banner — only show if no Stripe account connected at all */}
      {connectStatus && !connectStatus.payoutsEnabled && !connectStatus.connected && (
        <Card className="mb-8 border-l-4 border-l-amber-400">
          <div className="flex flex-col sm:flex-row sm:items-center gap-4">
            <div className="flex-1">
              <div className="flex items-center gap-2 mb-1">
                <AlertTriangle size={20} className="text-amber-500" />
                <h3 className="font-semibold text-slate-900">Set Up Payouts to Get Paid</h3>
              </div>
              <p className="text-sm text-slate-500">
                Add your bank account to receive payments directly when you accept bookings.
              </p>
            </div>
            {!showPayoutForm && (
              <Button onClick={() => setShowPayoutForm(true)} className="shrink-0">
                <CreditCard size={18} className="mr-1" /> Set Up Payouts
              </Button>
            )}
          </div>

          {/* Warning: Not bookable until payout setup */}
          {!showPayoutForm && (
            <div className="mt-4 rounded-lg bg-red-50 border border-red-200 p-4">
              <div className="flex gap-3">
                <div className="shrink-0 mt-0.5">
                  <AlertTriangle size={18} className="text-red-500" />
                </div>
                <div>
                  <p className="text-sm font-semibold text-red-800">You are not visible to teams yet!</p>
                  <p className="text-sm text-red-700 mt-1">
                    You will <strong>not appear in search results</strong> and <strong>cannot receive bookings</strong> until you complete the payout setup above.
                    Once your bank account is connected, teams will be able to find and book you immediately.
                  </p>
                  <div className="mt-3 text-xs text-red-600 space-y-1">
                    <p className="font-semibold">How do you get paid?</p>
                    <ul className="list-disc ml-4 space-y-0.5 text-red-600/90">
                      <li>When a captain books and you accept, the payment is secured automatically.</li>
                      <li>After the match, your earnings are transferred directly to your bank account via Stripe.</li>
                      <li>Funds typically arrive in <strong>2-3 business days</strong> — no manual action needed from you.</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          )}

          {showPayoutForm && (
            <form onSubmit={handlePayoutSubmit} className="mt-6 border-t border-slate-200 pt-6 space-y-4">
              {payoutError && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{payoutError}</div>}

              <h4 className="font-medium text-slate-900">Date of Birth</h4>
              <div className="grid grid-cols-3 gap-3">
                <Input id="dobMonth" label="Month" type="number" min="1" max="12" placeholder="MM" value={dobMonth} onChange={(e) => setDobMonth(e.target.value)} required />
                <Input id="dobDay" label="Day" type="number" min="1" max="31" placeholder="DD" value={dobDay} onChange={(e) => setDobDay(e.target.value)} required />
                <Input id="dobYear" label="Year" type="number" min="1950" max="2010" placeholder="YYYY" value={dobYear} onChange={(e) => setDobYear(e.target.value)} required />
              </div>

              <h4 className="font-medium text-slate-900 pt-2">Address</h4>
              <div className="relative">
                <label htmlFor="street" className="block text-sm font-medium text-slate-700 mb-1">Start typing your address</label>
                <input
                  id="street"
                  name="street-address"
                  autoComplete="off"
                  placeholder="5 Hanna Ave, Toronto..."
                  value={addressLine1}
                  onChange={(e) => { setAddressLine1(e.target.value); searchAddress(e.target.value); }}
                  onFocus={() => { if (addressSuggestions.length > 0) setShowSuggestions(true); }}
                  onBlur={() => setTimeout(() => setShowSuggestions(false), 200)}
                  required
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
                />
                {showSuggestions && (
                  <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-white border border-slate-200 rounded-lg shadow-lg max-h-48 overflow-y-auto">
                    {addressSuggestions.map((s, i) => (
                      <button
                        key={i}
                        type="button"
                        onMouseDown={() => selectAddress(s)}
                        className="w-full text-left px-4 py-2.5 text-sm hover:bg-emerald-50 border-b border-slate-100 last:border-0"
                      >
                        <p className="font-medium text-slate-900 truncate">{s.street}, {s.city}</p>
                        <p className="text-xs text-slate-500 truncate">{s.state} {s.postcode}</p>
                      </button>
                    ))}
                  </div>
                )}
              </div>
              <div className="grid grid-cols-3 gap-3">
                <div>
                  <label htmlFor="city" className="block text-sm font-medium text-slate-700 mb-1">City</label>
                  <input id="city" name="city" autoComplete="address-level2" placeholder="Toronto" value={payoutCity} onChange={(e) => setPayoutCity(e.target.value)} required className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20" />
                </div>
                <div>
                  <label htmlFor="province" className="block text-sm font-medium text-slate-700 mb-1">Province</label>
                  <select id="province" name="province" autoComplete="address-level1" value={province} onChange={(e) => setProvince(e.target.value)} required className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                    <option value="">Select</option>
                    <option value="ON">Ontario</option><option value="BC">British Columbia</option><option value="AB">Alberta</option>
                    <option value="QC">Quebec</option><option value="MB">Manitoba</option><option value="SK">Saskatchewan</option>
                    <option value="NS">Nova Scotia</option><option value="NB">New Brunswick</option><option value="NL">Newfoundland</option>
                    <option value="PE">PEI</option><option value="NT">NWT</option><option value="NU">Nunavut</option><option value="YT">Yukon</option>
                  </select>
                </div>
                <div>
                  <label htmlFor="postalCode" className="block text-sm font-medium text-slate-700 mb-1">Postal Code</label>
                  <input id="postalCode" name="postal-code" autoComplete="postal-code" placeholder="M5V 2T6" value={postalCode} onChange={(e) => setPostalCode(e.target.value.toUpperCase())} required className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20" />
                </div>
              </div>

              <h4 className="font-medium text-slate-900 pt-2">Bank Account</h4>
              <p className="text-xs text-slate-500 -mt-2">Find these numbers on a void cheque or in your banking app</p>
              <div className="grid grid-cols-3 gap-3">
                <Input id="transit" label="Transit # (5 digits)" placeholder="12345" maxLength={5} value={transitNumber} onChange={(e) => setTransitNumber(e.target.value.replace(/\D/g, ''))} required />
                <Input id="institution" label="Institution # (3 digits)" placeholder="001" maxLength={3} value={institutionNumber} onChange={(e) => setInstitutionNumber(e.target.value.replace(/\D/g, ''))} required />
                <Input id="account" label="Account # (7-12 digits)" placeholder="1234567" value={accountNumber} onChange={(e) => setAccountNumber(e.target.value.replace(/\D/g, ''))} required />
              </div>

              <p className="text-xs text-slate-400">Your bank details are securely processed by Stripe. GoalieFinder never stores your full account number.</p>

              <div className="flex gap-3 pt-2">
                <Button type="submit" isLoading={connectLoading}>Save Bank Account</Button>
                <Button type="button" variant="ghost" onClick={() => setShowPayoutForm(false)}>Cancel</Button>
              </div>
            </form>
          )}
        </Card>
      )}

      {connectStatus?.connected && !connectStatus.payoutsEnabled && !connectStatus.isRestricted && (
        <Card className="mb-8 border-l-4 border-l-blue-400 bg-blue-50/50">
          <div className="flex items-center gap-3">
            <Clock size={20} className="text-blue-600" />
            <div>
              <p className="font-medium text-slate-900">Bank Account Submitted</p>
              <p className="text-sm text-slate-500">Your bank details are being verified by Stripe. This usually takes a few minutes. You can start accepting bookings in the meantime.</p>
            </div>
          </div>
        </Card>
      )}

      {connectStatus?.payoutsEnabled && (
        <Card className="mb-8 border-l-4 border-l-emerald-500 bg-emerald-50/50">
          <div className="flex items-center gap-3">
            <CheckCircle size={20} className="text-emerald-600" />
            <div>
              <p className="font-medium text-slate-900">Payouts Active</p>
              <p className="text-sm text-slate-500">Your bank account is connected. You&apos;ll receive payments automatically when you accept bookings.</p>
            </div>
          </div>
        </Card>
      )}

      {/* Pending Booking Requests */}
      {pendingBookings.length > 0 && (
        <div className="mb-8">
          <div className="flex items-center gap-2 mb-4">
            <Bell size={20} className="text-amber-600" />
            <h2 className="text-xl font-bold text-slate-900">Booking Requests</h2>
            <Badge variant="warning">{pendingBookings.length} pending</Badge>
          </div>
          <div className="space-y-4">
            {pendingBookings.map((booking) => (
              <Card key={booking.id} className="border-l-4 border-l-amber-400">
                <div className="flex flex-col lg:flex-row lg:items-center gap-4">
                  <div className="flex-1 space-y-2">
                    <div className="flex items-center gap-3">
                      <h3 className="font-semibold text-slate-900 text-lg">{booking.captainName}</h3>
                      <Badge variant="warning">Pending</Badge>
                    </div>
                    <div className="flex flex-wrap gap-4 text-sm text-slate-600">
                      <div className="flex items-center gap-1">
                        <MapPin size={14} className="text-emerald-500" />
                        {booking.fieldName}
                      </div>
                      <div className="flex items-center gap-1">
                        <Clock size={14} className="text-blue-500" />
                        {formatDateTime(booking.matchDateTime)} ({booking.durationMinutes} min)
                      </div>
                      <div className="flex items-center gap-1">
                        <Phone size={14} className="text-slate-400" />
                        {booking.captainPhone}
                      </div>
                    </div>
                    {booking.notes && <p className="text-sm text-slate-500 italic">{booking.notes}</p>}
                    <p className="text-lg font-bold text-emerald-600">{formatCurrency(booking.paymentAmount)}</p>
                  </div>
                  <div className="flex gap-2 shrink-0">
                    <Button
                      variant="primary"
                      onClick={() => handleAccept(booking.id)}
                      isLoading={actionLoading === booking.id}
                      disabled={actionLoading !== null}
                    >
                      <CheckCircle size={18} className="mr-1" /> Accept
                    </Button>
                    <Button
                      variant="danger"
                      onClick={() => handleDecline(booking.id)}
                      isLoading={actionLoading === booking.id}
                      disabled={actionLoading !== null}
                    >
                      <XCircle size={18} className="mr-1" /> Decline
                    </Button>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        </div>
      )}

      {/* Confirmed Bookings */}
      {confirmedBookings.length > 0 && (
        <div className="mb-8">
          <div className="flex items-center gap-2 mb-4">
            <CheckCircle size={20} className="text-emerald-600" />
            <h2 className="text-xl font-bold text-slate-900">Confirmed Matches</h2>
            <Badge variant="success">{confirmedBookings.length}</Badge>
          </div>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {confirmedBookings.map((booking) => (
              <Card key={booking.id}>
                <div className="flex items-center justify-between mb-2">
                  <h3 className="font-semibold text-slate-900">{booking.captainName}</h3>
                  <Badge variant="success">Confirmed</Badge>
                </div>
                <div className="space-y-1 text-sm text-slate-600">
                  <div className="flex items-center gap-1"><MapPin size={14} /> {booking.fieldName}</div>
                  <div className="flex items-center gap-1"><Clock size={14} /> {formatDateTime(booking.matchDateTime)}</div>
                  <div className="flex items-center gap-1"><Phone size={14} /> {booking.captainPhone}</div>
                </div>
                <div className="flex items-center justify-between mt-3">
                  <p className="text-lg font-bold text-emerald-600">{formatCurrency(booking.paymentAmount)}</p>
                  {new Date(booking.matchDateTime).getTime() - Date.now() > 3600000 ? (
                    <Button
                      variant="danger"
                      onClick={() => handleGoalkeeperCancel(booking.id)}
                      isLoading={actionLoading === booking.id}
                      disabled={actionLoading !== null}
                      className="text-xs px-3 py-1"
                    >
                      Cancel
                    </Button>
                  ) : (
                    <span className="text-xs text-slate-400 italic">Cannot cancel within 1h</span>
                  )}
                </div>
              </Card>
            ))}
          </div>
        </div>
      )}

      {/* Completed Matches */}
      {completedBookings.length > 0 && (
        <div className="mb-8">
          <div className="flex items-center gap-2 mb-4">
            <Trophy size={20} className="text-blue-600" />
            <h2 className="text-xl font-bold text-slate-900">Completed Matches</h2>
            <Badge variant="info">{completedBookings.length}</Badge>
          </div>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {completedBookings.map((booking) => (
              <Card key={booking.id}>
                <div className="flex items-center justify-between mb-2">
                  <h3 className="font-semibold text-slate-900">{booking.captainName}</h3>
                  <Badge variant="info">Completed</Badge>
                </div>
                <div className="space-y-1 text-sm text-slate-600">
                  <div className="flex items-center gap-1"><MapPin size={14} /> {booking.fieldName}</div>
                  <div className="flex items-center gap-1"><Clock size={14} /> {formatDateTime(booking.matchDateTime)}</div>
                </div>
                <p className="text-lg font-bold text-emerald-600 mt-2">{formatCurrency(booking.paymentAmount)}</p>
              </Card>
            ))}
          </div>
        </div>
      )}

      {/* Loading / Empty */}
      {loadingBookings ? (
        <div className="flex items-center justify-center py-16">
          <Loader2 size={32} className="animate-spin text-emerald-600" />
        </div>
      ) : bookings.length === 0 ? (
        <Card className="text-center py-12">
          <Bell size={32} className="text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500">No booking requests yet.</p>
          <p className="text-sm text-slate-400 mt-1">When teams book you, their requests will appear here.</p>
        </Card>
      ) : null}
    </div>
  );
}
