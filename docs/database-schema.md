# GoalieFinder Toronto — Database Schema

## Overview

PostgreSQL 16 with PostGIS extension for geospatial queries.

## Entity Relationship Diagram

```
┌──────────────────┐       ┌──────────────────────────┐
│      Users       │       │   GoalkeeperProfiles     │
├──────────────────┤       ├──────────────────────────┤
│ id (PK)          │──1:1──│ id (PK)                  │
│ email (unique)   │       │ user_id (FK → Users)     │
│ password_hash    │       │ price_per_match           │
│ first_name       │       │ experience_years          │
│ last_name        │       │ bio                       │
│ phone_number     │       │ latitude                  │
│ profile_photo_url│       │ longitude                 │
│ role             │       │ max_travel_distance_km    │
│ is_verified      │       │ rating                    │
│ is_active        │       │ total_matches             │
│ stripe_customer  │       │ total_reviews             │
│ stripe_connect   │       │ is_available              │
│ created_at       │       │ created_at / updated_at   │
│ updated_at       │       └────────────┬─────────────┘
└──────┬───────────┘                    │
       │                                │ 1:N
       │ 1:1                            ▼
       │                   ┌──────────────────────────┐
       │                   │ GoalkeeperAvailabilities  │
       │                   ├──────────────────────────┤
       │                   │ id (PK)                   │
       │                   │ goalkeeper_profile_id (FK)│
       │                   │ day_of_week               │
       │                   │ start_time                │
       │                   │ end_time                  │
       │                   │ is_recurring              │
       │                   │ specific_date             │
       │                   └──────────────────────────┘
       │
       ▼
┌──────────────────┐       ┌──────────────────────────┐
│  TeamProfiles    │       │        Matches            │
├──────────────────┤       ├──────────────────────────┤
│ id (PK)          │──1:N──│ id (PK)                  │
│ user_id (FK)     │       │ team_profile_id (FK)     │
│ team_name        │       │ field_name                │
│ description      │       │ field_address             │
│ rating           │       │ field_latitude            │
│ total_matches    │       │ field_longitude           │
│ total_reviews    │       │ match_date_time           │
│ created_at       │       │ duration_minutes          │
│ updated_at       │       │ payment_amount            │
└──────────────────┘       │ platform_fee              │
                           │ total_amount              │
                           │ notes                     │
                           │ status                    │
                           │ accepted_goalkeeper_id    │
                           │ created_at / updated_at   │
                           └────────────┬─────────────┘
                                        │
                    ┌───────────────┬────┴────┬──────────────┐
                    │ 1:N           │ 1:1     │ 1:N          │
                    ▼               ▼         ▼              │
      ┌─────────────────┐  ┌──────────┐  ┌─────────┐       │
      │MatchAcceptances │  │ Payments │  │ Reviews │       │
      ├─────────────────┤  ├──────────┤  ├─────────┤       │
      │ id (PK)         │  │ id (PK)  │  │ id (PK) │       │
      │ match_id (FK)   │  │match_id  │  │match_id │       │
      │ gk_profile_id   │  │stripe_pi │  │reviewer │       │
      │ status          │  │stripe_tr │  │reviewee │       │
      │ created_at      │  │amount    │  │rating   │       │
      └─────────────────┘  │plat_fee  │  │comment  │       │
                           │gk_payout │  │created  │       │
                           │status    │  └─────────┘       │
                           │created   │                     │
                           │completed │  ┌──────────────┐   │
                           └──────────┘  │Notifications │   │
                                         ├──────────────┤   │
                                         │ id (PK)      │   │
                                         │ user_id (FK) │   │
                                         │ title        │   │
                                         │ message      │   │
                                         │ type         │   │
                                         │ is_read      │   │
                                         │ data (JSON)  │   │
                                         │ created_at   │   │
                                         └──────────────┘   │
```

## SQL Schema

