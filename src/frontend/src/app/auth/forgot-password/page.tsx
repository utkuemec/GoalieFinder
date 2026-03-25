'use client';

import { useState, useRef, useEffect, type KeyboardEvent, type ClipboardEvent } from 'react';
import Link from 'next/link';
import Button from '@/components/ui/Button';
import Input from '@/components/ui/Input';
import Card from '@/components/ui/Card';
import api from '@/lib/api';
import { Mail, ArrowLeft, CheckCircle, Lock, ChevronRight } from 'lucide-react';
import { cn } from '@/lib/utils';

type Step = 'email' | 'verify' | 'reset' | 'done';

export default function ForgotPasswordPage() {
  const [step, setStep] = useState<Step>('email');
  const [email, setEmail] = useState('');
  const [verificationCode, setVerificationCode] = useState(['', '', '', '', '', '']);
  const [devCode, setDevCode] = useState<string | null>(null);
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [resendTimer, setResendTimer] = useState(0);
  const codeInputRefs = useRef<(HTMLInputElement | null)[]>([]);

  useEffect(() => {
    if (resendTimer <= 0) return;
    const interval = setInterval(() => setResendTimer((t) => t - 1), 1000);
    return () => clearInterval(interval);
  }, [resendTimer]);

  const handleSendCode = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      const res = await api.post('/verification/send', { email });
      if (res.data.code) setDevCode(res.data.code);
      setResendTimer(60);
      setStep('verify');
    } catch {
      setError('Failed to send verification code. Check your email.');
    } finally {
      setLoading(false);
    }
  };

  const handleCodeChange = (index: number, value: string) => {
    if (!/^\d*$/.test(value)) return;
    const newCode = [...verificationCode];
    newCode[index] = value.slice(-1);
    setVerificationCode(newCode);
    if (value && index < 5) codeInputRefs.current[index + 1]?.focus();
  };

  const handleCodeKeyDown = (index: number, e: KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Backspace' && !verificationCode[index] && index > 0)
      codeInputRefs.current[index - 1]?.focus();
  };

  const handleCodePaste = (e: ClipboardEvent<HTMLInputElement>) => {
    e.preventDefault();
    const pasted = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, 6);
    if (pasted.length === 6) {
      setVerificationCode(pasted.split(''));
      codeInputRefs.current[5]?.focus();
    }
  };

  const handleVerify = async (e: React.FormEvent) => {
    e.preventDefault();
    const code = verificationCode.join('');
    if (code.length !== 6) { setError('Enter the full 6-digit code'); return; }
    setError('');
    setLoading(true);
    try {
      const res = await api.post('/verification/verify', { email, code });
      if (res.data.verified) setStep('reset');
      else setError('Invalid code');
    } catch {
      setError('Invalid or expired code');
    } finally {
      setLoading(false);
    }
  };

  const handleResend = async () => {
    if (resendTimer > 0) return;
    setLoading(true);
    try {
      const res = await api.post('/verification/send', { email });
      if (res.data.code) setDevCode(res.data.code);
      setResendTimer(60);
    } catch {
      setError('Failed to resend');
    } finally {
      setLoading(false);
    }
  };

  const handleResetPassword = async (e: React.FormEvent) => {
    e.preventDefault();
    if (newPassword !== confirmPassword) { setError('Passwords do not match'); return; }
    if (newPassword.length < 8) { setError('Password must be at least 8 characters'); return; }
    setError('');
    setLoading(true);
    try {
      await api.post('/auth/reset-password', { email, newPassword, verificationCode: verificationCode.join('') });
      setStep('done');
    } catch (err: unknown) {
      const e = err as { response?: { data?: { error?: string } } };
      setError(e.response?.data?.error || 'Failed to reset password');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-[80vh] flex items-center justify-center px-4 py-12">
      <div className="w-full max-w-md">

        {/* Step 1: Enter email */}
        {step === 'email' && (
          <Card>
            <Link href="/auth/login" className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
              <ArrowLeft size={16} /> Back to login
            </Link>
            <div className="text-center mb-8">
              <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-blue-100 text-blue-600 mx-auto mb-4">
                <Mail size={28} />
              </div>
              <h1 className="text-2xl font-bold text-slate-900">Forgot Password</h1>
              <p className="mt-2 text-sm text-slate-500">Enter your email and we&apos;ll send you a verification code</p>
            </div>
            <form onSubmit={handleSendCode} className="space-y-4">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <Input id="email" label="Email" type="email" placeholder="you@example.com" value={email} onChange={(e) => setEmail(e.target.value)} required />
              <Button type="submit" className="w-full" isLoading={loading}>
                Send Code <ChevronRight size={18} className="ml-1" />
              </Button>
            </form>
          </Card>
        )}

        {/* Step 2: Verify code */}
        {step === 'verify' && (
          <Card>
            <button onClick={() => setStep('email')} className="flex items-center gap-1 text-sm text-slate-500 hover:text-emerald-600 mb-6">
              <ArrowLeft size={16} /> Back
            </button>
            <div className="text-center mb-8">
              <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-blue-100 text-blue-600 mx-auto mb-4">
                <Mail size={28} />
              </div>
              <h1 className="text-2xl font-bold text-slate-900">Check Your Email</h1>
              <p className="mt-2 text-sm text-slate-500">
                We sent a code to <span className="font-medium text-slate-700">{email}</span>
              </p>
            </div>

            {devCode && (
              <div className="mb-4 p-3 rounded-lg bg-amber-50 border border-amber-200 text-center">
                <p className="text-xs text-amber-600 font-medium mb-1">Dev Mode — Your code:</p>
                <p className="text-2xl font-bold text-amber-800 tracking-widest">{devCode}</p>
              </div>
            )}

            <form onSubmit={handleVerify} className="space-y-6">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <div className="flex justify-center gap-3">
                {verificationCode.map((digit, i) => (
                  <input
                    key={i}
                    ref={(el) => { codeInputRefs.current[i] = el; }}
                    type="text" inputMode="numeric" maxLength={1} value={digit}
                    onChange={(e) => handleCodeChange(i, e.target.value)}
                    onKeyDown={(e) => handleCodeKeyDown(i, e)}
                    onPaste={i === 0 ? handleCodePaste : undefined}
                    className={cn(
                      'h-14 w-12 rounded-lg border-2 text-center text-xl font-bold transition-all focus:outline-none',
                      digit ? 'border-emerald-500 bg-emerald-50 text-emerald-700' : 'border-slate-300 focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/20'
                    )}
                  />
                ))}
              </div>
              <Button type="submit" className="w-full" isLoading={loading}>Verify Code</Button>
              <div className="text-center">
                {resendTimer > 0 ? (
                  <p className="text-sm text-slate-400">Resend in <span className="font-medium text-slate-600">{resendTimer}s</span></p>
                ) : (
                  <button type="button" onClick={handleResend} className="text-sm font-medium text-emerald-600 hover:text-emerald-700">Resend code</button>
                )}
              </div>
            </form>
          </Card>
        )}

        {/* Step 3: New password */}
        {step === 'reset' && (
          <Card>
            <div className="text-center mb-8">
              <div className="inline-flex h-14 w-14 items-center justify-center rounded-xl bg-emerald-100 text-emerald-600 mx-auto mb-4">
                <Lock size={28} />
              </div>
              <h1 className="text-2xl font-bold text-slate-900">Set New Password</h1>
              <p className="mt-2 text-sm text-slate-500">Choose a strong password for your account</p>
            </div>
            <form onSubmit={handleResetPassword} className="space-y-4">
              {error && <div className="rounded-lg bg-red-50 border border-red-200 p-3 text-sm text-red-700">{error}</div>}
              <Input id="newPassword" label="New Password" type="password" placeholder="Min. 8 characters" value={newPassword} onChange={(e) => setNewPassword(e.target.value)} required minLength={8} />
              <Input id="confirmPassword" label="Confirm Password" type="password" placeholder="Enter again" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} required />
              <Button type="submit" className="w-full" isLoading={loading}>Reset Password</Button>
            </form>
          </Card>
        )}

        {/* Step 4: Done */}
        {step === 'done' && (
          <Card className="text-center">
            <div className="inline-flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100 text-emerald-600 mx-auto mb-6">
              <CheckCircle size={36} />
            </div>
            <h1 className="text-2xl font-bold text-slate-900 mb-2">Password Reset!</h1>
            <p className="text-slate-500 mb-8">Your password has been changed. You can now sign in with your new password.</p>
            <Link href="/auth/login">
              <Button className="w-full">Sign In</Button>
            </Link>
          </Card>
        )}
      </div>
    </div>
  );
}
