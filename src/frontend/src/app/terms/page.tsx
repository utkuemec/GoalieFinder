export default function TermsOfService() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-2">
        Terms of Service
      </h1>
      <p className="text-sm text-slate-500 mb-8">Last updated: March 2026</p>

      <div className="prose prose-slate max-w-none space-y-10">
        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            1. Acceptance of Terms
          </h2>
          <p className="text-slate-600">
            By accessing or using the GoalieFinder website at{" "}
            <a
              href="https://goaliefinders.com"
              className="text-emerald-600 underline"
            >
              goaliefinders.com
            </a>{" "}
            (&quot;Service&quot;), you agree to be bound by these Terms of
            Service (&quot;Terms&quot;). If you do not agree to these Terms, do
            not use the Service. GoalieFinder reserves the right to refuse
            service to anyone at any time for any reason.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            2. Description of Service
          </h2>
          <p className="text-slate-600">
            GoalieFinder is an online marketplace that connects soccer teams
            (&quot;Teams&quot; or &quot;Captains&quot;) with independent
            freelance goalkeepers (&quot;Goalkeepers&quot;) across Canada. The
            Service allows Teams to search for, book, and pay Goalkeepers for
            soccer matches. GoalieFinder facilitates the connection between
            parties but does not employ Goalkeepers, manage matches, or control
            the quality of services provided by Goalkeepers.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            3. User Accounts
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>
              Goalkeepers must create an account to offer their services on the
              platform. Account registration requires a valid name, email
              address, and phone number. Goalkeepers are responsible for
              maintaining the confidentiality of their account credentials and
              for all activities conducted under their account.
            </p>
            <p>
              Before a Goalkeeper can appear in search results or receive booking
              requests, they must complete the &quot;Set Up Payouts&quot; process
              by linking a valid bank account through Stripe Connect. Goalkeepers
              who have not completed payout setup will not be visible to Teams
              and cannot receive bookings.
            </p>
            <p>
              Teams are not required to create an account to browse and book
              Goalkeepers. GoalieFinder reserves the right to suspend or
              terminate accounts that violate these Terms.
            </p>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            4. Booking and Payments
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>
              All payments are processed through Stripe, a third-party payment
              processor. By using the Service, you agree to Stripe&apos;s{" "}
              <a
                href="https://stripe.com/legal"
                className="text-emerald-600 underline"
              >
                Terms of Service
              </a>
              .
            </p>
            <p>
              Goalkeepers set their own price for each match. A 10% platform
              service fee is charged to the booking party (Team/Captain) on top
              of the Goalkeeper&apos;s rate. Applicable provincial taxes
              (HST/GST/PST) are calculated and applied based on the location of
              the match.
            </p>
            <p>
              When a Team submits a booking request, the total amount (including
              the Goalkeeper&apos;s rate, the 10% service fee, and applicable
              taxes) is pre-authorized on the Team&apos;s payment method via
              Stripe. The Goalkeeper receives an email notification and can view
              the request in their dashboard, where they may Accept or Decline.
            </p>
            <p>
              If the Goalkeeper accepts the booking, the pre-authorized payment
              is captured. Match details and the booker&apos;s contact
              information are shared with the Goalkeeper via email. The
              Goalkeeper is automatically hidden from search results for the
              accepted date and time slot to prevent duplicate bookings.
            </p>
            <p>
              After the match, the Team captain confirms the Goalkeeper&apos;s
              attendance and match completion. Upon confirmation, payment is
              released to the Goalkeeper&apos;s linked bank account via Stripe
              Connect. If the captain does not confirm within 24 hours of the
              scheduled match end time, the match is automatically confirmed and
              payment is released to the Goalkeeper.
            </p>
            <p>
              Goalkeepers must have completed the &quot;Set Up Payouts&quot;
              process (linked bank account) before they can receive bookings or
              appear in search results.
            </p>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            5. Cancellation and Refunds
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>
              <span className="font-medium text-slate-800">
                Goalkeeper Declines:
              </span>{" "}
              If a Goalkeeper declines a booking request, the pre-authorization
              is released and the Team receives a full refund. The Team is
              notified by email that the request was declined and encouraged to
              find another Goalkeeper.
            </p>
            <p>
              <span className="font-medium text-slate-800">
                Captain Cancels Before Goalkeeper Responds:
              </span>{" "}
              If the Team captain cancels a booking request before the Goalkeeper
              has accepted or declined, the pre-authorization is released and the
              Team receives a full refund.
            </p>
            <p>
              <span className="font-medium text-slate-800">
                Captain Cancels After Goalkeeper Accepts:
              </span>{" "}
              Once a Goalkeeper has accepted a booking, the Team captain has a
              one-time option to cancel. If the captain exercises this option,
              only 50% of the total payment is refunded. The remaining 50% is
              retained as compensation for the Goalkeeper&apos;s committed time.
              This cancellation option may only be used once per booking.
            </p>
            <p>
              <span className="font-medium text-slate-800">
                Goalkeeper No-Show:
              </span>{" "}
              If a Goalkeeper accepts a booking and fails to show up without
              advance notice, the Team receives a full refund. The
              Goalkeeper&apos;s account will be flagged and may be subject to
              suspension or termination. Repeated no-shows result in permanent
              removal from the platform.
            </p>
            <p>
              GoalieFinder reserves the right to issue refunds at its sole
              discretion in cases of misconduct or other exceptional
              circumstances.
            </p>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            6. Goalkeeper Obligations
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>By registering as a Goalkeeper on GoalieFinder, you agree to:</p>
            <ul className="list-disc pl-6 space-y-2">
              <li>
                Complete the &quot;Set Up Payouts&quot; process by linking a
                valid bank account through Stripe Connect before accepting any
                bookings.
              </li>
              <li>
                Respond to booking requests promptly. Failing to respond may
                result in reduced visibility on the platform.
              </li>
              <li>
                Show up on time for all accepted bookings. Communicate with the
                Team captain as soon as possible if any changes arise.
              </li>
              <li>
                Maintain accurate and up-to-date profile information, including
                availability, experience level, location, and hourly rate.
              </li>
              <li>
                Conduct yourself professionally and in accordance with the
                community guidelines and User Conduct rules described in these
                Terms.
              </li>
            </ul>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            7. User Conduct
          </h2>
          <p className="text-slate-600 mb-3">
            All users of GoalieFinder agree to:
          </p>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              Treat all other users with respect and sportsmanship. Harassment,
              discrimination, threats, or abusive behaviour of any kind is
              strictly prohibited.
            </li>
            <li>
              Arrive at matches on time as scheduled. Repeated tardiness or
              no-shows may result in account penalties or termination.
            </li>
            <li>
              Maintain accurate and truthful profile information, including
              experience level, availability, and location.
            </li>
            <li>
              Not use the Service for any unlawful purpose or in violation of any
              applicable local, provincial, or federal law.
            </li>
            <li>
              Not attempt to circumvent the platform&apos;s payment system or
              arrange off-platform payments for bookings made through
              GoalieFinder.
            </li>
          </ul>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            8. Limitation of Liability
          </h2>
          <div className="space-y-3 text-slate-600">
            <p>
              GoalieFinder operates as a marketplace platform that facilitates
              connections between Teams and Goalkeepers. GoalieFinder is not a
              party to any agreement between Teams and Goalkeepers and does not
              supervise, direct, or control the conduct of any user.
            </p>
            <p>
              GoalieFinder is not liable for any injuries, damages, or losses
              that occur during or as a result of soccer matches arranged through
              the Service. All users participate in matches at their own risk and
              are responsible for their own safety, health, and insurance
              coverage.
            </p>
            <p>
              To the maximum extent permitted by applicable law, GoalieFinder
              shall not be liable for any indirect, incidental, special,
              consequential, or punitive damages arising out of or related to the
              use of the Service.
            </p>
          </div>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            9. Intellectual Property
          </h2>
          <p className="text-slate-600">
            All content, branding, logos, trademarks, and materials on the
            GoalieFinder website and platform are the property of GoalieFinder
            and are protected by applicable intellectual property laws. Users may
            not copy, reproduce, distribute, or create derivative works from any
            GoalieFinder content without prior written consent. User-generated
            content (such as reviews and profile information) remains the
            property of the user, but by submitting it to the platform, users
            grant GoalieFinder a non-exclusive, royalty-free licence to display
            and use such content in connection with the Service.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            10. Privacy
          </h2>
          <p className="text-slate-600">
            Your use of the Service is also governed by our{" "}
            <a href="/privacy" className="text-emerald-600 underline">
              Privacy Policy
            </a>
            , which describes how we collect, use, and protect your personal
            information. By using the Service, you consent to the collection and
            use of your information as described in the Privacy Policy.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            11. Modifications to Terms
          </h2>
          <p className="text-slate-600">
            GoalieFinder reserves the right to modify these Terms at any time.
            Changes will be posted on this page with an updated &quot;Last
            updated&quot; date. Continued use of the Service after changes are
            posted constitutes acceptance of the revised Terms. We encourage
            users to review these Terms periodically.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            12. Governing Law
          </h2>
          <p className="text-slate-600">
            These Terms shall be governed by and construed in accordance with the
            laws of the Province of Ontario, Canada, without regard to its
            conflict of law provisions. Any disputes arising from or relating to
            these Terms or the Service shall be subject to the exclusive
            jurisdiction of the courts located in the Province of Ontario,
            Canada.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            13. Contact Information
          </h2>
          <p className="text-slate-600">
            If you have any questions about these Terms of Service, please
            contact us at{" "}
            <a
              href="mailto:goaliefind@gmail.com"
              className="text-emerald-600 underline"
            >
              goaliefind@gmail.com
            </a>
            .
          </p>
        </section>
      </div>
    </div>
  );
}
