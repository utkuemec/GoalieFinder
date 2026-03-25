'use client';

import { useEffect, useState } from 'react';
import { useParams, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import axios from 'axios';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5001/api';

export default function ConfirmBookingPage() {
  const params = useParams();
  const searchParams = useSearchParams();
  const id = params.id as string;
  const token = searchParams.get('token') || '';

  const [status, setStatus] = useState<'loading' | 'success' | 'error'>('loading');
  const [message, setMessage] = useState('');

  useEffect(() => {
    if (!id || !token) {
      setStatus('error');
      setMessage('Invalid confirmation link.');
      return;
    }

    axios.put(`${API_BASE_URL}/bookings/${id}/confirm?token=${token}`)
      .then((res) => {
        setStatus('success');
        setMessage(res.data.message || 'Match confirmed! Payment released to goalkeeper.');
      })
      .catch((err) => {
        setStatus('error');
        setMessage(err.response?.data?.error || 'Failed to confirm match.');
      });
  }, [id, token]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-50 px-4">
      <div className="max-w-md w-full text-center">
        {status === 'loading' && (
          <div className="space-y-4">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-emerald-600 mx-auto" />
            <p className="text-slate-600">Confirming your match...</p>
          </div>
        )}
        {status === 'success' && (
          <div className="bg-white rounded-2xl shadow-lg p-8 space-y-4">
            <div className="w-16 h-16 bg-emerald-100 rounded-full flex items-center justify-center mx-auto">
              <svg className="w-8 h-8 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" /></svg>
            </div>
            <h1 className="text-2xl font-bold text-slate-900">Match Confirmed!</h1>
            <p className="text-slate-600">{message}</p>
            <Link href="/" className="inline-block mt-4 bg-emerald-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-emerald-700 transition">
              Back to GoalieFinder
            </Link>
          </div>
        )}
        {status === 'error' && (
          <div className="bg-white rounded-2xl shadow-lg p-8 space-y-4">
            <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto">
              <svg className="w-8 h-8 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" /></svg>
            </div>
            <h1 className="text-2xl font-bold text-slate-900">Something Went Wrong</h1>
            <p className="text-slate-600">{message}</p>
            <Link href="/" className="inline-block mt-4 bg-emerald-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-emerald-700 transition">
              Back to GoalieFinder
            </Link>
          </div>
        )}
      </div>
    </div>
  );
}
