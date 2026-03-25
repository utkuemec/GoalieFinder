'use client';

import Link from 'next/link';
import Card from '@/components/ui/Card';
import Button from '@/components/ui/Button';
import { Plus } from 'lucide-react';

export default function TeamDashboard() {
  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Welcome</h1>
          <p className="text-slate-500">Find a goalkeeper for your next game</p>
        </div>
        <Link href="/matches/new">
          <Button><Plus size={18} className="mr-1" /> Find a Goalkeeper</Button>
        </Link>
      </div>

      <Card className="text-center py-12">
        <p className="text-slate-500 mb-4">Use the &quot;Find a Goalkeeper&quot; button to search for available keepers near your field.</p>
        <Link href="/matches/new">
          <Button>Find a Goalkeeper</Button>
        </Link>
      </Card>
    </div>
  );
}
