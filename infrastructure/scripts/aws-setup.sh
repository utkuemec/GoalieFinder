#!/usr/bin/env bash
set -eu

#############################################
# GoalieFinder Toronto — AWS Infrastructure
# Creates all resources via AWS CLI
#############################################

REGION="ca-central-1"
PROJECT="goaliefinder"
DB_PASSWORD="GoalieFinder2026SecureDB"
DB_INSTANCE_CLASS="db.t3.micro"

echo "========================================="
echo "  GoalieFinder — AWS Infrastructure Setup"
echo "  Region: $REGION"
echo "========================================="

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
echo "AWS Account: $ACCOUNT_ID"
echo ""

###############################################
# 1. ECR — Docker Image Repository
###############################################
echo "[1/8] Creating ECR repository..."
ECR_URI=$(aws ecr describe-repositories --repository-names ${PROJECT}-api --region $REGION --query 'repositories[0].repositoryUri' --output text 2>/dev/null || true)
if [ -z "$ECR_URI" ] || [ "$ECR_URI" = "None" ]; then
  ECR_URI=$(aws ecr create-repository \
    --repository-name ${PROJECT}-api \
    --region $REGION \
    --image-scanning-configuration scanOnPush=true \
    --query 'repository.repositoryUri' --output text)
  echo "  Created: $ECR_URI"
else
  echo "  Already exists: $ECR_URI"
fi

###############################################
# 2. VPC — Network
###############################################
echo "[2/8] Setting up VPC and networking..."
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=${PROJECT}-vpc" --region $REGION --query 'Vpcs[0].VpcId' --output text 2>/dev/null || true)
if [ -z "$VPC_ID" ] || [ "$VPC_ID" = "None" ]; then
  VPC_ID=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --region $REGION --query 'Vpc.VpcId' --output text)
  aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames '{"Value":true}' --region $REGION
  aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-support '{"Value":true}' --region $REGION
  aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=${PROJECT}-vpc --region $REGION
  echo "  Created VPC: $VPC_ID"
else
  echo "  VPC exists: $VPC_ID"
fi

# Get AZs
AZ1=$(aws ec2 describe-availability-zones --region $REGION --query 'AvailabilityZones[0].ZoneName' --output text)
AZ2=$(aws ec2 describe-availability-zones --region $REGION --query 'AvailabilityZones[1].ZoneName' --output text)

# Public subnets
PUB_SUB1=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=${PROJECT}-public-1" --region $REGION --query 'Subnets[0].SubnetId' --output text 2>/dev/null || true)
if [ -z "$PUB_SUB1" ] || [ "$PUB_SUB1" = "None" ]; then
  PUB_SUB1=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --availability-zone $AZ1 --region $REGION --query 'Subnet.SubnetId' --output text)
  aws ec2 create-tags --resources $PUB_SUB1 --tags Key=Name,Value=${PROJECT}-public-1 --region $REGION
  aws ec2 modify-subnet-attribute --subnet-id $PUB_SUB1 --map-public-ip-on-launch --region $REGION
fi

PUB_SUB2=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=${PROJECT}-public-2" --region $REGION --query 'Subnets[0].SubnetId' --output text 2>/dev/null || true)
if [ -z "$PUB_SUB2" ] || [ "$PUB_SUB2" = "None" ]; then
  PUB_SUB2=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.2.0/24 --availability-zone $AZ2 --region $REGION --query 'Subnet.SubnetId' --output text)
  aws ec2 create-tags --resources $PUB_SUB2 --tags Key=Name,Value=${PROJECT}-public-2 --region $REGION
  aws ec2 modify-subnet-attribute --subnet-id $PUB_SUB2 --map-public-ip-on-launch --region $REGION
fi

# Private subnets
PRV_SUB1=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=${PROJECT}-private-1" --region $REGION --query 'Subnets[0].SubnetId' --output text 2>/dev/null || true)
if [ -z "$PRV_SUB1" ] || [ "$PRV_SUB1" = "None" ]; then
  PRV_SUB1=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.10.0/24 --availability-zone $AZ1 --region $REGION --query 'Subnet.SubnetId' --output text)
  aws ec2 create-tags --resources $PRV_SUB1 --tags Key=Name,Value=${PROJECT}-private-1 --region $REGION
