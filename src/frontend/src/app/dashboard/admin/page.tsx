'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { adminApi } from '@/lib/api';
import { DollarSign, Users, Trophy, Clock, CheckCircle, XCircle, AlertTriangle, ChevronDown } from 'lucide-react';

interface Stats {
  totalUsers: number;
  totalGoalkeepers: number;
  bookings: { total: number; active: number; completed: number; cancelled: number; pending: number };
  revenue: { total: number; platformFees: number; goalkeeperPayouts: number };
}

interface Booking {
  id: string;
  status: number;
  statusText: string;
  fieldName: string;
  fieldAddress: string;
  matchDateTime: string;
  durationMinutes: number;
  captain: { name: string; email: string; phone: string };
  goalkeeper: { id: string; name: string; email: string; phone: string; city: string | null; pricePerMatch: number } | null;
  payment: { id: string; statusText: string; amount: number; platformFee: number; taxAmount: number; stripeFee: number; goalkeeperPayout: number; stripePaymentIntentId: string; stripeTransferId: string | null; completedAt: string | null } | null;
  paymentAmount: number;
  platformFee: number;
  taxRate: number;
  taxAmount: number;
  stripeFee: number;
  totalAmount: number;
  notes: string | null;
  createdAt: string;
  updatedAt: string;
}

const statusColors: Record<string, string> = {
  Open: 'bg-blue-100 text-blue-700',
  Accepted: 'bg-emerald-100 text-emerald-700',
  Completed: 'bg-green-100 text-green-800',
  Cancelled: 'bg-red-100 text-red-700',
  InProgress: 'bg-yellow-100 text-yellow-700',
  Disputed: 'bg-orange-100 text-orange-700',
};

