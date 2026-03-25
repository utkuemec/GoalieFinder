export default function HelpCenter() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-2">Help Center</h1>
      <p className="text-slate-600 mb-10">
        Find answers to common questions about using GoalieFinder.
      </p>

      <div className="prose prose-slate max-w-none">
        <h2 className="text-2xl font-semibold text-slate-900 mb-6">
          For Teams
        </h2>

        <div className="space-y-4 mb-12">
          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I find a goalkeeper?
            </summary>
            <p className="mt-3 text-slate-600">
              Browse available goalkeepers by selecting your city, match date,
              and time. You&apos;ll see a list of goalkeepers with their
              ratings, experience level, and hourly rate. Select a goalkeeper
              that fits your needs and send a booking request — no account
              required.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How does booking work?
            </summary>
            <p className="mt-3 text-slate-600">
              Once you find a goalkeeper, submit a booking request with your
              match details (location, date, time, and duration). The
              goalkeeper will receive a notification and can accept or decline.
              Your payment is pre-authorized but not charged until the
              goalkeeper accepts. You&apos;ll receive a confirmation email once
              the booking is confirmed.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How does payment work?
            </summary>
            <p className="mt-3 text-slate-600">
              We use Stripe for secure payment processing. When you book a
              goalkeeper, your card is pre-authorized for the total amount
              (goalkeeper&apos;s rate plus a 10% service fee and applicable
              provincial taxes). The charge is only captured once the
              goalkeeper accepts and the match is confirmed. Funds are held
              securely until the match is completed.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              What is the cancellation policy?
            </summary>
            <p className="mt-3 text-slate-600">
              If a goalkeeper declines your booking request, you receive a full
              refund automatically. If you need to cancel after a goalkeeper
              has accepted, you can raise a dispute and our team will review
              the situation. We recommend cancelling as early as possible to
              give goalkeepers time to find other matches.
            </p>
          </details>
        </div>

        <h2 className="text-2xl font-semibold text-slate-900 mb-6">
          For Goalkeepers
        </h2>

        <div className="space-y-4 mb-12">
          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I sign up as a goalkeeper?
            </summary>
            <p className="mt-3 text-slate-600">
              Create an account on GoalieFinder by providing your name, email,
              phone number, and city. You&apos;ll verify your email address,
              set up your profile with your experience level and availability,
              and connect your Stripe account to receive payments. Once your
              profile is reviewed, you&apos;ll appear in search results for
              teams in your area.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I set my price?
            </summary>
            <p className="mt-3 text-slate-600">
              You set your own hourly rate on your profile. This is the amount
              you&apos;ll receive per hour of play. Teams will see your rate
              when browsing goalkeepers. You can update your rate at any time
              from your dashboard — changes apply to future bookings only.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I accept bookings?
            </summary>
            <p className="mt-3 text-slate-600">
              When a team sends you a booking request, you&apos;ll receive an
              email and dashboard notification with the match details. You can
              accept or decline from your dashboard. Once you accept, the
              booking is confirmed and the team is charged. Make sure to only
              accept bookings you can commit to.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I get paid?
            </summary>
            <p className="mt-3 text-slate-600">
              Payments are processed through Stripe Connect. After a match is
              completed, the team captain confirms attendance and the payment
              is released to your Stripe account. If the captain doesn&apos;t
              confirm within 24 hours, funds are automatically released.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              When do Stripe payouts arrive?
            </summary>
            <p className="mt-3 text-slate-600">
              Once funds are released to your Stripe Connect account, Stripe
              typically processes payouts to your bank account within 2–7
              business days, depending on your country and bank. You can track
              payout status directly in your Stripe dashboard.
            </p>
          </details>
        </div>

        <h2 className="text-2xl font-semibold text-slate-900 mb-6">
          General
        </h2>

        <div className="space-y-4 mb-12">
          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              What cities does GoalieFinder cover?
            </summary>
            <p className="mt-3 text-slate-600">
              GoalieFinder is available in 20+ cities across Canada, including
              Toronto, Vancouver, Montreal, Calgary, Edmonton, Ottawa,
              Winnipeg, Hamilton, Kitchener, London, Halifax, Victoria,
              Saskatoon, Regina, St. John&apos;s, Mississauga, Brampton,
              Surrey, Markham, and more. We&apos;re expanding to new cities
              regularly.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do ratings work?
            </summary>
            <p className="mt-3 text-slate-600">
              After each match, both the team captain and the goalkeeper can
              rate each other on a 5-star scale. Ratings are averaged across
              all completed matches and displayed on profiles. This
              two-way rating system helps maintain quality and trust across the
              platform.
            </p>
          </details>

          <details className="group rounded-lg border border-slate-200 p-4">
            <summary className="cursor-pointer font-medium text-slate-900">
              How do I contact support?
            </summary>
            <p className="mt-3 text-slate-600">
              For any questions, issues, or feedback, email us at{" "}
              <a
                href="mailto:goaliefind@gmail.com"
                className="text-emerald-600 underline"
              >
                goaliefind@gmail.com
              </a>
              . We aim to respond within 24 hours on business days.
            </p>
          </details>
        </div>

        <div className="rounded-lg bg-slate-50 border border-slate-200 p-6 text-center">
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Still have questions?
          </h3>
          <p className="text-slate-600 mb-4">
            Our support team is here to help.
          </p>
          <a
            href="mailto:goaliefind@gmail.com"
            className="inline-block rounded-lg bg-emerald-600 px-6 py-2.5 text-sm font-semibold text-white hover:bg-emerald-700 transition-colors"
          >
            Contact Us
          </a>
        </div>
      </div>
    </div>
  );
}
