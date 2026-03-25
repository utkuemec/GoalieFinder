'use client';

import { useRouter } from 'next/navigation';
import Card from '@/components/ui/Card';
import Badge from '@/components/ui/Badge';
import StarRating from '@/components/ui/StarRating';
import { formatCurrency } from '@/lib/utils';
import { MapPin, Trophy, Navigation } from 'lucide-react';
import type { GoalkeeperProfile } from '@/types';

interface GoalkeeperCardProps {
  goalkeeper: GoalkeeperProfile;
  searchContext?: {
    cityId?: string;
    fieldName?: string;
    fieldAddress?: string;
    fieldLat?: number;
    fieldLng?: number;
    date?: string;
    time?: string;
    duration?: string;
    province?: string;
  };
}

export default function GoalkeeperCard({ goalkeeper, searchContext }: GoalkeeperCardProps) {
  const router = useRouter();

  const handleClick = () => {
    const params = new URLSearchParams();
    if (searchContext?.cityId) params.set('city', searchContext.cityId);
    if (searchContext?.fieldName) params.set('field', searchContext.fieldName);
    if (searchContext?.fieldAddress) params.set('address', searchContext.fieldAddress);
    if (searchContext?.fieldLat) params.set('lat', searchContext.fieldLat.toString());
    if (searchContext?.fieldLng) params.set('lng', searchContext.fieldLng.toString());
    if (searchContext?.date) params.set('date', searchContext.date);
    if (searchContext?.time) params.set('time', searchContext.time);
    if (searchContext?.duration) params.set('dur', searchContext.duration);
    if (searchContext?.province) params.set('prov', searchContext.province);
    const qs = params.toString();
    router.push(`/goalkeepers/${goalkeeper.id}${qs ? `?${qs}` : ''}`);
  };

  return (
    <Card hover className="flex flex-col cursor-pointer" onClick={handleClick}>
      <div className="flex items-start gap-4">
        <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-emerald-700 font-bold text-lg">
          {goalkeeper.fullName.charAt(0)}
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center justify-between">
            <h3 className="font-semibold text-slate-900 truncate">{goalkeeper.fullName}</h3>
            {goalkeeper.isAvailable && <Badge variant="success">Available</Badge>}
          </div>
          <StarRating rating={goalkeeper.rating} size={14} className="mt-1" />
        </div>
      </div>

      <div className="mt-4 space-y-2">
        {goalkeeper.bio && (
          <p className="text-sm text-slate-500 line-clamp-2">{goalkeeper.bio}</p>
        )}
        <div className="flex flex-wrap gap-3 text-sm text-slate-600">
          <div className="flex items-center gap-1">
            <Trophy size={14} className="text-amber-500" />
            <span>{goalkeeper.totalMatches} matches</span>
          </div>
          {goalkeeper.distanceKm !== undefined && goalkeeper.distanceKm !== null && (
            <div className="flex items-center gap-1">
              <Navigation size={14} className="text-blue-500" />
              <span>{goalkeeper.distanceKm} km</span>
            </div>
          )}
          <div className="flex items-center gap-1">
            <MapPin size={14} className="text-emerald-500" />
            <span>{goalkeeper.maxTravelDistanceKm}km range</span>
          </div>
        </div>
      </div>

      <div className="mt-4 pt-4 border-t border-slate-100 flex items-center justify-between">
        <div>
          <span className="text-lg font-bold text-emerald-600">{formatCurrency(goalkeeper.pricePerMatch)}</span>
          <span className="text-sm text-slate-500"> / match</span>
        </div>
        <span className="text-xs text-emerald-600 font-medium">View Profile &rarr;</span>
      </div>
    </Card>
  );
}
