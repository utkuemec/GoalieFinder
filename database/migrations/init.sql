CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(256) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    profile_photo_url TEXT,
    role INTEGER NOT NULL DEFAULT 0,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    stripe_customer_id VARCHAR(256),
    stripe_connect_account_id VARCHAR(256),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users(email);

CREATE TABLE goalkeeper_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    price_per_match DECIMAL(10,2) NOT NULL DEFAULT 0,
    experience_years INTEGER NOT NULL DEFAULT 0,
    bio TEXT,
    latitude DOUBLE PRECISION NOT NULL DEFAULT 0,
    longitude DOUBLE PRECISION NOT NULL DEFAULT 0,
    location GEOGRAPHY(POINT, 4326),
    max_travel_distance_km INTEGER NOT NULL DEFAULT 15,
    rating DOUBLE PRECISION NOT NULL DEFAULT 0,
    total_matches INTEGER NOT NULL DEFAULT 0,
    total_reviews INTEGER NOT NULL DEFAULT 0,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_gk_available ON goalkeeper_profiles(is_available);
CREATE INDEX idx_gk_lat_lng ON goalkeeper_profiles(latitude, longitude);
CREATE INDEX idx_gk_location ON goalkeeper_profiles USING GIST(location);

CREATE TABLE goalkeeper_availabilities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    goalkeeper_profile_id UUID NOT NULL REFERENCES goalkeeper_profiles(id) ON DELETE CASCADE,
    day_of_week INTEGER NOT NULL CHECK (day_of_week BETWEEN 0 AND 6),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    is_recurring BOOLEAN NOT NULL DEFAULT TRUE,
    specific_date DATE
);

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
    status INTEGER NOT NULL DEFAULT 0,
    accepted_goalkeeper_id UUID REFERENCES goalkeeper_profiles(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_matches_status ON matches(status);
CREATE INDEX idx_matches_datetime ON matches(match_date_time);
CREATE INDEX idx_matches_location ON matches(field_latitude, field_longitude);
CREATE INDEX idx_matches_field_location ON matches USING GIST(field_location);

CREATE TABLE match_acceptances (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    goalkeeper_profile_id UUID NOT NULL REFERENCES goalkeeper_profiles(id) ON DELETE CASCADE,
    status INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(match_id, goalkeeper_profile_id)
);

CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    reviewer_id UUID NOT NULL REFERENCES users(id),
    reviewee_id UUID NOT NULL REFERENCES users(id),
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(1000),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(match_id, reviewer_id)
);

CREATE INDEX idx_reviews_reviewee ON reviews(reviewee_id);

CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id UUID NOT NULL UNIQUE REFERENCES matches(id) ON DELETE CASCADE,
    stripe_payment_intent_id VARCHAR(256) NOT NULL,
    stripe_transfer_id VARCHAR(256),
    amount DECIMAL(10,2) NOT NULL,
    platform_fee DECIMAL(10,2) NOT NULL,
    goalkeeper_payout DECIMAL(10,2) NOT NULL,
    status INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    completed_at TIMESTAMPTZ
);

CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    message VARCHAR(1000) NOT NULL,
    type INTEGER NOT NULL DEFAULT 0,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    data TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_notifications_user_read ON notifications(user_id, is_read);

-- Trigger function: update goalkeeper_profiles.location from latitude/longitude
CREATE OR REPLACE FUNCTION update_goalkeeper_profile_location()
RETURNS TRIGGER AS $$
BEGIN
    NEW.location := ST_SetSRID(ST_MakePoint(NEW.longitude, NEW.latitude), 4326)::geography;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_goalkeeper_profile_location
    BEFORE INSERT OR UPDATE OF latitude, longitude ON goalkeeper_profiles
    FOR EACH ROW
    EXECUTE FUNCTION update_goalkeeper_profile_location();

-- Trigger function: update matches.field_location from field_latitude/field_longitude
CREATE OR REPLACE FUNCTION update_match_field_location()
RETURNS TRIGGER AS $$
BEGIN
    NEW.field_location := ST_SetSRID(ST_MakePoint(NEW.field_longitude, NEW.field_latitude), 4326)::geography;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_match_field_location
    BEFORE INSERT OR UPDATE OF field_latitude, field_longitude ON matches
    FOR EACH ROW
    EXECUTE FUNCTION update_match_field_location();
