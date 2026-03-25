import { Star } from 'lucide-react';
import { cn } from '@/lib/utils';

interface StarRatingProps {
  rating: number;
  maxRating?: number;
  size?: number;
  showValue?: boolean;
  className?: string;
}

export default function StarRating({ rating, maxRating = 5, size = 16, showValue = true, className }: StarRatingProps) {
  return (
    <div className={cn('flex items-center gap-1', className)}>
      {Array.from({ length: maxRating }, (_, i) => (
        <Star
          key={i}
          size={size}
          className={cn(
            i < Math.floor(rating) ? 'fill-amber-400 text-amber-400' : 'text-slate-300',
            i === Math.floor(rating) && rating % 1 > 0 && 'fill-amber-400/50 text-amber-400'
          )}
        />
      ))}
      {showValue && <span className="ml-1 text-sm font-medium text-slate-600">{rating.toFixed(1)}</span>}
    </div>
  );
}