fi

PRV_SUB2=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=${PROJECT}-private-2" --region $REGION --query 'Subnets[0].SubnetId' --output text 2>/dev/null || true)
if [ -z "$PRV_SUB2" ] || [ "$PRV_SUB2" = "None" ]; then
  PRV_SUB2=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.11.0/24 --availability-zone $AZ2 --region $REGION --query 'Subnet.SubnetId' --output text)
  aws ec2 create-tags --resources $PRV_SUB2 --tags Key=Name,Value=${PROJECT}-private-2 --region $REGION
fi

echo "  Public subnets:  $PUB_SUB1, $PUB_SUB2"
echo "  Private subnets: $PRV_SUB1, $PRV_SUB2"

# Internet Gateway
IGW_ID=$(aws ec2 describe-internet-gateways --filters "Name=tag:Name,Values=${PROJECT}-igw" --region $REGION --query 'InternetGateways[0].InternetGatewayId' --output text 2>/dev/null || true)
if [ -z "$IGW_ID" ] || [ "$IGW_ID" = "None" ]; then
  IGW_ID=$(aws ec2 create-internet-gateway --region $REGION --query 'InternetGateway.InternetGatewayId' --output text)
  aws ec2 create-tags --resources $IGW_ID --tags Key=Name,Value=${PROJECT}-igw --region $REGION
  aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID --region $REGION
fi

# Public route table
PUB_RT=$(aws ec2 describe-route-tables --filters "Name=tag:Name,Values=${PROJECT}-public-rt" --region $REGION --query 'RouteTables[0].RouteTableId' --output text 2>/dev/null || true)
if [ -z "$PUB_RT" ] || [ "$PUB_RT" = "None" ]; then
  PUB_RT=$(aws ec2 create-route-table --vpc-id $VPC_ID --region $REGION --query 'RouteTable.RouteTableId' --output text)
  aws ec2 create-tags --resources $PUB_RT --tags Key=Name,Value=${PROJECT}-public-rt --region $REGION
  aws ec2 create-route --route-table-id $PUB_RT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID --region $REGION > /dev/null
  aws ec2 associate-route-table --route-table-id $PUB_RT --subnet-id $PUB_SUB1 --region $REGION > /dev/null
  aws ec2 associate-route-table --route-table-id $PUB_RT --subnet-id $PUB_SUB2 --region $REGION > /dev/null
fi

###############################################
# 3. Security Groups
###############################################
echo "[3/8] Creating security groups..."
ALB_SG=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=${PROJECT}-alb-sg" "Name=vpc-id,Values=$VPC_ID" --region $REGION --query 'SecurityGroups[0].GroupId' --output text 2>/dev/null || true)
if [ -z "$ALB_SG" ] || [ "$ALB_SG" = "None" ]; then
  ALB_SG=$(aws ec2 create-security-group --group-name ${PROJECT}-alb-sg --description "ALB security group" --vpc-id $VPC_ID --region $REGION --query 'GroupId' --output text)
  aws ec2 authorize-security-group-ingress --group-id $ALB_SG --protocol tcp --port 80 --cidr 0.0.0.0/0 --region $REGION > /dev/null
  aws ec2 authorize-security-group-ingress --group-id $ALB_SG --protocol tcp --port 443 --cidr 0.0.0.0/0 --region $REGION > /dev/null
fi

ECS_SG=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=${PROJECT}-ecs-sg" "Name=vpc-id,Values=$VPC_ID" --region $REGION --query 'SecurityGroups[0].GroupId' --output text 2>/dev/null || true)
if [ -z "$ECS_SG" ] || [ "$ECS_SG" = "None" ]; then
  ECS_SG=$(aws ec2 create-security-group --group-name ${PROJECT}-ecs-sg --description "ECS tasks security group" --vpc-id $VPC_ID --region $REGION --query 'GroupId' --output text)
  aws ec2 authorize-security-group-ingress --group-id $ECS_SG --protocol tcp --port 5000 --source-group $ALB_SG --region $REGION > /dev/null
  # Allow outbound to internet (for pulling images, DB access)
  aws ec2 authorize-security-group-egress --group-id $ECS_SG --protocol -1 --cidr 0.0.0.0/0 --region $REGION > /dev/null 2>&1 || true
