'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import Card from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import { useAuth } from '@/lib/auth-context';
import { profileApi } from '@/lib/api';
import { CANADIAN_CITIES } from '@/lib/fields-data';
import { ArrowLeft, User, Shield, DollarSign, MapPin, Lock, Trash2, Loader2, CheckCircle } from 'lucide-react';
import Link from 'next/link';

export default function SettingsPage() {
  const router = useRouter();
  const { user, logout } = useAuth();
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [error, setError] = useState('');

  // Personal info
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [phone, setPhone] = useState('');

  // Password
  const [currentPassword, setCurrentPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  // Goalkeeper settings
  const [price, setPrice] = useState('');
  const [experience, setExperience] = useState('');
  const [bio, setBio] = useState('');
  const [city, setCity] = useState('');
  const [maxDistance, setMaxDistance] = useState('15');
  const [isAvailable, setIsAvailable] = useState(true);
  const [addressInput, setAddressInput] = useState('');
  const [addressLat, setAddressLat] = useState<number | null>(null);
  const [addressLng, setAddressLng] = useState<number | null>(null);
  const [addressSuggestions, setAddressSuggestions] = useState<Array<{ display: string; lat: number; lng: number }>>([]);
  const [showAddrSuggestions, setShowAddrSuggestions] = useState(false);
  const addrTimerRef = useRef<NodeJS.Timeout | null>(null);

  // Google user flag
  const [isGoogleUser, setIsGoogleUser] = useState(false);

  // Delete
  const [deletePassword, setDeletePassword] = useState('');
  const [showDelete, setShowDelete] = useState(false);

  const searchAddr = (query: string) => {
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

  useEffect(() => {
    const fetchProfile = async () => {
      try {
        const data = await profileApi.get();
        setFirstName(data.firstName || '');
        setLastName(data.lastName || '');
        setPhone(data.phoneNumber || '');
        setIsGoogleUser(data.isGoogleUser || false);

        if (data.goalkeeper) {
          setPrice(data.goalkeeper.pricePerMatch?.toString() || '');
          setExperience(data.goalkeeper.experienceYears?.toString() || '');
          setBio(data.goalkeeper.bio || '');
          setMaxDistance(data.goalkeeper.maxTravelDistanceKm?.toString() || '15');
          setIsAvailable(data.goalkeeper.isAvailable ?? true);
          setAddressLat(data.goalkeeper.latitude);
          setAddressLng(data.goalkeeper.longitude);

          const matchedCity = CANADIAN_CITIES.find(
            (c) => Math.abs(c.lat - data.goalkeeper.latitude) < 0.5 && Math.abs(c.lng - data.goalkeeper.longitude) < 0.5
          );
          if (matchedCity) setCity(matchedCity.id);
        }
      } catch {
        setError('Failed to load profile');
      } finally {
        setLoading(false);
      }
    };
    fetchProfile();
  }, []);

  const showSuccess = (msg: string) => {
    setSuccess(msg);
    setTimeout(() => setSuccess(null), 3000);
  };

  const handleSavePersonal = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving('personal');
    setError('');
    try {
      await profileApi.updatePersonal({ firstName, lastName, phoneNumber: phone });
      showSuccess('Personal info updated');
    } catch {
      setError('Failed to update personal info');
    } finally {
      setSaving(null);
    }
  };

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (newPassword !== confirmPassword) { setError('Passwords do not match'); return; }
    if (newPassword.length < 8) { setError('Password must be at least 8 characters'); return; }
    setSaving('password');
    setError('');
    try {
      await profileApi.changePassword({ currentPassword, newPassword });
      setCurrentPassword('');
      setNewPassword('');
      setConfirmPassword('');
      showSuccess('Password changed');
    } catch (err: unknown) {
      const e = err as { response?: { data?: { error?: string } } };
      setError(e.response?.data?.error || 'Failed to change password');
    } finally {
      setSaving(null);
    }
  };

  const handleSaveGoalkeeper = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving('goalkeeper');
    setError('');
    try {
      const selectedCity = CANADIAN_CITIES.find((c) => c.id === city);
      const lat = addressLat || selectedCity?.lat;
      const lng = addressLng || selectedCity?.lng;
      await profileApi.updateGoalkeeper({
        pricePerMatch: parseFloat(price) || undefined,
        experienceYears: parseInt(experience) || undefined,
        bio: bio || undefined,
        latitude: lat,
        longitude: lng,
        maxTravelDistanceKm: parseInt(maxDistance),
        isAvailable,
      });
      showSuccess('Goalkeeper settings updated');
    } catch {
      setError('Failed to update settings');
    } finally {
      setSaving(null);
    }
  };

  const handleDeleteAccount = async () => {
    if (!confirm('Are you sure? This will deactivate your account.')) return;
    setSaving('delete');
    try {
      await profileApi.deleteAccount(deletePassword || undefined);
      logout();
      router.push('/');
    } catch (err: unknown) {
      const e = err as { response?: { data?: { error?: string } } };
      setError(e.response?.data?.error || 'Failed to delete account');
      setSaving(null);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 size={32} className="animate-spin text-emerald-600" />
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <Link href="/dashboard/goalkeeper" className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
        <ArrowLeft size={16} /> Back to Dashboard
      </Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-2">Settings</h1>
      <p className="text-slate-500 mb-8">Manage your account and goalkeeper profile</p>

      {success && (
        <div className="mb-6 p-3 rounded-lg bg-emerald-50 border border-emerald-200 flex items-center gap-2 text-sm text-emerald-700">
          <CheckCircle size={16} /> {success}
        </div>
      )}
      {error && (
        <div className="mb-6 p-3 rounded-lg bg-red-50 border border-red-200 text-sm text-red-700">{error}</div>
      )}

      <div className="space-y-8">
        {/* Personal Info */}
        <Card>
          <form onSubmit={handleSavePersonal}>
            <div className="flex items-center gap-2 mb-4">
              <User size={20} className="text-emerald-600" />
              <h2 className="text-lg font-semibold text-slate-900">Personal Information</h2>
            </div>
            <div className="space-y-4">
              <div className="p-3 rounded-lg bg-slate-50 text-sm">
                <span className="text-slate-500">Email: </span>
                <span className="text-slate-900 font-medium">{user?.email}</span>
                <span className="text-xs text-slate-400 ml-2">(cannot be changed)</span>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <Input id="firstName" label="First Name" value={firstName} onChange={(e) => setFirstName(e.target.value)} required />
                <Input id="lastName" label="Last Name" value={lastName} onChange={(e) => setLastName(e.target.value)} required />
              </div>
              <Input id="phone" label="Phone Number" type="tel" value={phone} onChange={(e) => setPhone(e.target.value)} />
            </div>
            <div className="mt-4 flex justify-end">
              <Button type="submit" isLoading={saving === 'personal'}>Save Changes</Button>
            </div>
          </form>
        </Card>

        {/* Goalkeeper Settings */}
        <Card>
          <form onSubmit={handleSaveGoalkeeper}>
            <div className="flex items-center gap-2 mb-4">
              <Shield size={20} className="text-emerald-600" />
              <h2 className="text-lg font-semibold text-slate-900">Goalkeeper Profile</h2>
            </div>
            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <div className="flex items-center gap-1 mb-1">
                    <DollarSign size={14} className="text-emerald-600" />
                    <label className="text-sm font-medium text-slate-700">Price per match (CAD)</label>
                  </div>
                  <input type="number" min="10" step="5" value={price} onChange={(e) => setPrice(e.target.value)}
                    className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-slate-700 mb-1">Experience</label>
                  <select value={experience} onChange={(e) => setExperience(e.target.value)}
                    className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                    <option value="0">Select...</option>
                    <option value="1">Less than 1 year</option>
                    <option value="2">1-2 years</option>
                    <option value="5">3-5 years</option>
                    <option value="8">5-8 years</option>
                    <option value="10">8-10 years</option>
                    <option value="15">10+ years</option>
                  </select>
                </div>
              </div>

              <div>
                <div className="flex items-center gap-1 mb-1">
                  <MapPin size={14} className="text-emerald-600" />
                  <label className="text-sm font-medium text-slate-700">Your Location</label>
                </div>
                <select value={city} onChange={(e) => setCity(e.target.value)}
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20 mb-3">
                  <option value="">Select city...</option>
                  {CANADIAN_CITIES.map((c) => <option key={c.id} value={c.id}>{c.name}, {c.province}</option>)}
                </select>
                <div className="relative">
                  <label className="block text-sm font-medium text-slate-700 mb-1">Your address or neighbourhood</label>
                  <input
                    placeholder="Start typing your address..."
                    autoComplete="off"
                    value={addressInput}
                    onChange={(e) => { setAddressInput(e.target.value); searchAddr(e.target.value); }}
                    onFocus={() => { if (addressSuggestions.length > 0) setShowAddrSuggestions(true); }}
                    onBlur={() => setTimeout(() => setShowAddrSuggestions(false), 200)}
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
                  <p className="mt-1 text-xs text-slate-400">Update your address for accurate distance calculations. Your exact address is never shared.</p>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">Max travel distance</label>
                <select value={maxDistance} onChange={(e) => setMaxDistance(e.target.value)}
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                  <option value="5">Up to 5 km</option>
                  <option value="10">Up to 10 km</option>
                  <option value="15">Up to 15 km</option>
                  <option value="20">Up to 20 km</option>
                  <option value="25">Up to 25 km</option>
                  <option value="30">Up to 30 km</option>
                  <option value="50">Up to 50 km</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-slate-700 mb-1">Bio</label>
                <textarea value={bio} onChange={(e) => setBio(e.target.value)} rows={3} placeholder="Tell teams about your experience..."
                  className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20" />
              </div>

              <div className="flex items-center justify-between p-3 rounded-lg bg-slate-50">
                <div>
                  <p className="text-sm font-medium text-slate-900">Available for bookings</p>
                  <p className="text-xs text-slate-500">Toggle off to stop receiving new booking requests</p>
                </div>
                <button type="button" onClick={() => setIsAvailable(!isAvailable)}
                  className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${isAvailable ? 'bg-emerald-600' : 'bg-slate-300'}`}>
                  <span className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${isAvailable ? 'translate-x-6' : 'translate-x-1'}`} />
                </button>
              </div>
            </div>
            <div className="mt-4 flex justify-end">
              <Button type="submit" isLoading={saving === 'goalkeeper'}>Save Changes</Button>
            </div>
          </form>
        </Card>

        {/* Change Password — only for non-Google users */}
        {!isGoogleUser && (
          <Card>
            <form onSubmit={handleChangePassword}>
              <div className="flex items-center gap-2 mb-4">
                <Lock size={20} className="text-emerald-600" />
                <h2 className="text-lg font-semibold text-slate-900">Change Password</h2>
              </div>
              <div className="space-y-4">
                <Input id="currentPassword" label="Current Password" type="password" value={currentPassword} onChange={(e) => setCurrentPassword(e.target.value)} required />
                <Input id="newPassword" label="New Password" type="password" placeholder="Min. 8 characters" value={newPassword} onChange={(e) => setNewPassword(e.target.value)} required minLength={8} />
                <Input id="confirmPassword" label="Confirm New Password" type="password" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} required />
              </div>
              <div className="mt-4 flex justify-end">
                <Button type="submit" isLoading={saving === 'password'}>Change Password</Button>
              </div>
            </form>
          </Card>
        )}

        {/* Delete Account */}
        <Card className="border-red-200">
          <div className="flex items-center gap-2 mb-4">
            <Trash2 size={20} className="text-red-500" />
            <h2 className="text-lg font-semibold text-slate-900">Delete Account</h2>
          </div>
          <p className="text-sm text-slate-500 mb-4">
            This will deactivate your account and hide your profile from search results. Your data will be retained for 30 days before permanent deletion.
          </p>
          {!showDelete ? (
            <Button variant="danger" onClick={() => setShowDelete(true)}>Delete My Account</Button>
          ) : (
            <div className="space-y-3">
              {isGoogleUser ? (
                <p className="text-sm text-slate-600">Click confirm below to deactivate your Google-linked account.</p>
              ) : (
                <Input id="deletePassword" label="Enter your password to confirm" type="password" value={deletePassword} onChange={(e) => setDeletePassword(e.target.value)} />
              )}
              <div className="flex gap-2">
                <Button variant="danger" onClick={handleDeleteAccount} isLoading={saving === 'delete'}>Confirm Delete</Button>
                <Button variant="ghost" onClick={() => setShowDelete(false)}>Cancel</Button>
              </div>
            </div>
          )}
        </Card>
      </div>
    </div>
  );
}
