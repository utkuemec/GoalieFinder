# GoalieFinder Toronto — AWS Infrastructure

This directory contains everything needed to deploy GoalieFinder to AWS.

## Prerequisites

Install these on your Mac:

```bash
# AWS CLI
brew install awscli

# Terraform
brew install terraform

# PostgreSQL client (for DB migrations)
brew install postgresql
```

## Quick Start (3 Steps)

### Step 1: Configure AWS Credentials

```bash
aws configure
# Enter your AWS Access Key ID
# Enter your AWS Secret Access Key
# Region: ca-central-1
# Output format: json
```

### Step 2: Create Terraform State Bucket

This is a one-time setup to store Terraform state remotely:

```bash
aws s3 mb s3://goaliefinder-terraform-state --region ca-central-1
```

### Step 3: Deploy Everything

```bash
cd infrastructure/terraform

# Copy and edit the variables file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars — set your db_password and jwt_secret

# Initialize Terraform
terraform init

# Preview what will be created
terraform plan

# Deploy (creates all AWS resources — takes ~10 minutes)
terraform apply
```

That's it. Terraform creates:
- VPC with public/private subnets
- ECR repository for Docker images
- RDS PostgreSQL 16 with PostGIS
- ElastiCache Redis
- S3 bucket for uploads
- ECS Fargate cluster with ALB
- IAM roles and security groups
- Secrets Manager for credentials
- CI/CD deploy user with access keys

## After Terraform Completes

### Get the outputs:

```bash
terraform output
```

This shows your:
- API URL (ALB DNS)
- ECR repository URL
- RDS endpoint
- Redis endpoint
- S3 bucket name
- CI/CD deploy credentials (sensitive — use `terraform output -raw deploy_access_key_id`)

### Initialize the database:

```bash
cd ../scripts
./init-db.sh <rds-endpoint> <db-password>
```

### Push the first Docker image:

```bash
cd ../scripts
./deploy.sh
```

### Set up GitHub Secrets:

In your GitHub repo, go to Settings > Secrets > Actions and add:

| Secret | Value (from Terraform output) |
|--------|-------------------------------|
| `AWS_ACCESS_KEY_ID` | `terraform output -raw deploy_access_key_id` |
| `AWS_SECRET_ACCESS_KEY` | `terraform output -raw deploy_secret_access_key` |

### Set up Vercel (Frontend):

```bash
cd ../../src/frontend
npx vercel --prod
```

Set the environment variable in Vercel dashboard:
```
NEXT_PUBLIC_API_URL=http://<alb-dns-name>/api
```

## Adding a Domain (Optional)

1. Buy a domain (Route 53, Namecheap, GoDaddy, etc.)
2. Edit `terraform.tfvars` and set `domain_name = "goaliefinders.com"`
3. Run `terraform apply`
4. Point your domain's nameservers to the Route 53 nameservers shown in the output
5. Wait for DNS propagation (~15 minutes)
6. Update Vercel's `NEXT_PUBLIC_API_URL` to `https://api.goaliefinders.com/api`

## Cost Estimate

| Service | Monthly Cost |
|---------|-------------|
| RDS db.t3.micro | $0 (Free Tier) or ~$15 |
| ECS Fargate (0.5 vCPU, 1 GB) | ~$15 |
| ElastiCache cache.t3.micro | ~$12 |
| ALB | ~$16 |
| NAT Gateway | ~$32 |
| S3, ECR, Route 53 | ~$3 |
| **Total** | **~$45-93/mo** |

## Destroy Everything

```bash
cd infrastructure/terraform
terraform destroy
```

## File Structure

```
infrastructure/
├── terraform/
│   ├── provider.tf          # AWS provider + backend config
│   ├── variables.tf         # Input variables
│   ├── terraform.tfvars.example  # Template for your values
│   ├── networking.tf        # VPC, subnets, NAT gateway
│   ├── security.tf          # Security groups
│   ├── iam.tf               # IAM roles + deploy user
│   ├── ecr.tf               # Docker image registry
│   ├── rds.tf               # PostgreSQL database
│   ├── redis.tf             # ElastiCache Redis
│   ├── s3.tf                # File uploads bucket
│   ├── ecs.tf               # ECS cluster, task, service, ALB
│   ├── secrets.tf           # Secrets Manager
│   ├── dns.tf               # Route 53 + SSL (optional)
│   └── outputs.tf           # Output values
└── scripts/
    ├── deploy.sh            # Full deploy script
    └── init-db.sh           # Database migration script
```
