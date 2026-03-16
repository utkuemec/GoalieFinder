'use client';

import { useState, useEffect } from 'react';
import Card from '@/components/ui/Card';
import Badge from '@/components/ui/Badge';
import Button from '@/components/ui/Button';
import { useAuth } from '@/lib/auth-context';
import { bookingsApi, type BookingListItem } from '@/lib/api';
import { formatCurrency, formatDateTime } from '@/lib/utils';
import { DollarSign, Trophy, Star, MapPin, Bell, Loader2, CheckCircle, XCircle, Clock, Phone } from 'lucide-react';

export default function GoalkeeperDashboard() {
  const { user } = useAuth();
  const [bookings, setBookings] = useState<BookingListItem[]>([]);
  const [loadingBookings, setLoadingBookings] = useState(true);
  const [actionLoading, setActionLoading] = useState<string | null>(null);

  useEffect(() => {
    const fetch = async () => {
      try {
        const data = await bookingsApi.myRequests();
        setBookings(data);
      } catch {
        console.error('Failed to fetch bookings');
      } finally {
        setLoadingBookings(false);
      }
    };
    fetch();
  }, []);

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

  const pendingBookings = bookings.filter((b) => b.status === 'Open');
  const confirmedBookings = bookings.filter((b) => b.status === 'Accepted');
  

  const totalEarnings = confirmedBookings.reduce((sum, b) => sum + b.paymentAmount, 0);

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
          { icon: Trophy, label: 'Confirmed', value: confirmedBookings.length.toString(), color: 'text-blue-600 bg-blue-100' },
          { icon: Bell, label: 'Pending', value: pendingBookings.length.toString(), color: 'text-amber-600 bg-amber-100' },
          { icon: Star, label: 'Total Bookings', value: bookings.length.toString(), color: 'text-purple-600 bg-purple-100' },
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
                <p className="mt-3 text-lg font-bold text-emerald-600">{formatCurrency(booking.paymentAmount)}</p>
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
