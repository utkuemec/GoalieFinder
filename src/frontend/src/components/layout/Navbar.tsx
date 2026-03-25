'use client';

import Link from 'next/link';
import Image from 'next/image';
import { useAuth } from '@/lib/auth-context';
import Button from '@/components/ui/Button';
import { Menu, X, User, LogOut, Shield, Settings } from 'lucide-react';
import { useState } from 'react';

export default function Navbar() {
  const { user, isAuthenticated, logout } = useAuth();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <nav className="sticky top-0 z-50 border-b border-slate-200 bg-white/80 backdrop-blur-lg">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex h-16 items-center justify-between">
          <div className="flex items-center gap-8">
            <Link href="/" className="flex items-center gap-2">
              <Image src="/logo.png" alt="GoalieFinder" width={411} height={131} className="h-14 w-auto" priority />
            </Link>
            <div className="hidden md:flex items-center gap-6">
              <Link href="/goalkeepers" className="text-sm font-medium text-slate-600 hover:text-emerald-600 transition-colors">
                Browse Goalkeepers
              </Link>
            </div>
          </div>

          <div className="hidden md:flex items-center gap-3">
            <Link href="/matches/new">
              <Button size="sm">Find a Goalkeeper</Button>
            </Link>

            {isAuthenticated ? (
              <div className="flex items-center gap-2 pl-3 border-l border-slate-200">
                <Link href="/dashboard/goalkeeper">
                  <Button variant="ghost" size="sm">
                    <Shield size={16} className="mr-1" />
                    Dashboard
                  </Button>
                </Link>
                <div className="flex items-center gap-2 pl-2">
                  <div className="flex h-8 w-8 items-center justify-center rounded-full bg-emerald-100">
                    <User size={16} className="text-emerald-700" />
                  </div>
                  <span className="text-sm font-medium text-slate-700">{user?.firstName}</span>
                  <Link href="/dashboard/goalkeeper/settings" className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors">
                    <Settings size={16} className="text-slate-500" />
                  </Link>
                  <button onClick={logout} className="p-1.5 rounded-lg hover:bg-slate-100 transition-colors">
                    <LogOut size={16} className="text-slate-500" />
                  </button>
                </div>
              </div>
            ) : (
              <div className="flex items-center gap-2 pl-3 border-l border-slate-200">
                <Link href="/auth/login">
                  <Button variant="ghost" size="sm">Goalkeeper Login</Button>
                </Link>
                <Link href="/auth/register">
                  <Button variant="outline" size="sm">Join as Goalkeeper</Button>
                </Link>
              </div>
            )}
          </div>

          <button
            className="md:hidden p-2 rounded-lg hover:bg-slate-100"
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          >
            {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
          </button>
        </div>

        {mobileMenuOpen && (
          <div className="md:hidden border-t border-slate-200 py-4 space-y-3">
            <Link
              href="/matches/new"
              className="block px-3 py-2 text-sm font-medium text-emerald-600 bg-emerald-50 hover:bg-emerald-100 rounded-lg"
              onClick={() => setMobileMenuOpen(false)}
            >
              Find a Goalkeeper
            </Link>
            <Link
              href="/goalkeepers"
              className="block px-3 py-2 text-sm font-medium text-slate-600 hover:bg-slate-50 rounded-lg"
              onClick={() => setMobileMenuOpen(false)}
            >
              Browse Goalkeepers
            </Link>
            {isAuthenticated ? (
              <>
                <Link
                  href="/dashboard/goalkeeper"
                  className="block px-3 py-2 text-sm font-medium text-slate-600 hover:bg-slate-50 rounded-lg"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  Goalkeeper Dashboard
                </Link>
                <button
                  onClick={() => { logout(); setMobileMenuOpen(false); }}
                  className="block w-full text-left px-3 py-2 text-sm font-medium text-red-600 hover:bg-red-50 rounded-lg"
                >
                  Log Out
                </button>
              </>
            ) : (
              <div className="flex gap-2 px-3 pt-2 border-t border-slate-200 mt-2">
                <Link href="/auth/login" className="flex-1" onClick={() => setMobileMenuOpen(false)}>
                  <Button variant="outline" size="sm" className="w-full">Goalkeeper Login</Button>
                </Link>
                <Link href="/auth/register" className="flex-1" onClick={() => setMobileMenuOpen(false)}>
                  <Button size="sm" className="w-full">Join as GK</Button>
                </Link>
              </div>
            )}
          </div>
        )}
      </div>
    </nav>
  );
}
