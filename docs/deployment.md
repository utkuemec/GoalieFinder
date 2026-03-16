# GoalieFinder Toronto — Deployment Guide

## Prerequisites

- Docker & Docker Compose
- .NET 8 SDK
- Node.js 20+
- PostgreSQL 16+
- AWS CLI (for production)
- Vercel CLI (for frontend)

---

## Local Development

### 1. Start Infrastructure

```bash
docker compose up -d postgres redis
```

### 2. Run Backend

```bash
cd src/backend
dotnet restore
dotnet run --project GoalieFinder.API
# API available at http://localhost:5000
# Swagger UI at http://localhost:5000/swagger
```

### 3. Run Frontend

```bash
cd src/frontend
npm install
npm run dev
# Available at http://localhost:3000
```

---

## Docker (Full Stack)

```bash
docker compose up -d --build
```

Services:
- Frontend: http://localhost:3000
- API: http://localhost:5000
- PostgreSQL: localhost:5432
- Redis: localhost:6379

---

## Production Deployment

### AWS Infrastructure

#### Required AWS Services:
- **ECS (Fargate)** — Backend API containers
- **RDS (PostgreSQL 16)** — Database with PostGIS
- **ElastiCache (Redis)** — Session/cache store
- **ECR** — Docker image registry
- **ALB** — Application Load Balancer
- **S3** — Profile photos & static assets
- **CloudFront** — CDN
- **Route 53** — DNS management
- **ACM** — SSL certificates
- **Secrets Manager** — API keys & credentials

#### Region: `ca-central-1` (Canada)

### Backend Deployment (AWS ECS)

1. Create ECR repository:
```bash
aws ecr create-repository --repository-name goaliefinder-api --region ca-central-1
```

2. Build and push:
```bash
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.ca-central-1.amazonaws.com
docker build -t goaliefinder-api ./src/backend
docker tag goaliefinder-api:latest <account-id>.dkr.ecr.ca-central-1.amazonaws.com/goaliefinder-api:latest
docker push <account-id>.dkr.ecr.ca-central-1.amazonaws.com/goaliefinder-api:latest
```

3. Create ECS cluster, task definition, and service via AWS Console or Terraform.

### Frontend Deployment (Vercel)

1. Install Vercel CLI:
```bash
npm i -g vercel
```

2. Deploy:
```bash
cd src/frontend
vercel --prod
```

3. Set environment variables in Vercel dashboard:
```
NEXT_PUBLIC_API_URL=https://api.goaliefinders.com/api
NEXT_PUBLIC_GOOGLE_MAPS_KEY=<your-key>
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=<your-key>
```

### Database Setup (AWS RDS)

1. Create RDS PostgreSQL 16 instance with PostGIS
2. Run migration:
```bash
psql -h <rds-endpoint> -U postgres -d goaliefinder -f database/migrations/init.sql
```

---

## Environment Variables

### Backend (.NET API)

| Variable | Description | Example |
|----------|-------------|---------|
| ConnectionStrings__DefaultConnection | PostgreSQL connection | Host=...;Database=goaliefinder;... |
| Jwt__Secret | JWT signing key | Random 64+ char string |
| Jwt__Issuer | JWT issuer | GoalieFinder |
| Jwt__Audience | JWT audience | GoalieFinder |
| Stripe__SecretKey | Stripe API secret key | sk_live_... |
| Stripe__WebhookSecret | Stripe webhook signing | whsec_... |
| AWS__S3__BucketName | S3 bucket for photos | goaliefinder-uploads |
| SendGrid__ApiKey | SendGrid API key | SG.xxx |
| Firebase__ProjectId | Firebase project ID | goaliefinder-xxx |

### Frontend (Next.js)

| Variable | Description | Example |
|----------|-------------|---------|
| NEXT_PUBLIC_API_URL | Backend API URL | https://api.goaliefinders.com/api |
| NEXT_PUBLIC_GOOGLE_MAPS_KEY | Google Maps API key | AIza... |
| NEXT_PUBLIC_STRIPE_PUBLIC_KEY | Stripe publishable key | pk_live_... |

---

## Monitoring & Observability

- **Logging**: Structured logging with Serilog → CloudWatch Logs
- **Metrics**: CloudWatch Container Insights
- **APM**: AWS X-Ray for distributed tracing
- **Alerts**: CloudWatch Alarms for error rates, latency, CPU
- **Uptime**: AWS Route 53 health checks

---

## Scaling Strategy

### Phase 1: Toronto (Current)
- Single ECS service, 2 tasks
- RDS db.t3.medium
- ElastiCache cache.t3.micro

### Phase 2: Canada
- Multi-AZ RDS
- ECS auto-scaling (2-10 tasks)
- CloudFront CDN
- Read replicas

### Phase 3: North America
- Multi-region deployment
- Global Accelerator
- DynamoDB for session store
- Microservices split (Auth, Matches, Payments, Notifications)

---

## Security Checklist

- [x] HTTPS everywhere (ACM + ALB)
- [x] JWT with short-lived access tokens (2h)
- [x] Refresh token rotation
- [x] Rate limiting per IP and per user
- [x] Input validation (FluentValidation)
- [x] SQL injection prevention (EF Core parameterized)
- [x] CORS whitelist
- [x] Secrets in AWS Secrets Manager
- [x] Password hashing (BCrypt)
- [x] RBAC authorization