fi

RDS_SG=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=${PROJECT}-rds-sg" "Name=vpc-id,Values=$VPC_ID" --region $REGION --query 'SecurityGroups[0].GroupId' --output text 2>/dev/null || true)
if [ -z "$RDS_SG" ] || [ "$RDS_SG" = "None" ]; then
  RDS_SG=$(aws ec2 create-security-group --group-name ${PROJECT}-rds-sg --description "RDS security group" --vpc-id $VPC_ID --region $REGION --query 'GroupId' --output text)
  aws ec2 authorize-security-group-ingress --group-id $RDS_SG --protocol tcp --port 5432 --source-group $ECS_SG --region $REGION > /dev/null
  # Allow from local IP for initial setup
  MY_IP=$(curl -s https://checkip.amazonaws.com)
  aws ec2 authorize-security-group-ingress --group-id $RDS_SG --protocol tcp --port 5432 --cidr ${MY_IP}/32 --region $REGION > /dev/null 2>&1 || true
fi

echo "  ALB SG: $ALB_SG"
echo "  ECS SG: $ECS_SG"
echo "  RDS SG: $RDS_SG"

###############################################
# 4. S3 Bucket
###############################################
echo "[4/8] Creating S3 bucket..."
S3_BUCKET="${PROJECT}-toronto-uploads"
aws s3api head-bucket --bucket $S3_BUCKET --region $REGION 2>/dev/null || {
  aws s3 mb s3://$S3_BUCKET --region $REGION > /dev/null
  aws s3api put-public-access-block --bucket $S3_BUCKET --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false --region $REGION
  echo "  Created: $S3_BUCKET"
}
echo "  S3 Bucket: $S3_BUCKET"

###############################################
# 5. RDS PostgreSQL
###############################################
echo "[5/8] Creating RDS PostgreSQL (this takes ~5 minutes)..."
RDS_ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier ${PROJECT}-db --region $REGION --query 'DBInstances[0].Endpoint.Address' --output text 2>/dev/null || true)
if [ -z "$RDS_ENDPOINT" ] || [ "$RDS_ENDPOINT" = "None" ]; then
  # Create DB subnet group
  aws rds create-db-subnet-group \
    --db-subnet-group-name ${PROJECT}-db-subnet \
    --db-subnet-group-description "GoalieFinder DB subnets" \
    --subnet-ids $PUB_SUB1 $PUB_SUB2 \
    --region $REGION > /dev/null 2>&1 || true

  aws rds create-db-instance \
    --db-instance-identifier ${PROJECT}-db \
    --db-instance-class $DB_INSTANCE_CLASS \
    --engine postgres \
    --engine-version 16.4 \
    --allocated-storage 20 \
    --storage-type gp3 \
    --master-username postgres \
    --master-user-password "$DB_PASSWORD" \
    --db-name goaliefinder \
    --vpc-security-group-ids $RDS_SG \
    --db-subnet-group-name ${PROJECT}-db-subnet \
    --publicly-accessible \
    --backup-retention-period 7 \
    --no-multi-az \
    --region $REGION > /dev/null

  echo "  RDS instance creating... waiting for it to be available"
  aws rds wait db-instance-available --db-instance-identifier ${PROJECT}-db --region $REGION
  RDS_ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier ${PROJECT}-db --region $REGION --query 'DBInstances[0].Endpoint.Address' --output text)
  echo "  Created: $RDS_ENDPOINT"
else
  echo "  Already exists: $RDS_ENDPOINT"
fi