```sql
-- Enable PostGIS for geospatial queries
CREATE EXTENSION IF NOT EXISTS postgis;

-- Enum types
CREATE TYPE user_role AS ENUM ('TeamCaptain', 'Goalkeeper', 'Admin');
CREATE TYPE match_status AS ENUM ('Open', 'Accepted', 'InProgress', 'Completed', 'Cancelled', 'Disputed');
CREATE TYPE acceptance_status AS ENUM ('Pending', 'Accepted', 'Rejected', 'Withdrawn');
CREATE TYPE payment_status AS ENUM ('Pending', 'Authorized', 'Captured', 'Released', 'Refunded', 'Failed');
CREATE TYPE notification_type AS ENUM ('MatchRequest', 'MatchAccepted', 'MatchCancelled', 'PaymentReceived', 'ReviewReceived', 'SystemAlert');

-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(256) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    profile_photo_url TEXT,
    role user_role NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    stripe_customer_id VARCHAR(256),
    stripe_connect_account_id VARCHAR(256),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- Goalkeeper profiles
CREATE TABLE goalkeeper_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    price_per_match DECIMAL(10,2) NOT NULL DEFAULT 0,
    experience_years INTEGER NOT NULL DEFAULT 0,
    bio TEXT,
    latitude DOUBLE PRECISION NOT NULL DEFAULT 0,
    longitude DOUBLE PRECISION NOT NULL DEFAULT 0,
    location GEOGRAPHY(POINT, 4326),  -- PostGIS geography column
    max_travel_distance_km INTEGER NOT NULL DEFAULT 15,
    rating DOUBLE PRECISION NOT NULL DEFAULT 0,
    total_matches INTEGER NOT NULL DEFAULT 0,
    total_reviews INTEGER NOT NULL DEFAULT 0,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_gk_location ON goalkeeper_profiles USING GIST(location);
CREATE INDEX idx_gk_available ON goalkeeper_profiles(is_available);
CREATE INDEX idx_gk_lat_lng ON goalkeeper_profiles(latitude, longitude);

-- Auto-update location geography from lat/lng
CREATE OR REPLACE FUNCTION update_gk_location()
RETURNS TRIGGER AS $$
BEGIN
    NEW.location = ST_SetSRID(ST_MakePoint(NEW.longitude, NEW.latitude), 4326)::geography;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_gk_location
    BEFORE INSERT OR UPDATE OF latitude, longitude ON goalkeeper_profiles
    FOR EACH ROW EXECUTE FUNCTION update_gk_location();

-- Goalkeeper availability
CREATE TABLE goalkeeper_availabilities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    goalkeeper_profile_id UUID NOT NULL REFERENCES goalkeeper_profiles(id) ON DELETE CASCADE,
    day_of_week INTEGER NOT NULL CHECK (day_of_week BETWEEN 0 AND 6),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    is_recurring BOOLEAN NOT NULL DEFAULT TRUE,
    specific_date DATE,
    CONSTRAINT chk_time_range CHECK (start_time < end_time)
);

CREATE INDEX idx_gk_avail_profile ON goalkeeper_availabilities(goalkeeper_profile_id);

-- Team profiles
CREATE TABLE team_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    team_name VARCHAR(200) NOT NULL,
    description TEXT,
    rating DOUBLE PRECISION NOT NULL DEFAULT 0,
    total_matches INTEGER NOT NULL DEFAULT 0,
    total_reviews INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Matches
CREATE TABLE matches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    team_profile_id UUID NOT NULL REFERENCES team_profiles(id) ON DELETE CASCADE,
    field_name VARCHAR(200) NOT NULL,
    field_address VARCHAR(500) NOT NULL,
    field_latitude DOUBLE PRECISION NOT NULL,
    field_longitude DOUBLE PRECISION NOT NULL,
    field_location GEOGRAPHY(POINT, 4326),
    match_date_time TIMESTAMPTZ NOT NULL,
    duration_minutes INTEGER NOT NULL DEFAULT 60,
    payment_amount DECIMAL(10,2) NOT NULL,
    platform_fee DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    notes TEXT,
    status match_status NOT NULL DEFAULT 'Open',
    accepted_goalkeeper_id UUID REFERENCES goalkeeper_profiles(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_matches_status ON matches(status);
CREATE INDEX idx_matches_datetime ON matches(match_date_time);
CREATE INDEX idx_matches_location ON matches USING GIST(field_location);
CREATE INDEX idx_matches_team ON matches(team_profile_id);

-- Auto-update match location geography
CREATE OR REPLACE FUNCTION update_match_location()
RETURNS TRIGGER AS $$
BEGIN
    NEW.field_location = ST_SetSRID(ST_MakePoint(NEW.field_longitude, NEW.field_latitude), 4326)::geography;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_match_location
    BEFORE INSERT OR UPDATE OF field_latitude, field_longitude ON matches
    FOR EACH ROW EXECUTE FUNCTION update_match_location();

-- Match acceptances
CREATE TABLE match_acceptances (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    goalkeeper_profile_id UUID NOT NULL REFERENCES goalkeeper_profiles(id) ON DELETE CASCADE,
    status acceptance_status NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(match_id, goalkeeper_profile_id)
);

-- Reviews
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    reviewer_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    reviewee_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(1000),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(match_id, reviewer_id)
);

CREATE INDEX idx_reviews_reviewee ON reviews(reviewee_id);

-- Payments
CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL UNIQUE REFERENCES matches(id) ON DELETE CASCADE,
    stripe_payment_intent_id VARCHAR(256) NOT NULL,
    stripe_transfer_id VARCHAR(256),
    amount DECIMAL(10,2) NOT NULL,
    platform_fee DECIMAL(10,2) NOT NULL,
    goalkeeper_payout DECIMAL(10,2) NOT NULL,
    status payment_status NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at TIMESTAMPTZ
);

-- Notifications
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    message VARCHAR(1000) NOT NULL,
    type notification_type NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    data JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_notifications_user_read ON notifications(user_id, is_read);
CREATE INDEX idx_notifications_created ON notifications(created_at DESC);

-- =============================================================
-- GEOSPATIAL QUERY: Find nearby goalkeepers within radius
-- =============================================================
-- Example: Find available goalkeepers within 15km of a field
--
-- SELECT gp.*, u.first_name, u.last_name,
--        ST_Distance(gp.location, ST_SetSRID(ST_MakePoint(-79.3832, 43.6532), 4326)::geography) / 1000 AS distance_km
-- FROM goalkeeper_profiles gp
-- JOIN users u ON gp.user_id = u.id
-- WHERE gp.is_available = TRUE
--   AND u.is_active = TRUE
--   AND ST_DWithin(
--       gp.location,
--       ST_SetSRID(ST_MakePoint(-79.3832, 43.6532), 4326)::geography,
--       15000  -- 15km in meters
--   )
-- ORDER BY gp.rating DESC, distance_km ASC;
```

