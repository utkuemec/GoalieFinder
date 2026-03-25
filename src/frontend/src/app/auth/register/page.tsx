'use client';

import { useState, useRef, useEffect, type KeyboardEvent, type ClipboardEvent } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import Image from 'next/image';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Card from '@/components/ui/Card';
import { useAuth } from '@/lib/auth-context';
import { authApi, goalkeepersApi } from '@/lib/api';
import api from '@/lib/api';
import { Shield, MapPin, DollarSign, CheckCircle, ChevronRight, ArrowLeft, Mail } from 'lucide-react';
import { cn } from '@/lib/utils';
import { CANADIAN_CITIES } from '@/lib/fields-data';

const GOOGLE_CLIENT_ID = process.env.NEXT_PUBLIC_GOOGLE_CLIENT_ID || '';

type Step = 'info' | 'google-extra' | 'verify' | 'profile';

export default function RegisterPage() {
  const router = useRouter();
  const { login } = useAuth();

  const [step, setStep] = useState<Step>('info');
  const [isGoogleUser, setIsGoogleUser] = useState(false);
  const [googlePhoto, setGooglePhoto] = useState('');
  const [googleAccessToken, setGoogleAccessToken] = useState('');

  // Account info
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');

  // Verification
  const [verificationCode, setVerificationCode] = useState(['', '', '', '', '', '']);
  const [resendTimer, setResendTimer] = useState(0);
  const codeInputRefs = useRef<(HTMLInputElement | null)[]>([]);
  const [devCode, setDevCode] = useState<string | null>(null);

  // Profile setup
  const [pricePerMatch, setPricePerMatch] = useState('');
  const [experienceYears, setExperienceYears] = useState('');
  const [bio, setBio] = useState('');
  const [selectedCity, setSelectedCity] = useState('');
  const [addressInput, setAddressInput] = useState('');
  const [addressLat, setAddressLat] = useState<number | null>(null);
  const [addressLng, setAddressLng] = useState<number | null>(null);
  const [addressSuggestions, setAddressSuggestions] = useState<Array<{ display: string; lat: number; lng: number }>>([]);
  const [showAddrSuggestions, setShowAddrSuggestions] = useState(false);
  const addrTimerRef = useRef<NodeJS.Timeout | null>(null);
  
  const [maxDistance, setMaxDistance] = useState('15');

  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (resendTimer <= 0) return;
    const interval = setInterval(() => setResendTimer((t) => t - 1), 1000);
    return () => clearInterval(interval);
  }, [resendTimer]);

  const searchAddress = (query: string) => {
    if (addrTimerRef.current) clearTimeout(addrTimerRef.current);
    if (query.length < 3) { setAddressSuggestions([]); setShowAddrSuggestions(false); return; }
    addrTimerRef.current = setTimeout(async () => {
      try {
        const res = await fetch(
          `https://nominatim.openstreetmap.org/search?q=${encodeURIComponent(query)}&countrycodes=ca&format=json&addressdetails=1&limit=5`,
          { headers: { 'Accept-Language': 'en' } }
        );
        const data = await res.json();
        const suggestions = data
          .filter((r: { address?: { road?: string; city?: string; town?: string; village?: string } }) => r.address?.road || r.address?.city || r.address?.town || r.address?.village)
          .map((r: { display_name: string; lat: string; lon: string }) => ({
            display: r.display_name,
            lat: parseFloat(r.lat),
            lng: parseFloat(r.lon),
          }));
        setAddressSuggestions(suggestions);
        setShowAddrSuggestions(suggestions.length > 0);
      } catch {
        setShowAddrSuggestions(false);
      }
    }, 400);
  };

  // Handle Google OAuth callback (redirect-based)
  useEffect(() => {
    const hash = window.location.hash;
    if (!hash.includes('access_token')) return;

    const params = new URLSearchParams(hash.substring(1));
    const accessToken = params.get('access_token');
    if (!accessToken) return;

    window.history.replaceState({}, '', '/auth/register');

    authApi.google(accessToken)
      .then((res) => {
        if (res.isNewUser && res.googleUser) {
          setFirstName(res.googleUser.firstName || '');
          setLastName(res.googleUser.lastName || '');
          setEmail(res.googleUser.email || '');
          setGooglePhoto(res.googleUser.profilePhotoUrl || '');
          setIsGoogleUser(true);
          setGoogleAccessToken(accessToken);
          setStep('google-extra');
        } else if (res.accessToken && res.user) {
          login(res.accessToken, res.user);
          router.push('/dashboard/goalkeeper');
        } else {
          setError('Unexpected response. Please try again.');
        }
      })
      .catch((err) => {
        const msg = err?.response?.data?.error || '';
        setError(msg || 'Google sign-in failed. Please try again.');
      });
  }, []);

  const handleGoogleSignIn = () => {
    const redirectUri = window.location.origin + '/auth/register';
    const url = `https://accounts.google.com/o/oauth2/v2/auth?client_id=${GOOGLE_CLIENT_ID}&redirect_uri=${encodeURIComponent(redirectUri)}&response_type=token&scope=email%20profile&prompt=select_account`;
    window.location.href = url;
  };

  // Send verification code
  const sendVerificationCode = async () => {
    setError('');
    setLoading(true);
    try {
      const res = await api.post('/verification/send', { email });
      if (res.data.code) setDevCode(res.data.code);
      setResendTimer(60);
      setVerificationCode(['', '', '', '', '', '']);
      setStep('verify');
    } catch {
      setError('Failed to send verification code.');
    } finally {
      setLoading(false);
    }
  };

  // Step 1: Email sign-up submit
  const handleInfoSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email.trim()) { setError('Email is required'); return; }
    await sendVerificationCode();
  };

  // Step google-extra: Google user provides phone → verify
  const handleGoogleExtraSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!phone.trim()) { setError('Phone number is required'); return; }
    await sendVerificationCode();
  };

  // Code input handlers
  const handleCodeChange = (index: number, value: string) => {
    if (!/^\d*$/.test(value)) return;
    const newCode = [...verificationCode];
    newCode[index] = value.slice(-1);
    setVerificationCode(newCode);
    if (value && index < 5) codeInputRefs.current[index + 1]?.focus();
  };

  const handleCodeKeyDown = (index: number, e: KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Backspace' && !verificationCode[index] && index > 0)
      codeInputRefs.current[index - 1]?.focus();
  };

  const handleCodePaste = (e: ClipboardEvent<HTMLInputElement>) => {
    e.preventDefault();
    const pasted = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, 6);
    if (pasted.length === 6) {
      setVerificationCode(pasted.split(''));
      codeInputRefs.current[5]?.focus();
    }
  };

  // Step 2: Verify code
  const handleVerifySubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const code = verificationCode.join('');
    if (code.length !== 6) { setError('Please enter the full 6-digit code'); return; }
    setError('');
    setLoading(true);
    try {
      const res = await api.post('/verification/verify', { email, code });
      if (res.data.verified) { setStep('profile'); }
      else { setError('Invalid verification code.'); }
    } catch {
      setError('Invalid or expired code. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const handleResendCode = async () => {
    if (resendTimer > 0) return;
    setLoading(true);
    try {
      const res = await api.post('/verification/send', { email });
      if (res.data.code) setDevCode(res.data.code);
      setResendTimer(60);
    } catch {
      setError('Failed to resend code.');
    } finally {
      setLoading(false);
    }
  };

  // Step 3: Create account
  const handleProfileSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedCity) { setError('Please select your city'); return; }
    if (!addressLat || !addressLng) { setError('Please enter your address so we can show accurate distances'); return; }
    if (!pricePerMatch || parseFloat(pricePerMatch) < 10) { setError('Please set a price of at least $10'); return; }
    setError('');
    setLoading(true);
    try {
      const lat = addressLat;
      const lng = addressLng;

      if (isGoogleUser) {
        const response = await authApi.googleCompleteRegistration({
          googleAccessToken: googleAccessToken,
          firstName,
          lastName,
          phoneNumber: phone,
          pricePerMatch: parseFloat(pricePerMatch),
          experienceYears: parseInt(experienceYears) || 0,
          bio: bio || undefined,
          latitude: lat,
          longitude: lng,
          maxTravelDistanceKm: parseInt(maxDistance),
        });
        login(response.accessToken, response.user);
      } else {
        const response = await authApi.register({
          email, password, firstName, lastName, phoneNumber: phone, role: 'Goalkeeper',
        });
        login(response.accessToken, response.user);

        await goalkeepersApi.updateProfile({
          pricePerMatch: parseFloat(pricePerMatch),
          experienceYears: parseInt(experienceYears) || 0,
          bio: bio || undefined,
          latitude: lat,
          longitude: lng,
          maxTravelDistanceKm: parseInt(maxDistance),
          isAvailable: true,
        });
      }

      router.push('/dashboard/goalkeeper');
    } catch (err: unknown) {
      const error = err as { response?: { data?: { error?: string } } };
      setError(error.response?.data?.error || 'Registration failed');
    } finally {
      setLoading(false);
    }
  };

  // Progress
  const steps: { key: Step | 'google-extra'; label: string }[] = [
    { key: 'info', label: 'Account' },
    { key: 'verify', label: 'Verify' },
    { key: 'profile', label: 'Profile' },
  ];
  const stepIndex = step === 'info' || step === 'google-extra' ? 0 : step === 'verify' ? 1 : 2;

  return (
    <div className="min-h-[80vh] flex items-center justify-center px-4 py-12">
      <div className="w-full max-w-lg">
        {/* Progress Bar */}
        <div className="flex items-center justify-center gap-2 mb-8">
          {steps.map((s, i) => (
            <div key={s.key} className="flex items-center">
              <div className="flex items-center gap-2">
                <div className={cn(
                  'flex h-8 w-8 items-center justify-center rounded-full text-sm font-semibold transition-all',
                  i < stepIndex ? 'bg-emerald-600 text-white' :
                  i === stepIndex ? 'bg-emerald-600 text-white ring-4 ring-emerald-100' : 'bg-slate-200 text-slate-500'
                )}>
                  {i < stepIndex ? <CheckCircle size={16} /> : i + 1}
                </div>
                <span className={cn('text-sm font-medium hidden sm:block', i <= stepIndex ? 'text-slate-900' : 'text-slate-400')}>
                  {s.label}
                </span>
              </div>
              {i < steps.length - 1 && <div className={cn('w-8 sm:w-12 h-0.5 mx-2', i < stepIndex ? 'bg-emerald-600' : 'bg-slate-200')} />}
            </div>
          ))}
        </div>

        {/* ========== STEP 1: ACCOUNT INFO ========== */}
        {step === 'info' && (
          <Card>
            <div className="text-center mb-8">
              <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mx-auto mb-4">
                <Shield size={28} />
              </div>
              <h1 className="text-2xl font-bold text-slate-900">Join as a Goalkeeper</h1>
              <p className="mt-2 text-sm text-slate-500">Create your profile, set your price, and start earning</p>
            </div>

            {/* Google Sign In */}
            {GOOGLE_CLIENT_ID && (
              <button
                type="button"
                onClick={handleGoogleSignIn}
                className="w-full flex items-center justify-center gap-3 rounded-lg border-2 border-slate-200 bg-white px-4 py-3 text-sm font-medium text-slate-700 hover:bg-slate-50 hover:border-slate-300 transition-all mb-6"
              >
                <svg width="20" height="20" viewBox="0 0 24 24">
                  <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/>
                  <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                  <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                  <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                </svg>
                Sign up with Google
              </button>
            )}

            <div className="relative mb-6">
              <div className="absolute inset-0 flex items-center"><div className="w-full border-t border-slate-200" /></div>
              <div className="relative flex justify-center text-xs uppercase">
                <span className="bg-white px-3 text-slate-400">or sign up with email</span>
              </div>
            </div>

            <form onSubmit={handleInfoSubmit} className="space-y-4">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <div className="grid grid-cols-2 gap-3">
                <Input id="firstName" label="First Name" placeholder="Marcus" value={firstName} onChange={(e) => setFirstName(e.target.value)} required />
                <Input id="lastName" label="Last Name" placeholder="Silva" value={lastName} onChange={(e) => setLastName(e.target.value)} required />
              </div>
              <Input id="email" label="Email" type="email" placeholder="you@example.com" value={email} onChange={(e) => setEmail(e.target.value)} required />
              <Input id="phone" label="Phone Number" type="tel" placeholder="+1 (416) 555-0123" value={phone} onChange={(e) => setPhone(e.target.value)} required />
              <Input id="password" label="Password" type="password" placeholder="Min. 8 characters" value={password} onChange={(e) => setPassword(e.target.value)} required minLength={8} />
              <p className="text-xs text-slate-400 -mt-2">We&apos;ll send a verification code to your email</p>
              <Button type="submit" className="w-full" isLoading={loading}>Continue <ChevronRight size={18} className="ml-1" /></Button>
            </form>
            <p className="mt-6 text-center text-sm text-slate-500">
              Already have an account?{' '}
              <Link href="/auth/login" className="font-medium text-emerald-600 hover:text-emerald-700">Sign in</Link>
            </p>
          </Card>
        )}

        {/* ========== STEP 1b: GOOGLE EXTRA INFO ========== */}
        {step === 'google-extra' && (
          <Card>
            <div className="text-center mb-8">
              {googlePhoto ? (
                <Image src={googlePhoto} alt="" width={64} height={64} className="rounded-full mx-auto mb-4 border-4 border-emerald-100" />
              ) : (
                <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mx-auto mb-4">
                  <CheckCircle size={28} />
                </div>
              )}
              <h1 className="text-2xl font-bold text-slate-900">Welcome, {firstName}!</h1>
              <p className="mt-2 text-sm text-slate-500">
                Signed in as <span className="font-medium text-slate-700">{email}</span>
              </p>
              <p className="mt-1 text-sm text-slate-500">We just need a bit more info to complete your signup</p>
            </div>

            <form onSubmit={handleGoogleExtraSubmit} className="space-y-4">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <Input id="phone" label="Phone Number" type="tel" placeholder="+1 (416) 555-0123" value={phone} onChange={(e) => setPhone(e.target.value)} required />
              <p className="text-xs text-slate-400 -mt-2">Teams may need to reach you about the match</p>
              <Button type="submit" className="w-full" isLoading={loading}>
                Continue <ChevronRight size={18} className="ml-1" />
              </Button>
            </form>

            <button onClick={() => { setStep('info'); setIsGoogleUser(false); }} className="mt-4 w-full text-center text-sm text-slate-400 hover:text-slate-600">
              Use a different account
            </button>
          </Card>
        )}

        {/* ========== STEP 2: EMAIL VERIFICATION ========== */}
        {step === 'verify' && (
          <Card>
            <button onClick={() => setStep(isGoogleUser ? 'google-extra' : 'info')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 transition-colors mb-6">
              <ArrowLeft size={16} /> Back
            </button>
            <div className="text-center mb-8">
              <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-blue-100 text-blue-600 mx-auto mb-4">
                <Mail size={28} />
              </div>
              <h1 className="text-2xl font-bold text-slate-900">Verify Your Email</h1>
              <p className="mt-2 text-sm text-slate-500">
                We sent a 6-digit code to <span className="font-medium text-slate-700">{email}</span>
              </p>
            </div>

            {devCode && (
              <div className="mb-4 p-3 rounded-lg bg-amber-50 border border-amber-200 text-center">
                <p className="text-xs text-amber-600 font-medium mb-1">Dev Mode — Your code:</p>
                <p className="text-2xl font-bold text-amber-800 tracking-widest">{devCode}</p>
              </div>
            )}

            <form onSubmit={handleVerifySubmit} className="space-y-6">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <div className="flex justify-center gap-3">
                {verificationCode.map((digit, i) => (
                  <input
                    key={i}
                    ref={(el) => { codeInputRefs.current[i] = el; }}
                    type="text"
                    inputMode="numeric"
                    maxLength={1}
                    value={digit}
                    onChange={(e) => handleCodeChange(i, e.target.value)}
                    onKeyDown={(e) => handleCodeKeyDown(i, e)}
                    onPaste={i === 0 ? handleCodePaste : undefined}
                    className={cn(
                      'h-14 w-12 rounded-lg border-2 text-center text-xl font-bold transition-all focus:outline-none',
                      digit ? 'border-emerald-500 bg-emerald-50 text-emerald-700' : 'border-slate-300 text-slate-900 focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/20'
                    )}
                  />
                ))}
              </div>
              <Button type="submit" className="w-full" isLoading={loading}>Verify & Continue <ChevronRight size={18} className="ml-1" /></Button>
              <div className="text-center">
                {resendTimer > 0 ? (
                  <p className="text-sm text-slate-400">Resend code in <span className="font-medium text-slate-600">{resendTimer}s</span></p>
                ) : (
                  <button type="button" onClick={handleResendCode} className="text-sm font-medium text-emerald-600 hover:text-emerald-700">
                    Didn&apos;t receive the code? Resend
                  </button>
                )}
              </div>
            </form>
          </Card>
        )}

        {/* ========== STEP 3: PROFILE SETUP ========== */}
        {step === 'profile' && (
          <Card className="max-w-2xl mx-auto">
            <div className="text-center mb-8">
              {googlePhoto ? (
                <Image src={googlePhoto} alt="" width={64} height={64} className="rounded-full mx-auto mb-4 border-4 border-emerald-100" />
              ) : (
                <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mx-auto mb-4">
                  <CheckCircle size={28} />
                </div>
              )}
              <h1 className="text-2xl font-bold text-slate-900">Set Up Your Profile</h1>
              <p className="mt-2 text-sm text-slate-500">Tell teams about yourself, set your price, and choose where you play</p>
            </div>

            <form onSubmit={handleProfileSubmit} className="space-y-6">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}

              {/* Price */}
              <div className="p-5 rounded-xl bg-emerald-50 border border-emerald-200">
                <div className="flex items-center gap-2 mb-3">
                  <DollarSign size={20} className="text-emerald-600" />
                  <h2 className="text-base font-semibold text-slate-900">Your Price</h2>
                </div>
                <Input id="price" label="Price per match (CAD)" type="number" min="10" step="5" placeholder="e.g. 50" value={pricePerMatch} onChange={(e) => setPricePerMatch(e.target.value)} required />
                <p className="mt-2 text-xs text-slate-500">This is how much teams will see. You can change it anytime.</p>
              </div>

              {/* City & Address */}
              <div>
                <div className="flex items-center gap-2 mb-3">
                  <MapPin size={20} className="text-emerald-600" />
                  <h2 className="text-base font-semibold text-slate-900">Your Location</h2>
                </div>
                <select
                  value={selectedCity}
                  onChange={(e) => setSelectedCity(e.target.value)}
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20 mb-3"
                  required
                >
                  <option value="">Select your city...</option>
                  {CANADIAN_CITIES.map((city) => (
                    <option key={city.id} value={city.id}>{city.name}, {city.province}</option>
                  ))}
                </select>
                <div className="relative">
                  <label className="block text-sm font-medium text-slate-700 mb-1">Your address or neighbourhood</label>
                  <input
                    placeholder="Start typing your address..."
                    autoComplete="off"
                    value={addressInput}
                    onChange={(e) => { setAddressInput(e.target.value); searchAddress(e.target.value); }}
                    onFocus={() => { if (addressSuggestions.length > 0) setShowAddrSuggestions(true); }}
                    onBlur={() => setTimeout(() => setShowAddrSuggestions(false), 200)}
                    required
                    className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
                  />
                  {showAddrSuggestions && (
                    <div className="absolute z-50 top-full left-0 right-0 mt-1 bg-white border border-slate-200 rounded-lg shadow-lg max-h-48 overflow-y-auto">
                      {addressSuggestions.map((s, i) => (
                        <button
                          key={i}
                          type="button"
                          onMouseDown={() => {
                            setAddressInput(s.display.split(',').slice(0, 3).join(','));
                            setAddressLat(s.lat);
                            setAddressLng(s.lng);
                            setShowAddrSuggestions(false);
                          }}
                          className="w-full text-left px-4 py-2.5 text-sm hover:bg-emerald-50 border-b border-slate-100 last:border-0"
                        >
                          <p className="text-slate-900 truncate">{s.display}</p>
                        </button>
                      ))}
                    </div>
                  )}
                  {addressLat && addressLng && (
                    <p className="mt-1 text-xs text-emerald-600 flex items-center gap-1"><CheckCircle size={12} /> Location set</p>
                  )}
                  <p className="mt-1 text-xs text-slate-400">This helps show accurate distances to nearby fields. Your exact address is never shared.</p>
                </div>
              </div>

              {/* Max distance */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">Maximum travel distance</label>
                <select value={maxDistance} onChange={(e) => setMaxDistance(e.target.value)} className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                  <option value="5">Up to 5 km</option>
                  <option value="10">Up to 10 km</option>
                  <option value="15">Up to 15 km</option>
                  <option value="20">Up to 20 km</option>
                  <option value="25">Up to 25 km</option>
                  <option value="30">Up to 30 km</option>
                  <option value="50">Up to 50 km</option>
                </select>
              </div>

              {/* Experience */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">Years of experience</label>
                <select value={experienceYears} onChange={(e) => setExperienceYears(e.target.value)} className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20" required>
                  <option value="">Select...</option>
                  <option value="1">Less than 1 year</option>
                  <option value="2">1-2 years</option>
                  <option value="5">3-5 years</option>
                  <option value="8">5-8 years</option>
                  <option value="10">8-10 years</option>
                  <option value="15">10+ years</option>
                </select>
              </div>

              {/* Bio */}
              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">About you (optional)</label>
                <textarea
                  placeholder="Tell teams about your experience, playing style, availability..."
                  value={bio} onChange={(e) => setBio(e.target.value)} rows={3}
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
                />
              </div>

              <Button type="submit" size="lg" className="w-full" isLoading={loading}>
                Create My Goalkeeper Profile
              </Button>
            </form>
          </Card>
        )}
      </div>
    </div>
  );
}