export default function AdminDashboard() {
  const router = useRouter();
  const [stats, setStats] = useState<Stats | null>(null);
  const [bookings, setBookings] = useState<Booking[]>([]);
  const [totalBookings, setTotalBookings] = useState(0);
  const [statusFilter, setStatusFilter] = useState('');
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [expandedId, setExpandedId] = useState<string | null>(null);

  useEffect(() => {
    const user = localStorage.getItem('user');
    if (user) {
      const parsed = JSON.parse(user);
      if (parsed.role !== 'Admin') {
        router.push('/');
        return;
      }
    } else {
      router.push('/auth/login');
      return;
    }

    const fetchData = async () => {
      setLoading(true);
      try {
        const [statsData, bookingsData] = await Promise.all([
          adminApi.getStats(),
          adminApi.getBookings({ status: statusFilter || undefined, page, pageSize: 25 }),
        ]);
        setStats(statsData);
        setBookings(bookingsData.bookings);
        setTotalBookings(bookingsData.total);
      } catch (err: unknown) {
        const e = err as { response?: { status?: number } };
        if (e.response?.status === 403 || e.response?.status === 401) {
          setError('You do not have admin access.');
        } else {
          setError('Failed to load data.');
        }
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [statusFilter, page, router]);

  const fmt = (n: number) => `$${n.toFixed(2)}`;
  const fmtDate = (d: string) => new Date(d).toLocaleString('en-CA', { dateStyle: 'medium', timeStyle: 'short' });

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-emerald-600" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="max-w-2xl mx-auto p-8 text-center">
        <AlertTriangle size={48} className="mx-auto text-red-500 mb-4" />
        <h1 className="text-2xl font-bold text-slate-900 mb-2">Access Denied</h1>
        <p className="text-slate-600">{error}</p>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-8">Admin Dashboard</h1>

      {stats && (
        <>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
            <StatCard icon={<Users size={20} />} label="Total Users" value={stats.totalUsers} color="bg-blue-50 text-blue-600" />
            <StatCard icon={<Trophy size={20} />} label="Goalkeepers" value={stats.totalGoalkeepers} color="bg-emerald-50 text-emerald-600" />
            <StatCard icon={<DollarSign size={20} />} label="Total Revenue" value={fmt(stats.revenue.total)} color="bg-green-50 text-green-600" />
            <StatCard icon={<DollarSign size={20} />} label="Platform Fees" value={fmt(stats.revenue.platformFees)} color="bg-purple-50 text-purple-600" />
          </div>
          <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
            <StatCard icon={<Clock size={20} />} label="Pending" value={stats.bookings.pending} color="bg-blue-50 text-blue-600" />
            <StatCard icon={<CheckCircle size={20} />} label="Accepted" value={stats.bookings.active} color="bg-emerald-50 text-emerald-600" />
            <StatCard icon={<CheckCircle size={20} />} label="Completed" value={stats.bookings.completed} color="bg-green-50 text-green-700" />
            <StatCard icon={<XCircle size={20} />} label="Cancelled" value={stats.bookings.cancelled} color="bg-red-50 text-red-600" />
            <StatCard icon={<Trophy size={20} />} label="Total Bookings" value={stats.bookings.total} color="bg-slate-100 text-slate-700" />
          </div>
        </>
      )}

      <div className="flex items-center justify-between mb-4">
        <h2 className="text-xl font-bold text-slate-900">All Bookings</h2>
        <select
          value={statusFilter}
          onChange={(e) => { setStatusFilter(e.target.value); setPage(1); }}
          className="border border-slate-300 rounded-lg px-3 py-2 text-sm"
        >
          <option value="">All Statuses</option>
          <option value="Open">Open</option>
          <option value="Accepted">Accepted</option>
          <option value="Completed">Completed</option>
          <option value="Cancelled">Cancelled</option>
        </select>
      </div>

      <div className="bg-white border border-slate-200 rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-slate-50 text-left text-slate-600">
                <th className="px-4 py-3 font-semibold">Date</th>
                <th className="px-4 py-3 font-semibold">Captain</th>
                <th className="px-4 py-3 font-semibold">Goalkeeper</th>
                <th className="px-4 py-3 font-semibold">Field</th>
                <th className="px-4 py-3 font-semibold">Amount</th>
                <th className="px-4 py-3 font-semibold">Status</th>
                <th className="px-4 py-3 font-semibold">Payment</th>
                <th className="px-4 py-3 font-semibold w-10"></th>
              </tr>
            </thead>
            <tbody>
              {bookings.map((b) => (
                <>
                  <tr key={b.id} className="border-t border-slate-100 hover:bg-slate-50 cursor-pointer" onClick={() => setExpandedId(expandedId === b.id ? null : b.id)}>
                    <td className="px-4 py-3 whitespace-nowrap">{fmtDate(b.matchDateTime)}</td>
                    <td className="px-4 py-3">
                      <div className="font-medium">{b.captain.name}</div>
                      <div className="text-slate-400 text-xs">{b.captain.email}</div>
                    </td>
                    <td className="px-4 py-3">
                      {b.goalkeeper ? (
                        <div>
                          <div className="font-medium">{b.goalkeeper.name}</div>
                          <div className="text-slate-400 text-xs">{b.goalkeeper.city || '—'}</div>
                        </div>
                      ) : <span className="text-slate-400">—</span>}
                    </td>
                    <td className="px-4 py-3 max-w-[200px] truncate">{b.fieldName}</td>
                    <td className="px-4 py-3 font-semibold">{fmt(b.totalAmount)}</td>
                    <td className="px-4 py-3">
                      <span className={`px-2 py-1 rounded-full text-xs font-semibold ${statusColors[b.statusText] || 'bg-slate-100 text-slate-700'}`}>
                        {b.statusText}
                      </span>
                    </td>
                    <td className="px-4 py-3">
                      {b.payment ? (
                        <span className="text-xs text-slate-500">{b.payment.statusText}</span>
                      ) : <span className="text-slate-400">—</span>}
                    </td>
                    <td className="px-4 py-3">
                      <ChevronDown size={16} className={`text-slate-400 transition-transform ${expandedId === b.id ? 'rotate-180' : ''}`} />
                    </td>
                  </tr>
                  {expandedId === b.id && (
                    <tr key={`${b.id}-detail`} className="bg-slate-50/70">
                      <td colSpan={8} className="px-6 py-4">
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 text-sm">
                          <div>
                            <h4 className="font-semibold text-slate-700 mb-2">Captain Details</h4>
                            <p><span className="text-slate-500">Name:</span> {b.captain.name}</p>
                            <p><span className="text-slate-500">Email:</span> {b.captain.email}</p>
                            <p><span className="text-slate-500">Phone:</span> {b.captain.phone}</p>
                          </div>
                          <div>
                            <h4 className="font-semibold text-slate-700 mb-2">Goalkeeper Details</h4>
                            {b.goalkeeper ? (
                              <>
                                <p><span className="text-slate-500">Name:</span> {b.goalkeeper.name}</p>
                                <p><span className="text-slate-500">Email:</span> {b.goalkeeper.email}</p>
                                <p><span className="text-slate-500">Phone:</span> {b.goalkeeper.phone}</p>
                                <p><span className="text-slate-500">City:</span> {b.goalkeeper.city || '—'}</p>
                                <p><span className="text-slate-500">Rate:</span> {fmt(b.goalkeeper.pricePerMatch)}/match</p>
                              </>
                            ) : <p className="text-slate-400">No goalkeeper assigned</p>}
                          </div>
                          <div>
                            <h4 className="font-semibold text-slate-700 mb-2">Payment Breakdown</h4>
                            <p><span className="text-slate-500">Goalkeeper Fee:</span> {fmt(b.paymentAmount)}</p>
                            <p><span className="text-slate-500">Platform Fee (10%):</span> {fmt(b.platformFee)}</p>
                            <p><span className="text-slate-500">Tax ({(b.taxRate * 100).toFixed(2)}%):</span> {fmt(b.taxAmount)}</p>
                            <p><span className="text-slate-500">Processing Fee:</span> {fmt(b.stripeFee)}</p>
                            <p className="font-semibold mt-1"><span className="text-slate-500">Total Charged:</span> {fmt(b.totalAmount)}</p>
                            {b.payment && (
                              <>
                                <p className="mt-2"><span className="text-slate-500">GK Payout:</span> {fmt(b.payment.goalkeeperPayout)}</p>
                                <p><span className="text-slate-500">Stripe PI:</span> <span className="font-mono text-xs">{b.payment.stripePaymentIntentId}</span></p>
                                {b.payment.stripeTransferId && <p><span className="text-slate-500">Transfer:</span> <span className="font-mono text-xs">{b.payment.stripeTransferId}</span></p>}
                              </>
                            )}
                          </div>
                        </div>
                        <div className="mt-4">
                          <h4 className="font-semibold text-slate-700 mb-1">Match Details</h4>
                          <p className="text-sm"><span className="text-slate-500">Field:</span> {b.fieldName} — {b.fieldAddress}</p>
                          <p className="text-sm"><span className="text-slate-500">Duration:</span> {b.durationMinutes} min</p>
                          <p className="text-sm"><span className="text-slate-500">Created:</span> {fmtDate(b.createdAt)}</p>
                          {b.notes && <p className="text-sm mt-1"><span className="text-slate-500">Notes:</span> {b.notes}</p>}
                        </div>
                      </td>
                    </tr>
                  )}
                </>
              ))}
              {bookings.length === 0 && (
                <tr>
                  <td colSpan={8} className="px-4 py-12 text-center text-slate-400">No bookings found</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>

      {totalBookings > 25 && (
        <div className="flex justify-center gap-2 mt-4">
          <button disabled={page <= 1} onClick={() => setPage(page - 1)} className="px-4 py-2 rounded-lg bg-slate-100 text-slate-700 disabled:opacity-50 hover:bg-slate-200">Previous</button>
          <span className="px-4 py-2 text-slate-600">Page {page} of {Math.ceil(totalBookings / 25)}</span>
          <button disabled={page >= Math.ceil(totalBookings / 25)} onClick={() => setPage(page + 1)} className="px-4 py-2 rounded-lg bg-slate-100 text-slate-700 disabled:opacity-50 hover:bg-slate-200">Next</button>
        </div>
      )}
    </div>
  );
}

function StatCard({ icon, label, value, color }: { icon: React.ReactNode; label: string; value: string | number; color: string }) {
  return (
    <div className={`rounded-xl p-4 ${color}`}>
      <div className="flex items-center gap-2 mb-1">{icon}<span className="text-xs font-medium opacity-80">{label}</span></div>
      <div className="text-2xl font-bold">{value}</div>
    </div>
  );
}
