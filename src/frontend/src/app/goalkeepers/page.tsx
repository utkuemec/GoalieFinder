'use client';

import { useState, useEffect } from 'react';
import GoalkeeperCard from '@/components/goalkeepers/GoalkeeperCard';
import { goalkeepersApi } from '@/lib/api';
import { Search, Loader2, Users } from 'lucide-react';
import type { GoalkeeperProfile } from '@/types';

export default function GoalkeepersPage() {
  const [search, setSearch] = useState('');
  const [goalkeepers, setGoalkeepers] = useState<GoalkeeperProfile[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchGoalkeepers = async () => {
      try {
        const data = await goalkeepersApi.getAll();
        setGoalkeepers(data.items);
      } catch {
        console.error('Failed to fetch goalkeepers');
      } finally {
        setLoading(false);
      }
    };
    fetchGoalkeepers();
  }, []);

  const filtered = goalkeepers.filter((gk) =>
    gk.fullName.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
        <div>
          <h1 className="text-3xl font-bold text-slate-900">Browse Goalkeepers</h1>
          <p className="mt-1 text-slate-500">
            {loading ? 'Loading...' : `${filtered.length} goalkeeper${filtered.length !== 1 ? 's' : ''} across Canada`}
          </p>
        </div>
        <div className="relative w-full sm:w-72">
          <Search size={18} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
          <input
            type="text"
            placeholder="Search by name..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full rounded-lg border border-slate-300 pl-10 pr-4 py-2.5 text-sm text-slate-900 placeholder:text-slate-400 focus:border-emerald-500 focus:outline-none focus:ring-2 focus:ring-emerald-500/20"
          />
        </div>
      </div>

      {loading ? (
        <div className="flex items-center justify-center py-16">
          <Loader2 size={32} className="animate-spin text-emerald-600" />
        </div>
      ) : filtered.length > 0 ? (
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {filtered.map((gk) => (
            <GoalkeeperCard key={gk.id} goalkeeper={gk} />
          ))}
        </div>
      ) : (
        <div className="text-center py-16">
          <Users size={40} className="text-slate-300 mx-auto mb-4" />
          <p className="text-slate-500">
            {search ? 'No goalkeepers found matching your search.' : 'No goalkeepers registered yet. Be the first!'}
          </p>
        </div>
      )}
    </div>
  );
}
