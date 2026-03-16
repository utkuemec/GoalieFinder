import Link from 'next/link';
import Image from 'next/image';

export default function Footer() {
  return (
    <footer className="border-t border-slate-200 bg-slate-50">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 gap-8 md:grid-cols-4">
          <div className="col-span-1 md:col-span-2">
            <div className="mb-4">
              <Image src="/logo.png" alt="GoalieFinder" width={411} height={131} className="h-10 w-auto" />
            </div>
            <p className="text-sm text-slate-500 max-w-md">
              The fastest way to find a goalkeeper for your soccer game in Canada. 
              Connect with verified goalkeepers nearby and get playing in minutes.
            </p>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-slate-900 mb-3">Platform</h3>
            <ul className="space-y-2 text-sm text-slate-500">
              <li><Link href="/matches/new" className="hover:text-emerald-600">Find a Goalkeeper</Link></li>
              <li><Link href="/goalkeepers" className="hover:text-emerald-600">Browse Goalkeepers</Link></li>
              <li><Link href="/auth/register" className="hover:text-emerald-600">Join as Goalkeeper</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-slate-900 mb-3">Support</h3>
            <ul className="space-y-2 text-sm text-slate-500">
              <li><Link href="#" className="hover:text-emerald-600">Help Center</Link></li>
              <li><Link href="#" className="hover:text-emerald-600">Safety</Link></li>
              <li><Link href="#" className="hover:text-emerald-600">Terms of Service</Link></li>
              <li><Link href="#" className="hover:text-emerald-600">Privacy Policy</Link></li>
            </ul>
          </div>
        </div>
        <div className="mt-8 border-t border-slate-200 pt-8 text-center text-sm text-slate-500">
          &copy; {new Date().getFullYear()} GoalieFinder Canada. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
