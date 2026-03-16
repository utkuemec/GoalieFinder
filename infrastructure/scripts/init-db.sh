#!/bin/bash
set -euo pipefail

# GoalieFinder Toronto — Database Initialization
# Runs init.sql against the production RDS PostgreSQL instance
#
# Usage: ./init-db.sh <rds-endpoint> <password>
# Example: ./init-db.sh goaliefinder-db.xxxx.ca-central-1.rds.amazonaws.com MySecurePass123

if [ $# -lt 2 ]; then
  echo "Usage: $0 <rds-endpoint> <db-password>"
  echo "Example: $0 goaliefinder-db.xxxx.ca-central-1.rds.amazonaws.com MyPass123"
  exit 1
fi

RDS_HOST="$1"
DB_PASSWORD="$2"
DB_NAME="goaliefinder"
DB_USER="postgres"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SQL_FILE="$SCRIPT_DIR/../../database/migrations/init.sql"

echo "GoalieFinder — Database Initialization"
echo "======================================="
echo "Host: $RDS_HOST"
echo "Database: $DB_NAME"
echo ""

command -v psql >/dev/null 2>&1 || { echo "ERROR: psql not installed. Run: brew install postgresql"; exit 1; }

echo "[1/3] Testing connection..."
PGPASSWORD="$DB_PASSWORD" psql -h "$RDS_HOST" -U "$DB_USER" -d "$DB_NAME" -c "SELECT version();" || {
  echo "ERROR: Cannot connect to database."
  echo "Make sure:"
  echo "  - RDS instance is running"
  echo "  - Security group allows your IP on port 5432"
  echo "  - Password is correct"
  exit 1
}

echo ""
echo "[2/3] Enabling PostGIS extension..."
PGPASSWORD="$DB_PASSWORD" psql -h "$RDS_HOST" -U "$DB_USER" -d "$DB_NAME" -c "CREATE EXTENSION IF NOT EXISTS postgis;"

echo ""
echo "[3/3] Running migration script..."
PGPASSWORD="$DB_PASSWORD" psql -h "$RDS_HOST" -U "$DB_USER" -d "$DB_NAME" -f "$SQL_FILE"

echo ""
echo "Database initialized successfully!"
echo "Tables created:"
PGPASSWORD="$DB_PASSWORD" psql -h "$RDS_HOST" -U "$DB_USER" -d "$DB_NAME" -c "\dt public.*"