## Matching Algorithm

The platform uses a weighted scoring system to rank goalkeepers:

```sql
-- Matching Score Formula
-- score = (rating_weight * normalized_rating)
--       + (distance_weight * (1 - normalized_distance))
--       + (availability_weight * availability_bonus)
--       + (experience_weight * normalized_experience)

-- Weights:
-- rating:       0.35
-- distance:     0.30
-- availability: 0.20
-- experience:   0.15

SELECT gp.id,
       u.first_name || ' ' || u.last_name AS name,
       gp.rating,
       gp.price_per_match,
       ST_Distance(gp.location, match_point) / 1000 AS distance_km,
       (0.35 * (gp.rating / 5.0)) +
       (0.30 * (1.0 - LEAST(ST_Distance(gp.location, match_point) / 1000 / 15.0, 1.0))) +
       (0.20 * CASE WHEN ga.id IS NOT NULL THEN 1.0 ELSE 0.5 END) +
       (0.15 * LEAST(gp.experience_years / 10.0, 1.0))
       AS match_score
FROM goalkeeper_profiles gp
JOIN users u ON gp.user_id = u.id
LEFT JOIN goalkeeper_availabilities ga ON ga.goalkeeper_profile_id = gp.id
    AND ga.day_of_week = EXTRACT(DOW FROM match_time)
    AND ga.start_time <= match_time::time
    AND ga.end_time >= match_time::time
WHERE gp.is_available = TRUE
  AND u.is_active = TRUE
  AND ST_DWithin(gp.location, match_point, radius_meters)
ORDER BY match_score DESC;
```

## Indexes Summary

| Table | Index | Type | Purpose |
|-------|-------|------|---------|
| users | email | B-tree (unique) | Login lookup |
| goalkeeper_profiles | location | GiST | Geospatial queries |
| goalkeeper_profiles | is_available | B-tree | Filter active GKs |
| matches | status | B-tree | Filter open matches |
| matches | match_date_time | B-tree | Time-based queries |
| matches | field_location | GiST | Nearby match search |
| notifications | user_id, is_read | B-tree | Unread notifications |
| reviews | reviewee_id | B-tree | Profile reviews |
