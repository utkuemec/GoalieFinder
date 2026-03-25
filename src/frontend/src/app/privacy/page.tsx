export default function PrivacyPolicy() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-12 sm:px-6 lg:px-8">
      <h1 className="text-3xl font-bold text-slate-900 mb-2">
        Privacy Policy
      </h1>
      <p className="text-sm text-slate-500 mb-8">Last updated: March 2026</p>

      <div className="prose prose-slate max-w-none space-y-10">
        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            1. Information We Collect
          </h2>
          <p className="text-slate-600 mb-3">
            GoalieFinder collects the following information when you use our
            Service:
          </p>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              <span className="font-medium text-slate-800">
                Personal Information:
              </span>{" "}
              Name, email address, phone number, and city/location provided
              during account registration.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Payment Information:
              </span>{" "}
              Payment card details are collected and processed securely by
              Stripe. GoalieFinder does not store your full credit card number on
              our servers.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Bank Account &amp; Payout Information:
              </span>{" "}
              Goalkeepers who complete the &quot;Set Up Payouts&quot; process
              provide bank account details through Stripe Connect. This
              information is collected and processed entirely by Stripe —
              GoalieFinder does not store bank account numbers, routing numbers,
              or other sensitive financial details on our servers.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Profile Information:
              </span>{" "}
              Experience level, availability, hourly rate, and profile photo
              provided by Goalkeepers.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Booking Information:
              </span>{" "}
              Match date, time, location, booking status, and communication
              between parties related to bookings.
            </li>
            <li>
              <span className="font-medium text-slate-800">Usage Data:</span>{" "}
              Information about how you interact with the Service, including
              pages visited, searches performed, and booking activity.
            </li>
          </ul>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            2. How We Use Your Information
          </h2>
          <p className="text-slate-600 mb-3">
            We use the information we collect for the following purposes:
          </p>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              <span className="font-medium text-slate-800">
                Match-Making:
              </span>{" "}
              To connect Teams with available Goalkeepers based on location,
              availability, and preferences.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Booking Notifications:
              </span>{" "}
              To send booking requests, acceptance/decline notifications, match
              details, cancellation notices, and reminders via email.
            </li>
            <li>
              <span className="font-medium text-slate-800">Payments:</span> To
              process payment pre-authorizations, capture payments upon
              acceptance, issue refunds, and facilitate payouts to Goalkeepers
              through Stripe Connect.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Post-Acceptance Information Sharing:
              </span>{" "}
              When a Goalkeeper accepts a booking, we share match details and the
              booker&apos;s contact information (name, email, phone number) with
              the Goalkeeper so both parties can coordinate. This information is
              only shared after acceptance — it is never shared for pending or
              declined bookings.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Service Improvement:
              </span>{" "}
              To analyze usage patterns and improve the functionality, design,
              and performance of the Service.
            </li>
            <li>
              <span className="font-medium text-slate-800">Support:</span> To
              respond to your inquiries, resolve disputes, and process refunds.
            </li>
          </ul>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            3. Information Sharing
          </h2>
          <p className="text-slate-600 mb-3">
            We do not sell, rent, or trade your personal information to third
            parties. We share information only in the following circumstances:
          </p>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              <span className="font-medium text-slate-800">Stripe:</span>{" "}
              Payment information and bank account details (for Goalkeeper
              payouts) are shared with Stripe for payment processing,
              pre-authorization, capture, refunds, and payouts. Stripe acts as
              an independent data controller for the information it processes.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Between Booking Parties:
              </span>{" "}
              When a Goalkeeper accepts a booking, the Captain&apos;s contact
              information (name, email, phone number) and match details are
              shared with the Goalkeeper. The Goalkeeper&apos;s name and
              confirmation status are shared with the Captain. No personal
              contact information is shared until a booking is accepted.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Google Authentication:
              </span>{" "}
              If you sign in with Google, we receive your name and email address
              from Google. We do not share your data back with Google beyond what
              is necessary for authentication.
            </li>
            <li>
              <span className="font-medium text-slate-800">
                Legal Requirements:
              </span>{" "}
              We may disclose information if required by law, court order, or
              governmental regulation, or to protect the rights, property, or
              safety of GoalieFinder, our users, or the public.
            </li>
          </ul>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            4. Data Security
          </h2>
          <p className="text-slate-600">
            We take reasonable measures to protect your personal information from
            unauthorized access, alteration, disclosure, or destruction. These
            measures include encryption of data in transit using TLS/SSL, secure
            server infrastructure, and industry-standard hashing for password
            storage. Bank account and payment card details are processed and
            stored exclusively by Stripe in compliance with PCI-DSS standards —
            GoalieFinder never has access to or stores this sensitive financial
            data. While we strive to protect your information, no method of
            transmission over the internet or electronic storage is 100% secure,
            and we cannot guarantee absolute security.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            5. Cookies and Tracking
          </h2>
          <p className="text-slate-600">
            GoalieFinder uses JSON Web Tokens (JWT) for authentication, stored in
            localStorage on your device. We do not use third-party tracking
            cookies or advertising trackers. Essential technical data may be
            stored locally in your browser to maintain your session and
            preferences.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            6. Your Rights
          </h2>
          <p className="text-slate-600 mb-3">
            In accordance with Canada&apos;s Personal Information Protection and
            Electronic Documents Act (PIPEDA), you have the following rights
            regarding your personal information:
          </p>
          <ul className="list-disc pl-6 space-y-2 text-slate-600">
            <li>
              <span className="font-medium text-slate-800">Access:</span>{" "}
              Request a copy of the personal information we hold about you,
              including any data shared with Stripe for payout processing.
            </li>
            <li>
              <span className="font-medium text-slate-800">Correction:</span>{" "}
              Request correction of any inaccurate or incomplete information.
            </li>
            <li>
              <span className="font-medium text-slate-800">Deletion:</span>{" "}
              Request deletion of your account and associated personal
              information. Note that deleting your account will also disconnect
              your Stripe Connect payout account.
            </li>
            <li>
              <span className="font-medium text-slate-800">Withdrawal:</span>{" "}
              Withdraw consent for certain data processing activities, subject to
              legal and contractual limitations.
            </li>
          </ul>
          <p className="text-slate-600 mt-3">
            To exercise any of these rights, contact us at{" "}
            <a
              href="mailto:goaliefind@gmail.com"
              className="text-emerald-600 underline"
            >
              goaliefind@gmail.com
            </a>
            . We will respond to your request within 30 days as required by
            PIPEDA.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            7. Data Retention
          </h2>
          <p className="text-slate-600">
            We retain your personal information for as long as your account is
            active and as needed to provide you with the Service. If you delete
            your account, we will purge your personal information from our
            systems within 30 days, except where retention is required by law or
            for legitimate business purposes such as resolving disputes or
            enforcing our agreements. Booking records and payment transaction
            data may be retained for up to seven years as required by applicable
            tax and financial regulations.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            8. Children&apos;s Privacy
          </h2>
          <p className="text-slate-600">
            GoalieFinder is not intended for use by individuals under the age of
            18. We do not knowingly collect personal information from children
            under 18. If we become aware that we have collected personal
            information from a child under 18, we will take steps to delete that
            information promptly. If you believe a child under 18 has provided us
            with personal information, please contact us at{" "}
            <a
              href="mailto:goaliefind@gmail.com"
              className="text-emerald-600 underline"
            >
              goaliefind@gmail.com
            </a>
            .
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            9. Changes to This Privacy Policy
          </h2>
          <p className="text-slate-600">
            GoalieFinder may update this Privacy Policy from time to time.
            Changes will be posted on this page with an updated &quot;Last
            updated&quot; date. We encourage you to review this Privacy Policy
            periodically. Continued use of the Service after changes are posted
            constitutes acceptance of the revised Privacy Policy.
          </p>
        </section>

        <section>
          <h2 className="text-xl font-semibold text-slate-900 mb-3">
            10. Contact
          </h2>
          <p className="text-slate-600">
            If you have any questions or concerns about this Privacy Policy or
            our data practices, please contact us at{" "}
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
