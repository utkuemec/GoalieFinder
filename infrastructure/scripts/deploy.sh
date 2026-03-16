#!/bin/bash
set -euo pipefail

# GoalieFinder Toronto — Deploy Script
# Usage: ./deploy.sh

echo "========================================="
echo "  GoalieFinder Toronto — AWS Deployment"
echo "========================================="

# Check prerequisites
command -v aws >/dev/null 2>&1 || { echo "ERROR: aws CLI not installed. Run: brew install awscli"; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "ERROR: docker not installed."; exit 1; }
command -v terraform >/dev/null 2>&1 || { echo "ERROR: terraform not installed. Run: brew install terraform"; exit 1; }

REGION="ca-central-1"
PROJECT="goaliefinder"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
TF_DIR="$SCRIPT_DIR/../terraform"

echo ""
echo "[1/5] Checking AWS credentials..."
aws sts get-caller-identity --region $REGION || { echo "ERROR: AWS credentials not configured. Run: aws configure"; exit 1; }
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
ECR_REPO="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$PROJECT-api"
echo "  Account: $ACCOUNT_ID"
echo "  ECR: $ECR_REPO"

echo ""
echo "[2/5] Applying Terraform infrastructure..."
cd "$TF_DIR"
terraform init
terraform apply -auto-approve
ALB_DNS=$(terraform output -raw alb_dns_name)
RDS_ENDPOINT=$(terraform output -raw rds_endpoint)
echo "  ALB: $ALB_DNS"
echo "  RDS: $RDS_ENDPOINT"

echo ""
echo "[3/5] Building and pushing Docker image..."
cd "$ROOT_DIR/src/backend"
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com"
docker build --platform linux/amd64 -t $PROJECT-api .
docker tag $PROJECT-api:latest "$ECR_REPO:latest"
docker push "$ECR_REPO:latest"
echo "  Image pushed to ECR"

echo ""
echo "[4/5] Running database migration..."
# This requires the RDS to be accessible (via bastion or temporarily public)
echo "  Skipping auto-migration — run manually:"
echo "  psql -h $RDS_ENDPOINT -U postgres -d goaliefinder -f $ROOT_DIR/database/migrations/init.sql"

echo ""
echo "[5/5] Forcing ECS service deployment..."
aws ecs update-service --cluster $PROJECT --service api --force-new-deployment --region $REGION >/dev/null
echo "  ECS service redeploying..."

echo ""
echo "========================================="
echo "  DEPLOYMENT COMPLETE"
echo "========================================="
echo ""
echo "  API URL: http://$ALB_DNS/api"
echo "  Swagger: http://$ALB_DNS/swagger"
echo ""
echo "  Next steps:"
echo "  1. Run database migration (see step 4 above)"
echo "  2. Set up domain + SSL certificate"
echo "  3. Update frontend NEXT_PUBLIC_API_URL"
echo ""