###############################################
# 6. ECS Cluster
###############################################
echo "[6/8] Creating ECS cluster..."
aws ecs describe-clusters --clusters $PROJECT --region $REGION --query 'clusters[0].status' --output text 2>/dev/null | grep -q ACTIVE || {
  aws ecs create-cluster --cluster-name $PROJECT --region $REGION \
    --settings name=containerInsights,value=enabled > /dev/null
  echo "  Created ECS cluster: $PROJECT"
}
echo "  ECS Cluster: $PROJECT"

###############################################
# 7. ALB (Application Load Balancer)
###############################################
echo "[7/8] Creating Application Load Balancer..."
ALB_ARN=$(aws elbv2 describe-load-balancers --names ${PROJECT}-alb --region $REGION --query 'LoadBalancers[0].LoadBalancerArn' --output text 2>/dev/null || true)
if [ -z "$ALB_ARN" ] || [ "$ALB_ARN" = "None" ]; then
  ALB_ARN=$(aws elbv2 create-load-balancer \
    --name ${PROJECT}-alb \
    --subnets $PUB_SUB1 $PUB_SUB2 \
    --security-groups $ALB_SG \
    --scheme internet-facing \
    --type application \
    --region $REGION \
    --query 'LoadBalancers[0].LoadBalancerArn' --output text)
fi

ALB_DNS=$(aws elbv2 describe-load-balancers --load-balancer-arns $ALB_ARN --region $REGION --query 'LoadBalancers[0].DNSName' --output text)

# Target group
TG_ARN=$(aws elbv2 describe-target-groups --names ${PROJECT}-api-tg --region $REGION --query 'TargetGroups[0].TargetGroupArn' --output text 2>/dev/null || true)
if [ -z "$TG_ARN" ] || [ "$TG_ARN" = "None" ]; then
  TG_ARN=$(aws elbv2 create-target-group \
    --name ${PROJECT}-api-tg \
    --protocol HTTP \
    --port 5000 \
    --vpc-id $VPC_ID \
    --target-type ip \
    --health-check-path "/api/goalkeepers/nearby?lat=43.6&lng=-79.3" \
    --health-check-interval-seconds 30 \
    --healthy-threshold-count 2 \
    --region $REGION \
    --query 'TargetGroups[0].TargetGroupArn' --output text)
fi

# Listener
LISTENER_ARN=$(aws elbv2 describe-listeners --load-balancer-arn $ALB_ARN --region $REGION --query 'Listeners[0].ListenerArn' --output text 2>/dev/null || true)
if [ -z "$LISTENER_ARN" ] || [ "$LISTENER_ARN" = "None" ]; then
  aws elbv2 create-listener \
    --load-balancer-arn $ALB_ARN \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=$TG_ARN \
    --region $REGION > /dev/null
fi

echo "  ALB DNS: $ALB_DNS"
echo "  Target Group: $TG_ARN"

###############################################
# 8. ECS Task Definition + Service
###############################################
echo "[8/8] Creating ECS task definition and service..."

# Create execution role if not exists
EXEC_ROLE_ARN="arn:aws:iam::${ACCOUNT_ID}:role/${PROJECT}-ecs-execution"
aws iam get-role --role-name ${PROJECT}-ecs-execution > /dev/null 2>&1 || {
  aws iam create-role \
    --role-name ${PROJECT}-ecs-execution \
    --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ecs-tasks.amazonaws.com"},"Action":"sts:AssumeRole"}]}' > /dev/null
  aws iam attach-role-policy \
    --role-name ${PROJECT}-ecs-execution \
    --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
}

# Create task role
TASK_ROLE_ARN="arn:aws:iam::${ACCOUNT_ID}:role/${PROJECT}-ecs-task"
aws iam get-role --role-name ${PROJECT}-ecs-task > /dev/null 2>&1 || {
  aws iam create-role \
    --role-name ${PROJECT}-ecs-task \
    --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ecs-tasks.amazonaws.com"},"Action":"sts:AssumeRole"}]}' > /dev/null
}

# Create CloudWatch log group
aws logs create-log-group --log-group-name /ecs/${PROJECT}-api --region $REGION 2>/dev/null || true

