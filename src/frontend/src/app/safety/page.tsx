export default function Safety() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-2">Safety</h1>
      <p className="text-sm text-slate-500 mb-8">Last updated: March 2026</p>

      <div className="prose prose-slate max-w-none space-y-10">
        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Identity Verification &amp; Payout Setup
          </h2>
          <p className="text-slate-600">
            Every goalkeeper on GoalieFinder must complete identity verification
            and the &quot;Set Up Payouts&quot; process before they appear in
            search results or can receive bookings. This includes email
            verification, a profile review by our team, and linking a valid bank
            account through Stripe Connect. Goalkeepers who have not completed
            all verification steps are not visible to teams. Verified goalkeepers
            display a verification badge on their profile so teams can book with
            confidence.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Two-Way Rating System
          </h2>
          <p className="text-slate-600">
            GoalieFinder uses a two-way rating system after every completed
            match. Both the team captain and the goalkeeper can rate each other on
            a 5-star scale and leave a written review. Ratings are visible on
            profiles and help the community identify reliable, respectful
            players. Users with consistently low ratings may be subject to
            account review or suspension.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Payment Protection
          </h2>
          <p className="text-slate-600">
            All payments are processed securely through Stripe. When a team books
            a goalkeeper, the total amount (goalkeeper&apos;s rate + 10% service
            fee + applicable provincial taxes) is pre-authorized on the
            team&apos;s payment method. The payment is only captured when the
            goalkeeper accepts the booking. After the match, the money is held by
            the platform until the team captain confirms attendance and match
            completion. If the captain does not confirm within 24 hours of the
            scheduled match end time, the match is automatically confirmed and
            payment is released to the goalkeeper&apos;s bank account. This
            protects both parties — teams only pay for accepted and completed
            matches, and goalkeepers are guaranteed payment for their time.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Cancellation Policy
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>
              GoalieFinder has a clear cancellation policy to protect all
              parties:
            </p>
            <ul className="list-disc pl-6 space-y-2">
              <li>
                <span className="font-medium text-slate-800">
                  Goalkeeper Declines:
                </span>{" "}
                If a goalkeeper declines a booking request, the captain receives
                a full refund and an email notification encouraging them to find
                another goalkeeper.
              </li>
              <li>
                <span className="font-medium text-slate-800">
                  Captain Cancels Before Response:
                </span>{" "}
                If the captain cancels before the goalkeeper has responded, the
                pre-authorization is released and the captain receives a full
                refund.
              </li>
              <li>
                <span className="font-medium text-slate-800">
                  Captain Cancels After Acceptance:
                </span>{" "}
                Once a goalkeeper has accepted, the captain has a one-time option
                to cancel. If exercised, only 50% of the total payment is
                refunded. The remaining 50% compensates the goalkeeper for their
                committed time.
              </li>
            </ul>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            No-Show Policy
          </h2>
          <p className="text-slate-600">
            We take no-shows seriously. If a goalkeeper accepts a booking and
            fails to show up without advance notice, the team receives a full
            refund and the goalkeeper&apos;s account is flagged. Repeated
            no-shows result in account suspension or permanent removal from the
            platform. If a team fails to show up, the goalkeeper still receives
            payment for the booked time. We encourage all users to communicate
            promptly if plans change.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Duplicate Booking Prevention
          </h2>
          <p className="text-slate-600">
            When a goalkeeper accepts a booking, they are automatically hidden
            from search results for the accepted date and time slot. This
            prevents double-bookings and ensures that teams only see goalkeepers
            who are genuinely available. Once the match is completed or
            cancelled, the goalkeeper&apos;s availability is restored for that
            time slot.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Reporting Issues
          </h2>
          <p className="text-slate-600">
            If you experience inappropriate behaviour, harassment, or any safety
            concern during a match or interaction on GoalieFinder, please report
            it by emailing{" "}
            <a
              href="mailto:goaliefind@gmail.com"
              className="text-emerald-600 underline"
            >
              goaliefind@gmail.com
            </a>{" "}
            with the details of the incident. Include the booking reference, the
            other party&apos;s name, and a description of what happened. Our team
            reviews all reports within 48 hours and takes appropriate action,
            which may include warnings, suspensions, or permanent bans.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            Community Guidelines
          </h2>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              <span className="font-medium text-slate-800">Respect:</span>{" "}
              Treat all players, captains, and opponents with courtesy and
              sportsmanship. Discrimination, harassment, or abusive language will
              not be tolerated.
            </li>
            <li>
              <span className="font-medium text-slate-800">Punctuality:</span>{" "}
              Arrive on time for your match. If you&apos;re running late,
              communicate with the other party as soon as possible.
            </li>
            <li>
              <span className="font-medium text-slate-800">Fair Play:</span>{" "}
              Play honestly and within the rules. GoalieFinder is built on trust
              — maintain accurate profiles, honour your bookings, and provide
              honest ratings.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Communication:
              </span>{" "}
              Keep all booking-related communication on the platform when
              possible. Respond to booking requests and messages in a timely
              manner.
            </li>
          </ul>
        </section>

        <div className="rounded-lg bg-slate-50 border border-slate-200 p-6 text-center">
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Have a safety concern?
          </h3>
          <p className="text-slate-600 mb-4">
            Contact us immediately and we&apos;ll investigate.
          </p>
          <a
            href="mailto:goaliefind@gmail.com"
            className="inline-block rounded-lg bg-emerald-600 px-6 py-2.5 text-sm font-semibold text-white hover:bg-emerald-700 transition-colors"
          >
            Report a Concern
          </a>
        </div>
      </div>
    </div>
  );
}
