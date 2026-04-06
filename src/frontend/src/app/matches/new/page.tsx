'use client';

import { useState } from 'react';
import Card from '@/components/ui/Card';
import Input from '@/components/ui/Input';
import Button from '@/components/ui/Button';
import GoalkeeperCard from '@/components/goalkeepers/GoalkeeperCard';
import { goalkeepersApi } from '@/lib/api';
import { CANADIAN_CITIES, type City, type Field } from '@/lib/fields-data';
import { MapPin, Clock, Search, ArrowLeft, Loader2, ChevronRight } from 'lucide-react';
import { cn } from '@/lib/utils';
import type { GoalkeeperProfile } from '@/types';

type Step = 'city' | 'form' | 'results';

export default function FindGoalkeeperPage() {
  const [step, setStep] = useState<Step>('city');
  const [selectedCity, setSelectedCity] = useState<City | null>(null);
  const [citySearch, setCitySearch] = useState('');

  const [selectedField, setSelectedField] = useState<Field | null>(null);
  const [fieldSearch, setFieldSearch] = useState('');
  const [customAddress, setCustomAddress] = useState('');
  const [customFieldName, setCustomFieldName] = useState('');

  const [matchDate, setMatchDate] = useState('');
  const [matchTime, setMatchTime] = useState('');
  const [duration, setDuration] = useState('60');

  const [loading, setLoading] = useState(false);
  const [results, setResults] = useState<GoalkeeperProfile[]>([]);

  const filteredCities = citySearch
    ? CANADIAN_CITIES.filter((c) =>
        c.name.toLowerCase().includes(citySearch.toLowerCase()) ||
        c.province.toLowerCase().includes(citySearch.toLowerCase())
      )
    : CANADIAN_CITIES;

  const provinces = [...new Set(filteredCities.map((c) => c.province))].sort();

  const filteredFields = selectedCity
    ? (fieldSearch
        ? selectedCity.fields.filter((f) =>
            f.name.toLowerCase().includes(fieldSearch.toLowerCase()) ||
            f.address.toLowerCase().includes(fieldSearch.toLowerCase())
          )
        : selectedCity.fields)
    : [];

  const handleSelectCity = (city: City) => {
    setSelectedCity(city);
    setSelectedField(null);
    setFieldSearch('');
    setStep('form');
  };

  const [formError, setFormError] = useState('');

  const fieldIsSelected = !!selectedField || !!customFieldName.trim();
  const gameDetailsComplete = fieldIsSelected && !!matchDate && !!matchTime;

  const handleSearch = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!fieldIsSelected) {
      setFormError('Please select a field or enter a custom location name.');
      return;
    }
    if (!matchDate || !matchTime) {
      setFormError('Please select a date and time for the game.');
      return;
    }
    setFormError('');
    setLoading(true);
    try {
      const lat = selectedField?.lat || selectedCity?.lat || 43.6532;
      const lng = selectedField?.lng || selectedCity?.lng || -79.3832;
      const matchDateTime = matchDate && matchTime ? new Date(`${matchDate}T${matchTime}`).toISOString() : undefined;
      const data = await goalkeepersApi.getNearby(lat, lng, 30, 1, 20, matchDateTime);
      setResults(data.items);
    } catch {
      setResults([]);
    } finally {
      setLoading(false);
      setStep('results');
    }
  };

  // =================== STEP 3: RESULTS ===================
  if (step === 'results') {
    const locationName = selectedField?.name || customFieldName || selectedCity?.name || '';

    return (
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <button onClick={() => setStep('form')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 transition-colors mb-6">
          <ArrowLeft size={16} /> Back to search
        </button>
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-slate-900">Available Goalkeepers</h1>
          <p className="mt-1 text-slate-500">
            {results.length} goalkeeper{results.length !== 1 ? 's' : ''} found near {locationName}
          </p>
          <div className="mt-3 flex flex-wrap gap-2 text-xs">
            <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-3 py-1 text-slate-600">
              <MapPin size={12} /> {selectedCity?.name}, {selectedCity?.province}
            </span>
            {selectedField && (
              <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-3 py-1 text-slate-600">
                {selectedField.name}
              </span>
            )}
            {matchDate && (
              <span className="inline-flex items-center gap-1 rounded-full bg-slate-100 px-3 py-1 text-slate-600">
                <Clock size={12} /> {matchDate} at {matchTime}
              </span>
            )}
          </div>
        </div>

        {results.length > 0 ? (
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {results.map((gk) => (
              <GoalkeeperCard
                key={gk.id}
                goalkeeper={gk}
                searchContext={{
                  cityId: selectedCity?.id,
                  fieldName: selectedField?.name,
                  fieldAddress: selectedField?.address,
                  fieldLat: selectedField?.lat,
                  fieldLng: selectedField?.lng,
                  date: matchDate,
                  time: matchTime,
                  duration,
                  province: selectedCity?.province,
                }}
              />
            ))}
          </div>
        ) : (
          <Card className="text-center py-12">
            <p className="text-slate-500">No goalkeepers available near this location right now.</p>
            <p className="text-sm text-slate-400 mt-1">Try a different area or check back later.</p>
          </Card>
        )}
      </div>
    );
  }

  // =================== STEP 1: CITY SELECTION ===================
  if (step === 'city') {
    return (
      <div className="mx-auto max-w-4xl px-4 py-12">
        <div className="mb-8 text-center">
          <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mb-4">
            <MapPin size={28} />
          </div>
          <h1 className="text-3xl font-bold text-slate-900">Where are you playing?</h1>
          <p className="mt-2 text-slate-500">Select your city to find goalkeepers nearby</p>
        </div>

        <div className="relative mb-6 max-w-md mx-auto">
          <Search size={18} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
          <input
            type="text"
            placeholder="Search cities..."
            value={citySearch}
            onChange={(e) => setCitySearch(e.target.value)}
            className="w-full rounded-lg border border-slate-300 pl-10 pr-4 py-3 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
            autoFocus
          />
        </div>

        <div className="space-y-6">
          {provinces.map((province) => {
            const cities = filteredCities.filter((c) => c.province === province);
            if (cities.length === 0) return null;
            const provinceNames: Record<string, string> = {
              ON: 'Ontario', BC: 'British Columbia', QC: 'Quebec', AB: 'Alberta',
              MB: 'Manitoba', SK: 'Saskatchewan', NS: 'Nova Scotia', NB: 'New Brunswick',
            };
            return (
              <div key={province}>
                <h2 className="text-sm font-semibold text-slate-500 uppercase tracking-wider mb-3">{provinceNames[province] || province}</h2>
                <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">
                  {cities.map((city) => (
                    <button
                      key={city.id}
                      onClick={() => handleSelectCity(city)}
                      className="flex items-center justify-between p-4 rounded-xl border-2 border-slate-200 bg-white hover:border-emerald-500 hover:bg-emerald-50 transition-all text-left group"
                    >
                      <div>
                        <p className="font-semibold text-slate-900 group-hover:text-emerald-700">{city.name}</p>
                        <p className="text-xs text-slate-500">{city.fields.length} field{city.fields.length !== 1 ? 's' : ''}</p>
                      </div>
                      <ChevronRight size={18} className="text-slate-300 group-hover:text-emerald-500" />
                    </button>
                  ))}
                </div>
              </div>
            );
          })}
        </div>

        {filteredCities.length === 0 && (
          <p className="text-center text-slate-400 py-8">No cities match your search.</p>
        )}

        <p className="text-center text-sm text-slate-400 mt-8">
          {CANADIAN_CITIES.length} cities across Canada &middot; {CANADIAN_CITIES.reduce((sum, c) => sum + c.fields.length, 0)} fields
        </p>
      </div>
    );
  }

  // =================== STEP 2: MATCH DETAILS FORM ===================
  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <button onClick={() => setStep('city')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 transition-colors mb-6">
        <ArrowLeft size={16} /> Change city
      </button>

      <div className="mb-8 text-center">
        <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mb-4">
          <Search size={28} />
        </div>
        <h1 className="text-3xl font-bold text-slate-900">Find a Goalkeeper</h1>
        <p className="mt-2 text-slate-500">
          in <span className="font-semibold text-emerald-600">{selectedCity?.name}, {selectedCity?.province}</span>
        </p>
      </div>

      <form onSubmit={handleSearch} className="space-y-6">
        {/* Field Selection */}
        <Card>
          <div className="flex items-center gap-2 mb-4">
            <MapPin size={20} className="text-emerald-600" />
            <h2 className="text-lg font-semibold text-slate-900">Select a Field</h2>
            <span className="text-xs text-slate-400 ml-auto">{selectedCity?.fields.length} fields</span>
          </div>

          <div className="relative mb-3">
            <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
            <input
              type="text"
              placeholder="Search fields..."
              value={fieldSearch}
              onChange={(e) => setFieldSearch(e.target.value)}
              className="w-full rounded-lg border border-slate-300 pl-9 pr-4 py-2 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
            />
          </div>

          <div className="grid sm:grid-cols-2 gap-2 max-h-72 overflow-y-auto pr-1">
            {filteredFields.map((field) => (
              <button
                key={field.name}
                type="button"
                onClick={() => { setSelectedField(field); setCustomFieldName(field.name); setCustomAddress(field.address); }}
                className={cn(
                  'text-left p-3 rounded-lg border-2 transition-all',
                  selectedField?.name === field.name ? 'border-emerald-500 bg-emerald-50' : 'border-slate-200 hover:border-slate-300'
                )}
              >
                <div className="flex items-start justify-between gap-1">
                  <p className="text-sm font-medium text-slate-900">{field.name}</p>
                  <span className={cn(
                    'text-[10px] px-1.5 py-0.5 rounded-full shrink-0',
                    field.type === 'Indoor' ? 'bg-blue-100 text-blue-700' :
                    field.type === 'Outdoor' ? 'bg-green-100 text-green-700' : 'bg-purple-100 text-purple-700'
                  )}>
                    {field.type}
                  </span>
                </div>
                <p className="text-xs text-slate-500 mt-0.5">{field.address}</p>
              </button>
            ))}
          </div>

          {filteredFields.length === 0 && (
            <p className="text-sm text-slate-400 text-center py-4">No fields match your search</p>
          )}

          <div className="border-t border-slate-200 pt-4 mt-4">
            <p className="text-sm text-slate-500 mb-3">Or enter a custom location:</p>
            <div className="grid sm:grid-cols-2 gap-3">
              <Input placeholder="Field / venue name" value={customFieldName} onChange={(e) => { setCustomFieldName(e.target.value); setSelectedField(null); }} />
              <Input placeholder="Full address" value={customAddress} onChange={(e) => setCustomAddress(e.target.value)} />
            </div>
          </div>
        </Card>

        {/* Date & Time */}
        <Card>
          <div className="flex items-center gap-2 mb-4">
            <Clock size={20} className="text-emerald-600" />
            <h2 className="text-lg font-semibold text-slate-900">When is the game?</h2>
          </div>
          <div className="grid sm:grid-cols-3 gap-4">
            <Input id="date" label="Date" type="date" value={matchDate} onChange={(e) => setMatchDate(e.target.value)} required />
            <Input id="time" label="Start Time" type="time" value={matchTime} onChange={(e) => setMatchTime(e.target.value)} required />
            <div className="space-y-1">
              <label className="block text-sm font-medium text-slate-700">Duration</label>
              <select value={duration} onChange={(e) => setDuration(e.target.value)} className="w-full rounded-lg border border-slate-300 px-4 py-2.5 text-sm text-slate-900 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                <option value="30">30 minutes</option>
                <option value="60">60 minutes</option>
                <option value="90">90 minutes</option>
                <option value="120">120 minutes</option>
              </select>
            </div>
          </div>
        </Card>

        {formError && (
          <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{formError}</div>
        )}

        <Button type="submit" size="lg" className="w-full" isLoading={loading} disabled={!gameDetailsComplete}>
          {loading ? <Loader2 size={20} className="mr-2 animate-spin" /> : <Search size={20} className="mr-2" />}
          Find Available Goalkeepers
        </Button>

        {!gameDetailsComplete && (
          <p className="text-center text-sm text-slate-400">
            Please select a field and game date/time above to search for goalkeepers
          </p>
        )}
      </form>
    </div>
  );
}
