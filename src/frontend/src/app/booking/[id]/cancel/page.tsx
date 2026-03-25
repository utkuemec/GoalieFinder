'use client';

import { useEffect, useState } from 'react';
import { useParams, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import axios from 'axios';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5001/api';

export default function CancelBookingPage() {
  const params = useParams();
  const searchParams = useSearchParams();
  const id = params.id as string;
  const token = searchParams.get('token') || '';

  const [status, setStatus] = useState<'confirm' | 'loading' | 'success' | 'error'>('confirm');
  const [message, setMessage] = useState('');

  const handleCancel = () => {
    if (!id || !token) {
      setStatus('error');
      setMessage('Invalid cancellation link.');
      return;
    }

    setStatus('loading');
    axios.put(`${API_BASE_URL}/bookings/${id}/captain-cancel?token=${token}`)
      .then((res) => {
        setStatus('success');
        setMessage(res.data.message || 'Booking cancelled. 50% has been refunded.');
      })
      .catch((err) => {
        setStatus('error');
        setMessage(err.response?.data?.error || 'Failed to cancel booking.');
      });
  };

  useEffect(() => {
    if (!id || !token) {
      setStatus('error');
      setMessage('Invalid cancellation link.');
    }
  }, [id, token]);

  return (
    <div className="min-h-screen flex items-center justify-center bg-slate-50 px-4">
      <div className="max-w-md w-full text-center">
        {status === 'confirm' && (
          <div className="bg-white rounded-2xl shadow-lg p-8 space-y-4">
            <div className="w-16 h-16 bg-amber-100 rounded-full flex items-center justify-center mx-auto">
              <svg className="w-8 h-8 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4.5c-.77-.833-2.694-.833-3.464 0L3.34 16.5c-.77.833.192 2.5 1.732 2.5z" /></svg>
            </div>
            <h1 className="text-2xl font-bold text-slate-900">Cancel Your Booking?</h1>
            <p className="text-slate-600">
              Are you sure you want to cancel this booking? You will receive a <strong>50% refund</strong> to your original payment method. This action cannot be undone.
            </p>
            <div className="flex gap-3 justify-center mt-4">
              <button
                onClick={handleCancel}
                className="bg-red-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-red-700 transition"
              >
                Yes, Cancel Booking
              </button>
              <Link href="/" className="bg-slate-200 text-slate-700 px-6 py-3 rounded-lg font-semibold hover:bg-slate-300 transition">
                Go Back
              </Link>
            </div>
          </div>
        )}
        {status === 'loading' && (
          <div className="space-y-4">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-red-600 mx-auto" />
            <p className="text-slate-600">Cancelling your booking...</p>
          </div>
        )}
        {status === 'success' && (
          <div className="bg-white rounded-2xl shadow-lg p-8 space-y-4">
            <div className="w-16 h-16 bg-emerald-100 rounded-full flex items-center justify-center mx-auto">
              <svg className="w-8 h-8 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" /></svg>
            </div>
            <h1 className="text-2xl font-bold text-slate-900">Booking Cancelled</h1>
            <p className="text-slate-600">{message}</p>
            <Link href="/matches/new" className="inline-block mt-4 bg-emerald-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-emerald-700 transition">
              Find Another Goalkeeper
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
