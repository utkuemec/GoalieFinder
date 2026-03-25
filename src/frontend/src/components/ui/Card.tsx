import { type HTMLAttributes } from 'react';
import { cn } from '@/lib/utils';

interface CardProps extends HTMLAttributes<HTMLDivElement> {
  hover?: boolean;
}

export default function Card({ className, hover = false, children, ...props }: CardProps) {
  return (
    <div
      className={cn(
        'rounded-xl border border-slate-200 bg-white p-6 shadow-sm',
        hover && 'transition-all duration-200 hover:shadow-md hover:border-slate-300 cursor-pointer',
        className
      )}
      {...props}
    >
      {children}
    </div>
  );
}
