'use client';

import Card from '@/components/ui/Card';
import Badge from '@/components/ui/Badge';
import Button from '@/components/ui/Button';
import StarRating from '@/components/ui/StarRating';
import { formatCurrency, formatDateTime } from '@/lib/utils';
import { MapPin, Clock, DollarSign, Navigation } from 'lucide-react';
import type { Match } from '@/types';

interface MatchCardProps {
  match: Match;
  onAccept?: (matchId: string) => void;
  showAcceptButton?: boolean;
  isAccepting?: boolean;
}

export default function MatchCard({ match, onAccept, showAcceptButton = false, isAccepting = false }: MatchCardProps) {
  const statusVariant = {
    Open: 'success' as const,
    Accepted: 'info' as const,
    InProgress: 'warning' as const,
    Completed: 'default' as const,
    Cancelled: 'danger' as const,
    Disputed: 'danger' as const,
  };

  return (
    <Card hover className="flex flex-col">
      <div className="flex items-start justify-between mb-4">
        <div>
          <h3 className="font-semibold text-slate-900">{match.teamName}</h3>
          <StarRating rating={match.teamRating} size={14} className="mt-1" />
        </div>
        <Badge variant={statusVariant[match.status]}>{match.status}</Badge>
      </div>

      <div className="space-y-3 flex-1">
        <div className="flex items-start gap-2 text-sm text-slate-600">
          <MapPin size={16} className="text-emerald-600 mt-0.5 shrink-0" />
          <div>
            <p className="font-medium text-slate-900">{match.fieldName}</p>
            <p>{match.fieldAddress}</p>
          </div>
        </div>
        <div className="flex items-center gap-2 text-sm text-slate-600">
          <Clock size={16} className="text-emerald-600 shrink-0" />
          <span>{formatDateTime(match.matchDateTime)}</span>
        </div>
        <div className="flex items-center gap-2 text-sm text-slate-600">
          <Clock size={16} className="text-slate-400 shrink-0" />
          <span>{match.durationMinutes} minutes</span>
        </div>
        {match.distanceKm !== undefined && match.distanceKm !== null && (
          <div className="flex items-center gap-2 text-sm text-slate-600">
            <Navigation size={16} className="text-blue-500 shrink-0" />
            <span>{match.distanceKm} km away</span>
          </div>
        )}
      </div>

      <div className="mt-4 pt-4 border-t border-slate-100 flex items-center justify-between">
        <div className="flex items-center gap-1">
          <DollarSign size={18} className="text-emerald-600" />
          <span className="text-lg font-bold text-slate-900">{formatCurrency(match.paymentAmount)}</span>
        </div>
        {showAcceptButton && match.status === 'Open' && (
          <Button size="sm" onClick={() => onAccept?.(match.id)} isLoading={isAccepting}>
            Accept Match
          </Button>
        )}
      </div>

      {match.notes && (
        <p className="mt-3 text-xs text-slate-500 italic">&ldquo;{match.notes}&rdquo;</p>
      )}
    </Card>
  );
}
