'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';

export default function GoalkeepersPage() {
  const router = useRouter();

  useEffect(() => {
    router.replace('/matches/new');
  }, [router]);

  return null;
}