CONNECTION_STRING="Host=${RDS_ENDPOINT};Port=5432;Database=goaliefinder;Username=postgres;Password=${DB_PASSWORD}"

# Register task definition
cat > /tmp/task-def.json << TASKEOF
{
  "family": "${PROJECT}-api",
  "networkMode": "awsvpc",
  "requiresCompatibilities": ["FARGATE"],
  "cpu": "512",
  "memory": "1024",
  "executionRoleArn": "${EXEC_ROLE_ARN}",
  "taskRoleArn": "${TASK_ROLE_ARN}",
  "containerDefinitions": [{
    "name": "api",
    "image": "${ECR_URI}:latest",
    "essential": true,
    "portMappings": [{"containerPort": 5000, "protocol": "tcp"}],
    "environment": [
      {"name": "ASPNETCORE_ENVIRONMENT", "value": "Production"},
      {"name": "ASPNETCORE_URLS", "value": "http://+:5000"},
      {"name": "ConnectionStrings__DefaultConnection", "value": "${CONNECTION_STRING}"},
      {"name": "Jwt__Secret", "value": "Z67Noj2oHDJyCJDAFXCTpI878AfZmjMX5aeeGyn4+y3vz2KR/kWB34CksRYH7gXF"},
      {"name": "Jwt__Issuer", "value": "GoalieFinder"},
      {"name": "Jwt__Audience", "value": "GoalieFinder"},
      {"name": "AWS__S3__BucketName", "value": "${S3_BUCKET}"}
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/${PROJECT}-api",
        "awslogs-region": "${REGION}",
        "awslogs-stream-prefix": "api"
      }
    }
  }]
}
TASKEOF

aws ecs register-task-definition --cli-input-json file:///tmp/task-def.json --region $REGION > /dev/null
echo "  Task definition registered"

# Create or update ECS service
SVC_STATUS=$(aws ecs describe-services --cluster $PROJECT --services api --region $REGION --query 'services[0].status' --output text 2>/dev/null || true)
if [ "$SVC_STATUS" != "ACTIVE" ]; then
  aws ecs create-service \
    --cluster $PROJECT \
    --service-name api \
    --task-definition ${PROJECT}-api \
    --desired-count 0 \
    --launch-type FARGATE \
    --network-configuration "awsvpcConfiguration={subnets=[$PUB_SUB1,$PUB_SUB2],securityGroups=[$ECS_SG],assignPublicIp=ENABLED}" \
    --load-balancers "targetGroupArn=$TG_ARN,containerName=api,containerPort=5000" \
    --region $REGION > /dev/null
  echo "  ECS Service created (desired count: 0 — will start after first Docker image push)"
else
  echo "  ECS Service already exists"
fi

###############################################
# SUMMARY
###############################################
echo ""
echo "========================================="
echo "  SETUP COMPLETE!"
echo "========================================="
echo ""
echo "  ECR Repository:  $ECR_URI"
echo "  RDS Endpoint:    $RDS_ENDPOINT"
echo "  RDS Password:    $DB_PASSWORD"
echo "  S3 Bucket:       $S3_BUCKET"
echo "  ALB DNS:         $ALB_DNS"
echo "  API URL:         http://$ALB_DNS/api"
echo "  VPC:             $VPC_ID"
echo "  ECS Cluster:     $PROJECT"
echo ""
echo "  Connection String:"
echo "  $CONNECTION_STRING"
echo ""
echo "  NEXT STEPS:"
echo "  1. Run database migration:"
echo "     psql -h $RDS_ENDPOINT -U postgres -d goaliefinder -f database/migrations/init.sql"
echo "     (password: $DB_PASSWORD)"
echo ""
echo "  2. Build and push Docker image:"
echo "     aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URI"
echo "     cd src/backend && docker build --platform linux/amd64 -t ${PROJECT}-api ."
echo "     docker tag ${PROJECT}-api:latest ${ECR_URI}:latest"
echo "     docker push ${ECR_URI}:latest"
echo ""
echo "  3. Start the ECS service:"
echo "     aws ecs update-service --cluster $PROJECT --service api --desired-count 1 --region $REGION"
echo ""
