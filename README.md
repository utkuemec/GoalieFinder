# GoalieFinder Toronto

A two-sided sports marketplace that connects soccer teams needing a goalkeeper with available goalkeepers in the Toronto area.

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        CLIENTS                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────┐   │
│  │  Web (Next.js)│  │ Mobile (RN)  │  │ Admin Dashboard      │   │
│  │  Vercel       │  │ Future       │  │ Next.js              │   │
│  └──────┬───────┘  └──────┬───────┘  └──────────┬───────────┘   │
└─────────┼─────────────────┼─────────────────────┼───────────────┘
          │                 │                     │
          ▼                 ▼                     ▼
┌─────────────────────────────────────────────────────────────────┐
│                    API GATEWAY / LOAD BALANCER                    │
│                    (AWS ALB / API Gateway)                        │
└─────────────────────────────┬───────────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                    .NET 8 WEB API (Clean Architecture)           │
│  ┌────────────┐ ┌────────────┐ ┌──────────┐ ┌──────────────┐   │
│  │    Auth     │ │  Matches   │ │ Payments │ │Notifications │   │
│  │  (JWT+Ref)  │ │  (CRUD+Geo)│ │ (Stripe) │ │(FCM+SendGrid)│  │
│  └────────────┘ └────────────┘ └──────────┘ └──────────────┘   │
│  ┌────────────┐ ┌────────────┐ ┌──────────┐                    │
│  │  Profiles  │ │  Reviews   │ │  Admin   │                    │
│  └────────────┘ └────────────┘ └──────────┘                    │
└─────────────────────────────┬───────────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                    DATA LAYER                                    │
│  ┌────────────────┐  ┌────────────┐  ┌───────────────────┐     │
│  │  PostgreSQL     │  │   Redis    │  │    AWS S3          │     │
│  │  + PostGIS      │  │   Cache    │  │  (Profile Photos)  │     │
│  └────────────────┘  └────────────┘  └───────────────────┘     │
└─────────────────────────────────────────────────────────────────┘
```

## Tech Stack

| Layer          | Technology                          |
|----------------|-------------------------------------|
| Frontend       | Next.js 14, TypeScript, Tailwind CSS, React Query |
| Backend        | .NET 8 Web API, C#, Clean Architecture |
| Database       | PostgreSQL 16 + PostGIS             |
| Cache          | Redis                               |
| Auth           | JWT + Refresh Tokens                |
| Payments       | Stripe Connect                      |
| Maps           | Google Maps API                     |
| Notifications  | Firebase Cloud Messaging, SendGrid  |
| Storage        | AWS S3                              |
| Hosting        | Vercel (Frontend), AWS ECS (Backend)|
| CI/CD          | GitHub Actions                      |
| Containers     | Docker + Docker Compose             |

## Project Structure

```
GoalieFinder/
├── src/
│   ├── backend/                    # .NET 8 Solution
│   │   ├── GoalieFinder.Domain/        # Entities, Value Objects, Enums
│   │   ├── GoalieFinder.Application/   # Use Cases, DTOs, Interfaces
│   │   ├── GoalieFinder.Infrastructure/# EF Core, Services, Repositories
│   │   └── GoalieFinder.API/           # Controllers, Middleware, Config
│   └── frontend/                   # Next.js 14 App
│       ├── app/                        # App Router pages
│       ├── components/                 # Reusable UI components
│       ├── lib/                        # Utilities, API client
│       └── public/                     # Static assets
├── database/
│   └── migrations/                 # SQL migration scripts
├── docker/                         # Docker configuration
├── docs/                           # Documentation
│   ├── api.md                      # API Documentation
│   ├── database-schema.md          # Database Schema
│   └── deployment.md               # Deployment Guide
└── .github/
    └── workflows/                  # CI/CD pipelines
```

## User Roles

| Role             | Permissions                                              |
|------------------|----------------------------------------------------------|
| Team Captain     | Post matches, browse goalkeepers, pay, rate              |
| Goalkeeper       | Set profile/availability/price, accept matches, get paid |
| Admin            | Manage users, matches, payments, disputes, analytics     |

## Quick Start

```bash
# Start all services
docker compose up -d

# Backend: http://localhost:5000
# Frontend: http://localhost:3000
# PostgreSQL: localhost:5432
# Redis: localhost:6379
```

## Business Model

- Teams post matches with a goalkeeper payment amount
- Platform charges a **10% service fee** on top of the captain's payment
- Goalkeepers receive the full match payment
- Stripe Connect handles split payments

## Core Flows

1. **Team Posts Match** → Nearby goalkeepers notified → Goalkeeper accepts → Payment pre-authorized
2. **Match Completed** → Captain confirms → Payment released → Both sides rate each other
3. **No-Show** → Penalty applied → Dispute resolution available

## License

Proprietary - All rights reserved.
