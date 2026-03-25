-- Bot goalkeeper seed data
-- Generated for GoalieFinder Canada
-- Bot accounts are identified by email domain @bot.goaliefinder.local
-- and password_hash starting with '$2a$11$BOT'

BEGIN;

-- === Toronto (25 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1a17a9f5-ea22-4e88-ab8d-710a0103c0b2', 'samuel.herrera@bot.goaliefinder.local', '$2a$11$BOT05ba29da97553231c6939ba314fd3b8a0aa768d19674d6a7a0', 'Samuel', 'Herrera', '+12151867586', 1, true, true, 'bot_placeholder', NOW() - interval '157 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('65629aa4-b0ba-440a-ba02-750386da02f5', '1a17a9f5-ea22-4e88-ab8d-710a0103c0b2', 20.00, 15, 'Former academy goalkeeper, now playing recreational leagues.', 43.6073, -79.4579, 20, 3.7, 40, 21, true, NOW() - interval '100 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ca848053-e9aa-43a5-9da3-b36b309ea21a', 'jae.morris@bot.goaliefinder.local', '$2a$11$BOT27c2fd44fafa0e9af285110bb67eba19c6bc1933acc4546d19', 'Jae', 'Morris', '+18596008003', 1, true, true, 'bot_placeholder', NOW() - interval '38 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8b58c5b9-3881-42be-946d-73495ce132b1', 'ca848053-e9aa-43a5-9da3-b36b309ea21a', 20.00, 2, 'Solid keeper with a positive attitude. Always on time.', 43.5966, -79.3927, 25, 3.8, 20, 3, true, NOW() - interval '131 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7fd08623-0cb4-4a7b-a2e1-54965a5d83cd', 'jean.gagnon@bot.goaliefinder.local', '$2a$11$BOT63af0ec8b26f86121ca3a78f5a26ec1564bb7d00d5c9bce666', 'Jean', 'Gagnon', '+17986998676', 1, true, true, 'bot_placeholder', NOW() - interval '92 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fb9fa150-33cc-48ce-aaff-1a1b6a8dc701', '7fd08623-0cb4-4a7b-a2e1-54965a5d83cd', 20.00, 12, 'Friendly and competitive. Great at organizing the defense.', 43.6737, -79.374, 15, 4.5, 83, 69, true, NOW() - interval '61 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3ce4ab9f-0245-4454-94b0-ac10e9f36f7b', 'marcus.lewis@bot.goaliefinder.local', '$2a$11$BOT719cf36a1b8d5322d15a3407f3a2e2b6a071fb204781a1908d', 'Marcus', 'Lewis', '+19029437455', 1, true, true, 'bot_placeholder', NOW() - interval '88 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('545d8e93-f468-44ee-977f-b8ff5596eb21', '3ce4ab9f-0245-4454-94b0-ac10e9f36f7b', 20.00, 3, 'Tall keeper with a long reach. Command the box effectively.', 43.6401, -79.4538, 15, 3.9, 3, 0, true, NOW() - interval '179 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2f148637-1153-43de-a7eb-ea469f7a9430', 'noah.ahmed@bot.goaliefinder.local', '$2a$11$BOT589f26b17e58a61463934b2a1d6963f12cde98f585de2b8d36', 'Noah', 'Ahmed', '+12549315882', 1, true, true, 'bot_placeholder', NOW() - interval '16 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ec7f608c-0b94-450b-bda3-5f630ad44317', '2f148637-1153-43de-a7eb-ea469f7a9430', 15.00, 1, 'Former academy goalkeeper, now playing recreational leagues.', 43.7058, -79.4333, 20, 4.0, 10, 0, true, NOW() - interval '168 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a606781f-e0f5-402b-b087-888d03b96ab3', 'raul.lopez@bot.goaliefinder.local', '$2a$11$BOT2dee4ffd8df99b5f0d93564b08dda49f73774a699466403175', 'Raul', 'Lopez', '+12359508106', 1, true, true, 'bot_placeholder', NOW() - interval '104 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d73685e5-6064-42f5-9ab3-3b61290c49e9', 'a606781f-e0f5-402b-b087-888d03b96ab3', 15.00, 15, 'Solid keeper with a positive attitude. Always on time.', 43.6153, -79.4041, 15, 4.0, 46, 36, true, NOW() - interval '12 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('30ffa720-674e-4c06-98a0-00208c887f3b', 'amir.silva@bot.goaliefinder.local', '$2a$11$BOTc7c5be301ff9dab1e25ce9e581083d441cde66642da495a87f', 'Amir', 'Silva', '+14614309140', 1, true, true, 'bot_placeholder', NOW() - interval '98 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f360b966-239d-47f9-b551-34cc9206b168', '30ffa720-674e-4c06-98a0-00208c887f3b', 25.00, 12, 'Strong penalty saver. Calm and focused under pressure.', 43.6653, -79.3215, 25, 3.6, 45, 26, true, NOW() - interval '91 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('415eef35-3b44-4890-a2d5-b4ec07024965', 'alexander.pelletier@bot.goaliefinder.local', '$2a$11$BOT3aec6991c05cc9d2ba3581beea89131fe78c53f2542840a15c', 'Alexander', 'Pelletier', '+17374272811', 1, true, true, 'bot_placeholder', NOW() - interval '78 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8ba84277-3e6e-4e12-acb4-f4d68c6968db', '415eef35-3b44-4890-a2d5-b4ec07024965', 45.00, 2, 'Passionate about the game. Consistent and dependable between the posts.', 43.6858, -79.4182, 20, 4.5, 19, 14, true, NOW() - interval '159 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f1e37fb0-9316-48b7-b698-b85db1a6100b', 'jorge.ali@bot.goaliefinder.local', '$2a$11$BOTcc29fabc477cf0ad8da88a70a24c2cfcba1f23d9e7b7cec1eb', 'Jorge', 'Ali', '+18678026256', 1, true, true, 'bot_placeholder', NOW() - interval '40 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('befdddcc-112f-4b44-89bc-43ce064d725e', 'f1e37fb0-9316-48b7-b698-b85db1a6100b', 30.00, 11, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.6617, -79.4124, 20, 4.8, 19, 8, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('638a7e78-0dc7-4da3-a214-8dc5c936dc3c', 'josue.oliveira@bot.goaliefinder.local', '$2a$11$BOTb590fd91df8ef4212bd7aa0c6ebbbfec54e9e0de9f5b941fa5', 'Josue', 'Oliveira', '+17718492768', 1, true, true, 'bot_placeholder', NOW() - interval '24 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('71f3809c-197b-4b9f-902e-72aafadabdb1', '638a7e78-0dc7-4da3-a214-8dc5c936dc3c', 30.00, 1, 'Provincial-level experience. Strong with high balls and one-on-ones.', 43.6121, -79.4219, 20, 4.2, 32, 24, true, NOW() - interval '81 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('37ea825f-94fb-4d63-881e-bca7aea097cb', 'justin.li@bot.goaliefinder.local', '$2a$11$BOT2b8442d6414f9c674c044202c32269a660f3a3dad5ef698f43', 'Justin', 'Li', '+12559143142', 1, true, true, 'bot_placeholder', NOW() - interval '96 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4f1eec5a-9915-443a-83ab-1275d5f19378', '37ea825f-94fb-4d63-881e-bca7aea097cb', 50.00, 12, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 43.6616, -79.3336, 20, 3.5, 34, 31, true, NOW() - interval '133 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('49f8de71-3c35-40a9-9128-6e8840bfb4af', 'thomas.harris@bot.goaliefinder.local', '$2a$11$BOT3cbd863bbc568bbb7491d59ec3a2cb0825ddbce665a8514daa', 'Thomas', 'Harris', '+19379666810', 1, true, true, 'bot_placeholder', NOW() - interval '74 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('dc32d752-a322-4202-96e3-01db6dfda0c8', '49f8de71-3c35-40a9-9128-6e8840bfb4af', 20.00, 5, 'Weekend warrior goalkeeper. Love the beautiful game!', 43.665, -79.3592, 30, 3.7, 7, 0, true, NOW() - interval '47 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('128952bd-417c-43b8-8680-5c7852f55887', 'aiden.vargas@bot.goaliefinder.local', '$2a$11$BOT71f4390622fa9b91f2e8c44121c3213e1eba3535d16e04d0df', 'Aiden', 'Vargas', '+14241494816', 1, true, true, 'bot_placeholder', NOW() - interval '152 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ec059959-648e-48fb-82d6-f754085ac842', '128952bd-417c-43b8-8680-5c7852f55887', 25.00, 5, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.6607, -79.3538, 15, 4.6, 59, 44, true, NOW() - interval '117 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1cbc0993-a6e5-44ee-99af-55b80aefac25', 'andre.baker@bot.goaliefinder.local', '$2a$11$BOT26470baaae14d7837853990b90531669dcae3d2b1c4bbdc434', 'Andre', 'Baker', '+12895393653', 1, true, true, 'bot_placeholder', NOW() - interval '99 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ccb47b67-ea0f-4cb3-bac6-16c0f68a05ba', '1cbc0993-a6e5-44ee-99af-55b80aefac25', 45.00, 14, 'Passionate about the game. Consistent and dependable between the posts.', 43.6951, -79.4528, 20, 4.9, 50, 39, true, NOW() - interval '140 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aa76334c-79c1-4e37-9424-d095fef2f73a', 'eric.thompson@bot.goaliefinder.local', '$2a$11$BOT02401e518d803e129ed98d2168784292eabf0dde58df8481a5', 'Eric', 'Thompson', '+15677243806', 1, true, true, 'bot_placeholder', NOW() - interval '28 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5011a0a4-59b7-492d-bf44-60690239d40d', 'aa76334c-79c1-4e37-9424-d095fef2f73a', 40.00, 6, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.6805, -79.4359, 20, 3.9, 8, 2, true, NOW() - interval '16 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('59e461f3-b888-4b3e-b233-0931edc993d3', 'kyle.kofi@bot.goaliefinder.local', '$2a$11$BOT930d678f92508737b0c6457f169ec552b484f5319d9e643a5b', 'Kyle', 'Kofi', '+17593223591', 1, true, true, 'bot_placeholder', NOW() - interval '153 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('25d3a7f2-bd98-4165-b280-c79191c9c439', '59e461f3-b888-4b3e-b233-0931edc993d3', 45.00, 11, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.7058, -79.4305, 25, 3.7, 61, 43, true, NOW() - interval '175 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5b7bc091-d7ae-403c-afcf-09556f243339', 'hugo.torres@bot.goaliefinder.local', '$2a$11$BOT766640ba7ab50204fd1bfbd61d90d1214202d2bca988640cd4', 'Hugo', 'Torres', '+13149051390', 1, true, true, 'bot_placeholder', NOW() - interval '25 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('57d93d84-4837-4534-a037-14e01a6359eb', '5b7bc091-d7ae-403c-afcf-09556f243339', 25.00, 12, 'Strong penalty saver. Calm and focused under pressure.', 43.6512, -79.3527, 10, 3.8, 36, 33, true, NOW() - interval '21 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('29ac40f2-5e96-48a8-b1c9-e0369b9e64c8', 'kevin.patel@bot.goaliefinder.local', '$2a$11$BOTacb3ea8778d14a6316463bb4435d70e48fc272f48f3430763c', 'Kevin', 'Patel', '+16228797720', 1, true, true, 'bot_placeholder', NOW() - interval '60 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4395043b-c046-414c-aeb7-c03555a92729', '29ac40f2-5e96-48a8-b1c9-e0369b9e64c8', 15.00, 10, 'Athletic shot-stopper with years of competitive experience.', 43.6008, -79.3675, 20, 4.7, 68, 49, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4c3228e7-03aa-42ab-a709-b75900cc4558', 'ryan.gagnon@bot.goaliefinder.local', '$2a$11$BOTab75ecc5fa42f1c159a62d245093082a88aa6173d8eeaf0adf', 'Ryan', 'Gagnon', '+13453820092', 1, true, true, 'bot_placeholder', NOW() - interval '29 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('aeeaa771-0f74-4f1a-a8d5-aadc4151290d', '4c3228e7-03aa-42ab-a709-b75900cc4558', 40.00, 5, 'Weekend warrior goalkeeper. Love the beautiful game!', 43.607, -79.3508, 10, 3.6, 47, 46, true, NOW() - interval '94 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b5978473-6ff1-4f70-a707-e6ec9aa037fd', 'paolo.wright@bot.goaliefinder.local', '$2a$11$BOT992fa4dd71fa3423a5559f4e43d89a1946fdf0088e1942fac3', 'Paolo', 'Wright', '+14583002904', 1, true, true, 'bot_placeholder', NOW() - interval '143 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('45875bdf-9eac-4568-8aad-cd40a9dafe79', 'b5978473-6ff1-4f70-a707-e6ec9aa037fd', 20.00, 11, 'Played keeper since I was 12. Quick feet and safe hands.', 43.6116, -79.4275, 10, 4.6, 17, 0, true, NOW() - interval '40 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c718a7ad-21e2-4f76-b1db-f1c96dd7875c', 'santiago.gagnon@bot.goaliefinder.local', '$2a$11$BOT1f3a20dd94beca1220af686b6c751926b8e3c43ae09db8d95e', 'Santiago', 'Gagnon', '+12381923712', 1, true, true, 'bot_placeholder', NOW() - interval '158 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('468a0d77-a764-4029-82a6-1446fc1924c7', 'c718a7ad-21e2-4f76-b1db-f1c96dd7875c', 35.00, 4, 'Calm under pressure. Played competitive soccer for 8 years.', 43.5953, -79.4286, 15, 3.8, 80, 66, true, NOW() - interval '120 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('578345d8-7c91-43fe-9965-68e755ec12ad', 'raul.rodriguez@bot.goaliefinder.local', '$2a$11$BOT7e1d93c212356b39bd15493fe075d986d84253ead451413c29', 'Raul', 'Rodriguez', '+14056915854', 1, true, true, 'bot_placeholder', NOW() - interval '108 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f253250f-af53-4547-a368-fa785a8b7d97', '578345d8-7c91-43fe-9965-68e755ec12ad', 25.00, 13, 'Fast and agile. Best on turf and indoor surfaces.', 43.6518, -79.373, 20, 4.3, 77, 64, true, NOW() - interval '100 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5dff7e04-a4af-4915-92f2-d7d145674af5', 'andrew.silva@bot.goaliefinder.local', '$2a$11$BOT8bd9ae25660777f63a54208aa46a030c3746b77856aa409666', 'Andrew', 'Silva', '+14584347237', 1, true, true, 'bot_placeholder', NOW() - interval '54 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('750a7f0f-4bdc-4663-8aef-906e017131c2', '5dff7e04-a4af-4915-92f2-d7d145674af5', 30.00, 10, 'Fast and agile. Best on turf and indoor surfaces.', 43.711, -79.3902, 30, 4.4, 13, 4, true, NOW() - interval '106 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7d988b31-2adc-4d11-be63-fb2b9964bfcf', 'jordan.hassan@bot.goaliefinder.local', '$2a$11$BOTf44511b414b69e9afb1af215f32157ca2a7ca8941de97ec40b', 'Jordan', 'Hassan', '+16616265143', 1, true, true, 'bot_placeholder', NOW() - interval '160 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('19c9c77d-8672-49d6-ad54-b6ed09d2aae0', '7d988b31-2adc-4d11-be63-fb2b9964bfcf', 50.00, 8, 'Versatile keeper, great with distribution and organizing the back line.', 43.6435, -79.3158, 15, 5.0, 45, 40, true, NOW() - interval '6 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('62e75aa1-8e31-4ea5-b3c1-926e1c255676', 'yousef.li@bot.goaliefinder.local', '$2a$11$BOT1a9f2240ddd5791407904865ab9fc6f45b590b8a4a0774e4e6', 'Yousef', 'Li', '+14837580232', 1, true, true, 'bot_placeholder', NOW() - interval '129 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f6132ade-7fde-4bfe-84f6-6d6adf5cc308', '62e75aa1-8e31-4ea5-b3c1-926e1c255676', 35.00, 7, 'Friendly and competitive. Great at organizing the defense.', 43.6403, -79.3548, 20, 4.4, 5, 3, true, NOW() - interval '137 days', NOW());
-- === Mississauga (22 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('093de5bb-4bcc-4c11-ad3a-fbd6b2aecae2', 'alberto.singh@bot.goaliefinder.local', '$2a$11$BOT43d3de06d558812bb9ecd6ca8f9d3acc82b6006c0f9b594cff', 'Alberto', 'Singh', '+14138959575', 1, true, true, 'bot_placeholder', NOW() - interval '55 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1058cc79-3a98-4370-8034-be2d91a4424e', '093de5bb-4bcc-4c11-ad3a-fbd6b2aecae2', 25.00, 11, 'Experienced keeper with quick reflexes and strong communication skills.', 43.5401, -79.636, 20, 4.9, 44, 44, true, NOW() - interval '84 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('70e00dab-dda2-4e9d-a7ad-a52ce2cbacff', 'hector.walker@bot.goaliefinder.local', '$2a$11$BOT3c584ef4bc5b1949807df97957c4a64eac1a0c4a9db455977e', 'Hector', 'Walker', '+16336653831', 1, true, true, 'bot_placeholder', NOW() - interval '174 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('08ee89bb-6af7-496c-82af-5eebb930a651', '70e00dab-dda2-4e9d-a7ad-a52ce2cbacff', 25.00, 15, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.5676, -79.7213, 20, 4.1, 46, 33, true, NOW() - interval '52 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9f5346e6-95dc-4087-997e-b1e3fa8770b3', 'troy.parker@bot.goaliefinder.local', '$2a$11$BOT55b67d997cc7c84c53b02144655771d642dde608b13d8bb5e5', 'Troy', 'Parker', '+13959841664', 1, true, true, 'bot_placeholder', NOW() - interval '33 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4c9d1148-7137-4d07-98f7-702795329e6a', '9f5346e6-95dc-4087-997e-b1e3fa8770b3', 25.00, 6, 'Weekend warrior goalkeeper. Love the beautiful game!', 43.6428, -79.6492, 15, 4.6, 3, 0, true, NOW() - interval '63 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4ad6cab5-babb-4e3f-8f50-885f7966d730', 'alberto.perez@bot.goaliefinder.local', '$2a$11$BOT182d89634b3baa69cf2a8e15b533492a5a06235ae002d30ad0', 'Alberto', 'Perez', '+13793914329', 1, true, true, 'bot_placeholder', NOW() - interval '35 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9b3ab319-547f-4c3a-81ec-93034320b935', '4ad6cab5-babb-4e3f-8f50-885f7966d730', 15.00, 7, 'Reliable shot-stopper available for weekend and weekday games.', 43.5517, -79.6851, 15, 3.6, 48, 45, true, NOW() - interval '55 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bc0aec0e-1295-466a-8251-2d72ed5903ae', 'théo.le@bot.goaliefinder.local', '$2a$11$BOTaf2cf3789dd981fc223d29805e80b1fb35c19a3a8f45c22479', 'Théo', 'Le', '+14982597788', 1, true, true, 'bot_placeholder', NOW() - interval '143 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('82a1f693-3a95-4d72-ac71-37eac2b5f758', 'bc0aec0e-1295-466a-8251-2d72ed5903ae', 25.00, 7, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.5359, -79.6728, 15, 3.9, 39, 29, true, NOW() - interval '140 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4d06c09a-2500-43ef-b1c0-8c5cad7e8e8f', 'paolo.li@bot.goaliefinder.local', '$2a$11$BOTffae910c5017b1555946ad33acb9d4fd554612b04545ebf6f8', 'Paolo', 'Li', '+15516269474', 1, true, true, 'bot_placeholder', NOW() - interval '12 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e2fd988c-f647-44c2-9b51-dd4be158ce5f', '4d06c09a-2500-43ef-b1c0-8c5cad7e8e8f', 50.00, 14, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.544, -79.5683, 15, 4.1, 31, 15, true, NOW() - interval '49 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c1b5e3bd-115a-4194-a8ea-40d3cbc8c279', 'amir.wang@bot.goaliefinder.local', '$2a$11$BOT294003b35e58aa61c89b345339bfbc8867e357050e12eae8ea', 'Amir', 'Wang', '+16607511279', 1, true, true, 'bot_placeholder', NOW() - interval '168 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f1bc7ae2-1e18-4982-8d30-3751c5e18722', 'c1b5e3bd-115a-4194-a8ea-40d3cbc8c279', 20.00, 14, 'Technical goalkeeper who loves playing out from the back.', 43.5317, -79.6422, 20, 3.9, 14, 5, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a514eb1c-bad4-42bf-aede-f8d49b7612b2', 'françois.reyes@bot.goaliefinder.local', '$2a$11$BOTd3eed49fa90e1b09f241b12c561298451c6cf81542de50944e', 'François', 'Reyes', '+16996871547', 1, true, true, 'bot_placeholder', NOW() - interval '123 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c9f0d566-4246-4995-8490-85f8c4bf2451', 'a514eb1c-bad4-42bf-aede-f8d49b7612b2', 45.00, 6, 'Versatile keeper, great with distribution and organizing the back line.', 43.5317, -79.6388, 20, 4.8, 56, 45, true, NOW() - interval '93 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('95277a80-167b-4fcf-bddb-8ba3fa6ff450', 'luis.oliveira@bot.goaliefinder.local', '$2a$11$BOTbe63f9b2f01815e32fb8aae00b1e98d3c3717a0b4b4dbaa3c9', 'Luis', 'Oliveira', '+15688683954', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9622f19f-e77f-4fd3-83c1-817926306eb8', '95277a80-167b-4fcf-bddb-8ba3fa6ff450', 30.00, 3, 'Reliable shot-stopper available for weekend and weekday games.', 43.5515, -79.6665, 25, 3.9, 72, 59, true, NOW() - interval '158 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('abb7a216-29b1-456b-815f-8eadc2b9c254', 'arjun.le@bot.goaliefinder.local', '$2a$11$BOT927e44d36a8d006960436205b96e71ca2f012699f4a217daea', 'Arjun', 'Le', '+14865677976', 1, true, true, 'bot_placeholder', NOW() - interval '86 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('389243e6-8b07-4a98-95a3-4854948ded5b', 'abb7a216-29b1-456b-815f-8eadc2b9c254', 20.00, 10, 'University-level goalkeeper looking for extra matches.', 43.6346, -79.698, 15, 4.9, 45, 43, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6fd06d47-7113-4963-8f00-0ae026b8a584', 'mathieu.mendez@bot.goaliefinder.local', '$2a$11$BOTeb10b923e37e05031406c68279b820817bcefc91ccdb58e7c3', 'Mathieu', 'Mendez', '+17975202683', 1, true, true, 'bot_placeholder', NOW() - interval '37 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ed7bb0c9-045c-42ae-8b34-81b012578de8', '6fd06d47-7113-4963-8f00-0ae026b8a584', 50.00, 8, 'Experienced keeper with quick reflexes and strong communication skills.', 43.627, -79.6173, 10, 4.8, 79, 74, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dd4cb8b0-b764-40c0-85f1-d4f0b889fbb4', 'josue.lewis@bot.goaliefinder.local', '$2a$11$BOT3fa3eb8ecf4b09a12c0dc3f2e1c8342a2c03b5a8472c0e0120', 'Josue', 'Lewis', '+18266739510', 1, true, true, 'bot_placeholder', NOW() - interval '155 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('915b34d5-0e5c-42ea-a6aa-306345873c36', 'dd4cb8b0-b764-40c0-85f1-d4f0b889fbb4', 50.00, 4, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.6081, -79.6689, 15, 4.8, 62, 61, true, NOW() - interval '38 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('38cc2b84-3757-4188-8e5a-e68c9d8b4506', 'connor.santos@bot.goaliefinder.local', '$2a$11$BOTd2cd839437e8446fc1d21332fdf1db6dbdf5c71b3935da1404', 'Connor', 'Santos', '+14227958803', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('24a4e61e-d19b-424c-a48c-6651431da1f3', '38cc2b84-3757-4188-8e5a-e68c9d8b4506', 25.00, 8, 'Versatile keeper, great with distribution and organizing the back line.', 43.6066, -79.6302, 30, 4.7, 8, 2, true, NOW() - interval '65 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('85ffba11-fbe0-469e-83e3-34336f5469ac', 'dylan.clark@bot.goaliefinder.local', '$2a$11$BOTbd44857c082206482a5a621891b84b44f912c8cd198f3a2dd6', 'Dylan', 'Clark', '+19433993765', 1, true, true, 'bot_placeholder', NOW() - interval '103 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8ce499a7-d2d8-4a9c-8926-4e414bd56bcf', '85ffba11-fbe0-469e-83e3-34336f5469ac', 20.00, 5, 'Tall keeper with a long reach. Command the box effectively.', 43.6085, -79.6126, 15, 4.3, 82, 78, true, NOW() - interval '45 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('08f29dd9-eb2e-4cf0-a0ac-6bf48a9b0c8c', 'ravi.ibrahim@bot.goaliefinder.local', '$2a$11$BOT6b9a0f0b9351ae4c82d7b106724c9ce0e519bf572f24e33119', 'Ravi', 'Ibrahim', '+18436986549', 1, true, true, 'bot_placeholder', NOW() - interval '175 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0d20bd62-5d10-4b32-bc6b-92f639c45d5e', '08f29dd9-eb2e-4cf0-a0ac-6bf48a9b0c8c', 20.00, 11, 'University-level goalkeeper looking for extra matches.', 43.5922, -79.7073, 25, 4.2, 28, 21, true, NOW() - interval '64 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('718ebaf9-3669-4642-ad83-fd468ecc8156', 'thomas.clark@bot.goaliefinder.local', '$2a$11$BOT6eb168e9636dd6d4ea037c8ffac4cf14cbe4d4a9711c7c61af', 'Thomas', 'Clark', '+13269096711', 1, true, true, 'bot_placeholder', NOW() - interval '47 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b56898b5-37ab-43cc-956f-8b662783ed2b', '718ebaf9-3669-4642-ad83-fd468ecc8156', 30.00, 5, 'Former academy goalkeeper, now playing recreational leagues.', 43.5515, -79.6955, 15, 4.8, 45, 40, true, NOW() - interval '3 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4e7b9dab-e92e-4570-978e-abed8fb24034', 'leo.green@bot.goaliefinder.local', '$2a$11$BOT30b8f75ce5f7790fd442ceecba61444bcddefe2e2a3d7c5bf7', 'Leo', 'Green', '+15316794623', 1, true, true, 'bot_placeholder', NOW() - interval '35 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d1f89aac-0baa-4b02-be97-ef676231e927', '4e7b9dab-e92e-4570-978e-abed8fb24034', 25.00, 10, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 43.5613, -79.6974, 20, 4.5, 25, 17, true, NOW() - interval '125 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4a0f63b8-183a-4976-af1d-7c3dcf034418', 'aaron.collins@bot.goaliefinder.local', '$2a$11$BOT35aca1a93a7732bdff5b0c08f6d1c6cdab9f4a965a2d748b7a', 'Aaron', 'Collins', '+16467771626', 1, true, true, 'bot_placeholder', NOW() - interval '14 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cee84759-a301-40c6-98e8-77f3ed2b89f8', '4a0f63b8-183a-4976-af1d-7c3dcf034418', 25.00, 6, 'University-level goalkeeper looking for extra matches.', 43.5575, -79.6879, 15, 4.8, 81, 65, true, NOW() - interval '58 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7dcb37cf-821f-4ef8-a469-6756f31dafae', 'lucas.hill@bot.goaliefinder.local', '$2a$11$BOT4c8f60f3d1d9a4035c496bcf885649dc082d4ffbcb6da10871', 'Lucas', 'Hill', '+12425648879', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e93d8fea-ef1c-4576-bde4-20c553d3ee16', '7dcb37cf-821f-4ef8-a469-6756f31dafae', 15.00, 6, 'Weekend warrior goalkeeper. Love the beautiful game!', 43.542, -79.6336, 20, 4.5, 79, 79, true, NOW() - interval '141 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('08582bbe-e4c6-4c4f-9e22-82ca579bee79', 'jae.chukwu@bot.goaliefinder.local', '$2a$11$BOTbafcb804b0f55057f70de2a4d1d7c9b3767f5fd202c7ea0d81', 'Jae', 'Chukwu', '+15873660100', 1, true, true, 'bot_placeholder', NOW() - interval '35 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3cc93efa-6bc1-4e89-b783-57b43081448c', '08582bbe-e4c6-4c4f-9e22-82ca579bee79', 45.00, 11, 'Former academy goalkeeper, now playing recreational leagues.', 43.6449, -79.7238, 10, 4.2, 65, 54, true, NOW() - interval '93 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f209e1c8-7850-4289-8fd4-f4d0586c66e1', 'yousef.gagné@bot.goaliefinder.local', '$2a$11$BOT0c57447255a300c4ef0fd495374466ab1c962375822e909b95', 'Yousef', 'Gagné', '+19243498892', 1, true, true, 'bot_placeholder', NOW() - interval '146 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('646e73d9-c2f1-433f-be03-7e07beef2010', 'f209e1c8-7850-4289-8fd4-f4d0586c66e1', 30.00, 3, 'Strong penalty saver. Calm and focused under pressure.', 43.597, -79.6676, 15, 3.5, 27, 15, true, NOW() - interval '92 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('61818566-22fb-4686-9c14-df7dfbdc8514', 'rafael.campbell@bot.goaliefinder.local', '$2a$11$BOTb9f7c51180151b447b93ea723eeca848bf96e778d9f2451e8f', 'Rafael', 'Campbell', '+12401084207', 1, true, true, 'bot_placeholder', NOW() - interval '83 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fdfe597a-4fb6-4964-aef7-59a67371c30f', '61818566-22fb-4686-9c14-df7dfbdc8514', 20.00, 3, 'Technical goalkeeper who loves playing out from the back.', 43.6334, -79.5924, 15, 3.8, 6, 0, true, NOW() - interval '137 days', NOW());
-- === Brampton (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0e2d62b6-bc1f-4730-ab12-211c6d2f9879', 'liam.anderson@bot.goaliefinder.local', '$2a$11$BOTb2a58acac8a799f65389d3ff022bfd60d9c5ec7d5b756f0b68', 'Liam', 'Anderson', '+17162467275', 1, true, true, 'bot_placeholder', NOW() - interval '126 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2476d55c-df2d-4aef-a2f0-ccfd091bf08e', '0e2d62b6-bc1f-4730-ab12-211c6d2f9879', 30.00, 1, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.6921, -79.701, 30, 3.7, 47, 43, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a7a228f0-d246-4c65-8a48-f91fced71c8c', 'antoine.moore@bot.goaliefinder.local', '$2a$11$BOT2432a631351640db35b3ab133b946afc5763313e87bd5806fa', 'Antoine', 'Moore', '+12714577947', 1, true, true, 'bot_placeholder', NOW() - interval '100 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5eb0c480-94b8-4353-93f6-0e32188bf3b1', 'a7a228f0-d246-4c65-8a48-f91fced71c8c', 50.00, 15, 'Provincial-level experience. Strong with high balls and one-on-ones.', 43.7683, -79.8001, 15, 3.9, 32, 22, true, NOW() - interval '74 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9a9f612d-b09d-46a8-97d4-2fd4133c854e', 'patrick.wilson@bot.goaliefinder.local', '$2a$11$BOT92fb9daf22e62efe031ce4d172638e0e88b87c2787393317a1', 'Patrick', 'Wilson', '+13704055387', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c44904a1-c4f2-448b-8ef8-0e6b9b353919', '9a9f612d-b09d-46a8-97d4-2fd4133c854e', 15.00, 12, 'Reliable shot-stopper available for weekend and weekday games.', 43.7376, -79.7522, 20, 4.6, 54, 54, true, NOW() - interval '121 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aced144d-a03d-44a4-859a-317ce3fa410b', 'connor.thompson@bot.goaliefinder.local', '$2a$11$BOT6aee5d2f0a2dbc2f6851de70891e92ca062cf5ad282bc279e0', 'Connor', 'Thompson', '+15756008216', 1, true, true, 'bot_placeholder', NOW() - interval '62 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('edc91ed4-e3fd-40ae-ba3a-95391282182e', 'aced144d-a03d-44a4-859a-317ce3fa410b', 20.00, 9, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.7224, -79.8007, 15, 3.7, 78, 77, true, NOW() - interval '71 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('12eeac9e-c5f3-42f3-84e4-529e221011d1', 'andrew.gagné@bot.goaliefinder.local', '$2a$11$BOT1e037b887799e62b51db0a38c7ea2fb63e030161bfd33b3c77', 'Andrew', 'Gagné', '+17158097497', 1, true, true, 'bot_placeholder', NOW() - interval '90 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7a474721-ca4e-4c1b-b246-49e73c7959bc', '12eeac9e-c5f3-42f3-84e4-529e221011d1', 40.00, 4, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.7574, -79.7196, 15, 4.9, 1, 0, true, NOW() - interval '141 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f50b145d-caa1-4d36-9f11-527109390c2d', 'nicolas.hill@bot.goaliefinder.local', '$2a$11$BOTc376f09a4caf7ab8af372d7a2837e3da54bf0ed6faf68ecceb', 'Nicolas', 'Hill', '+13364615577', 1, true, true, 'bot_placeholder', NOW() - interval '135 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('eab90ae5-6fd6-4518-a41e-5cc3a2b84e9f', 'f50b145d-caa1-4d36-9f11-527109390c2d', 20.00, 9, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.6881, -79.8189, 15, 4.8, 67, 53, true, NOW() - interval '102 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9fd3398c-21b0-4fd1-aaf5-0e9ab851baca', 'lucas.wang@bot.goaliefinder.local', '$2a$11$BOT71cfda8933da344231a1c042ac1dd63e33743291cbd1fb5df2', 'Lucas', 'Wang', '+13979291964', 1, true, true, 'bot_placeholder', NOW() - interval '59 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4bfc4c60-d668-49ea-86d5-0882e903b0a9', '9fd3398c-21b0-4fd1-aaf5-0e9ab851baca', 45.00, 8, 'Technical goalkeeper who loves playing out from the back.', 43.7707, -79.7582, 15, 3.8, 82, 66, true, NOW() - interval '176 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('491d8638-b4bb-4a05-8f24-e66fb32821e8', 'rémi.tremblay@bot.goaliefinder.local', '$2a$11$BOT85bdfc2653245088f5032ace98172b27fc620e0f49d0faeeb0', 'Rémi', 'Tremblay', '+12823114862', 1, true, true, 'bot_placeholder', NOW() - interval '8 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fdd825d4-9149-401c-847d-75a81d32e089', '491d8638-b4bb-4a05-8f24-e66fb32821e8', 45.00, 1, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.7513, -79.7087, 25, 4.0, 58, 40, true, NOW() - interval '73 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0603c547-b6cb-48e9-88f7-398fb1c5a7d6', 'justin.murphy@bot.goaliefinder.local', '$2a$11$BOT83ccc8da73a69b749a021b129fb15f4ad2cd7c3afeac4a572d', 'Justin', 'Murphy', '+18106757390', 1, true, true, 'bot_placeholder', NOW() - interval '98 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7b0d531a-8769-40da-98a5-90c7156f70c0', '0603c547-b6cb-48e9-88f7-398fb1c5a7d6', 45.00, 12, 'Reliable shot-stopper available for weekend and weekday games.', 43.7434, -79.6953, 10, 3.8, 55, 51, true, NOW() - interval '62 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('85ca5eb3-dcad-4d93-b6c1-528a28459998', 'jorge.robinson@bot.goaliefinder.local', '$2a$11$BOT19470d9dfef8ac2f5dbf1efd052b1b73a304f3ffb2ef862660', 'Jorge', 'Robinson', '+18128215407', 1, true, true, 'bot_placeholder', NOW() - interval '38 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ebb698bc-cb45-484d-b09d-23df84effdad', '85ca5eb3-dcad-4d93-b6c1-528a28459998', 45.00, 6, 'Versatile keeper, great with distribution and organizing the back line.', 43.7028, -79.8056, 25, 4.0, 49, 32, true, NOW() - interval '21 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('99fab46b-7933-446c-b048-dc45ca7c83a4', 'thomas.gagnon@bot.goaliefinder.local', '$2a$11$BOT5dfe83dd67cdfad1ac0b05228b0c5a048e6a865a1841a4a050', 'Thomas', 'Gagnon', '+13208954873', 1, true, true, 'bot_placeholder', NOW() - interval '28 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('81d7f515-c895-4d88-b416-31dd73cee2ff', '99fab46b-7933-446c-b048-dc45ca7c83a4', 30.00, 6, 'Available for last-minute bookings. Always match-ready.', 43.727, -79.819, 20, 3.9, 43, 23, true, NOW() - interval '103 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5edb7080-309e-44e6-b0c5-12dde7fe6c37', 'jayden.stewart@bot.goaliefinder.local', '$2a$11$BOTe6e3ac7b12d20a354ef5b8af20bdc933b8f3ad89a89f85787f', 'Jayden', 'Stewart', '+12743687417', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ecf3d519-f82b-4ab1-b553-672b4422d0f1', '5edb7080-309e-44e6-b0c5-12dde7fe6c37', 15.00, 3, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.6878, -79.7259, 20, 4.6, 34, 15, true, NOW() - interval '72 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('40b30170-e715-441d-86c7-ce02f5cb3e1b', 'antonio.patel@bot.goaliefinder.local', '$2a$11$BOT9242e6c1e908a9290e72a913570d166c63aa3f7362393df186', 'Antonio', 'Patel', '+19146571970', 1, true, true, 'bot_placeholder', NOW() - interval '114 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0306e3b2-2b7e-486a-9b49-8fb0a3416faa', '40b30170-e715-441d-86c7-ce02f5cb3e1b', 30.00, 1, 'Retired semi-pro goalkeeper. Still got it!', 43.7373, -79.7219, 15, 4.2, 82, 64, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3d1f14f5-ce12-46ba-ad80-d063ea49f727', 'hiroshi.ramirez@bot.goaliefinder.local', '$2a$11$BOT85eab7fb9cfe38478078ad1e39d3766ea85ad728e8ef47229b', 'Hiroshi', 'Ramirez', '+18896902968', 1, true, true, 'bot_placeholder', NOW() - interval '55 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('40cc0153-1501-458e-8c11-c49bbec76d05', '3d1f14f5-ce12-46ba-ad80-d063ea49f727', 20.00, 9, 'Experienced keeper with quick reflexes and strong communication skills.', 43.708, -79.8158, 15, 4.0, 77, 59, true, NOW() - interval '56 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a7d2e414-da6a-4659-a3b8-7ae963a8afc3', 'julien.morin@bot.goaliefinder.local', '$2a$11$BOTe08b673d7c6dc1b5c8f1ff32f38262d5e8db5acf1b1bbbe518', 'Julien', 'Morin', '+14915728838', 1, true, true, 'bot_placeholder', NOW() - interval '124 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('def27a68-86ce-4c93-afa8-521e9d7f5543', 'a7d2e414-da6a-4659-a3b8-7ae963a8afc3', 35.00, 3, 'University-level goalkeeper looking for extra matches.', 43.6766, -79.7811, 20, 4.8, 45, 31, true, NOW() - interval '174 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('04c84e36-0b82-41a4-9919-2e88cf761ea9', 'kyle.okafor@bot.goaliefinder.local', '$2a$11$BOT1d215e77f5fa8158da3bcf3247d489bb608fde3c6d314da0cb', 'Kyle', 'Okafor', '+14944694785', 1, true, true, 'bot_placeholder', NOW() - interval '112 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('dfdf03ad-8c5f-439b-9ed6-e130d5f3dd02', '04c84e36-0b82-41a4-9919-2e88cf761ea9', 30.00, 7, 'New to the city and looking to play as much as possible.', 43.7712, -79.7205, 20, 4.1, 26, 26, true, NOW() - interval '165 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ce10485c-1610-46b8-98aa-5d836dbd82e3', 'brian.gagnon@bot.goaliefinder.local', '$2a$11$BOT97a46fb18a6da8d03c1a77a37587fa37eec536a45f2fefa637', 'Brian', 'Gagnon', '+15192737464', 1, true, true, 'bot_placeholder', NOW() - interval '119 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8b2f50ea-6e97-4aaf-9d7f-0c3c66d0bcbc', 'ce10485c-1610-46b8-98aa-5d836dbd82e3', 25.00, 4, 'Played keeper since I was 12. Quick feet and safe hands.', 43.7775, -79.8317, 15, 4.0, 2, 0, true, NOW() - interval '67 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('21b1b337-d2d8-418e-a3b0-3cb57ab27e6c', 'pierre.young@bot.goaliefinder.local', '$2a$11$BOT4122f2f374624f438d1936133658f91b15fc7a59692dafa823', 'Pierre', 'Young', '+15007729900', 1, true, true, 'bot_placeholder', NOW() - interval '44 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('03926274-ca92-4440-9125-3e5ff0a69be9', '21b1b337-d2d8-418e-a3b0-3cb57ab27e6c', 35.00, 11, 'Played keeper since I was 12. Quick feet and safe hands.', 43.712, -79.7523, 20, 4.7, 74, 56, true, NOW() - interval '97 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1518102b-afa1-4d76-a14d-34c647c6e319', 'jae.rodriguez@bot.goaliefinder.local', '$2a$11$BOT9d5b3e0c89886a3cfbd161f2a73aec2141cdbc0f81f6b1a6d7', 'Jae', 'Rodriguez', '+13882652369', 1, true, true, 'bot_placeholder', NOW() - interval '62 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a0527beb-7ece-47d5-abdb-7453bb464f24', '1518102b-afa1-4d76-a14d-34c647c6e319', 50.00, 7, 'Athletic shot-stopper with years of competitive experience.', 43.7327, -79.8404, 20, 3.6, 70, 69, true, NOW() - interval '116 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8af89204-6e8d-42cb-95a5-617d6a49043f', 'alejandro.hassan@bot.goaliefinder.local', '$2a$11$BOTdba67d3484784e28bb88a8bcc97e1457327c24092d158b48c8', 'Alejandro', 'Hassan', '+15008786456', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('558f7113-ceb9-4f97-b81b-6a74193d8562', '8af89204-6e8d-42cb-95a5-617d6a49043f', 50.00, 7, 'Strong penalty saver. Calm and focused under pressure.', 43.698, -79.7787, 30, 4.6, 82, 70, true, NOW() - interval '131 days', NOW());
-- === Hamilton (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('564eb225-82c0-4383-b3d7-b9a5c90d861b', 'rémi.harris@bot.goaliefinder.local', '$2a$11$BOT9137e88f2c3385a5635b358ca7b7b7c83200a8474ab54673eb', 'Rémi', 'Harris', '+19304219445', 1, true, true, 'bot_placeholder', NOW() - interval '38 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fe51a559-9d21-4b48-883c-2e1436eef097', '564eb225-82c0-4383-b3d7-b9a5c90d861b', 25.00, 7, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.2769, -79.9164, 30, 4.9, 29, 22, true, NOW() - interval '116 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ff80175e-c73b-4449-90f3-9e138aeea6f7', 'kenji.reyes@bot.goaliefinder.local', '$2a$11$BOT3b6babf8a9218ec8c9f9c16527024d526835c6f79947446fb3', 'Kenji', 'Reyes', '+14028041221', 1, true, true, 'bot_placeholder', NOW() - interval '116 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('57b7f9bd-e9c8-4e4c-aad7-005161d167a8', 'ff80175e-c73b-4449-90f3-9e138aeea6f7', 45.00, 11, 'Reliable shot-stopper available for weekend and weekday games.', 43.2386, -79.8283, 25, 4.1, 6, 1, true, NOW() - interval '18 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7a750f57-13d8-4104-bd20-4eee36667ab1', 'shane.ahmed@bot.goaliefinder.local', '$2a$11$BOT5e8a285f1d7e7170c32fd263c9440ae55518fa23d83490e054', 'Shane', 'Ahmed', '+17203379834', 1, true, true, 'bot_placeholder', NOW() - interval '60 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a2e05e47-6574-4196-8c3f-a1127fa53973', '7a750f57-13d8-4104-bd20-4eee36667ab1', 30.00, 14, 'Strong penalty saver. Calm and focused under pressure.', 43.2618, -79.8992, 10, 4.1, 16, 1, true, NOW() - interval '133 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('062d28bc-1502-4e98-9ecb-148cc2a1f56d', 'lucas.white@bot.goaliefinder.local', '$2a$11$BOT32c29a205f2bf48b31a08a2281e26a4313e4928dfa01760be2', 'Lucas', 'White', '+18343676251', 1, true, true, 'bot_placeholder', NOW() - interval '167 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a0de8b22-b4b7-42e1-9039-f21bc2f171a3', '062d28bc-1502-4e98-9ecb-148cc2a1f56d', 45.00, 15, 'Retired semi-pro goalkeeper. Still got it!', 43.2796, -79.8136, 20, 3.7, 21, 17, true, NOW() - interval '56 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f2615bb9-7807-42d3-827e-f5d06d1fb85b', 'vikram.vargas@bot.goaliefinder.local', '$2a$11$BOT6534408ae36fc3d4ed2834ac966bc1a3d5af95d1b79387fe20', 'Vikram', 'Vargas', '+17941219349', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c175476c-d0d2-47fd-9aa1-3d3d22ffec38', 'f2615bb9-7807-42d3-827e-f5d06d1fb85b', 50.00, 1, 'Strong penalty saver. Calm and focused under pressure.', 43.2637, -79.8136, 15, 4.4, 21, 6, true, NOW() - interval '145 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('755018d9-1506-46ed-a7ae-a63d3f79825c', 'connor.park@bot.goaliefinder.local', '$2a$11$BOTd656286b693a71d27f3280c30a0a51b5ba8af286615fdc8923', 'Connor', 'Park', '+14351221727', 1, true, true, 'bot_placeholder', NOW() - interval '158 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9d843d1f-d7af-4c75-b21f-3201cffc92ad', '755018d9-1506-46ed-a7ae-a63d3f79825c', 25.00, 10, 'Solid keeper with a positive attitude. Always on time.', 43.2024, -79.8182, 20, 4.7, 63, 51, true, NOW() - interval '123 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8682c172-b830-4d53-90f1-027638cf6db0', 'sebastian.williams@bot.goaliefinder.local', '$2a$11$BOTfe241e77c4d62967b7d342dbb8c30dedc9f803c4eac81e153a', 'Sebastian', 'Williams', '+14011301581', 1, true, true, 'bot_placeholder', NOW() - interval '110 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8ea4f22a-5d17-4580-a29c-9c6af3bd9f8e', '8682c172-b830-4d53-90f1-027638cf6db0', 35.00, 4, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.2049, -79.8744, 15, 4.6, 47, 38, true, NOW() - interval '64 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('71d2ba13-0691-45fc-aaff-f9f141e5d9fe', 'jae.moore@bot.goaliefinder.local', '$2a$11$BOTe3534f2f59c2eda2a6b358f62b8432ce732399021b4d1a3f2b', 'Jae', 'Moore', '+15383865754', 1, true, true, 'bot_placeholder', NOW() - interval '154 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f3674030-8f74-4f0e-8903-f614ff9ee4f6', '71d2ba13-0691-45fc-aaff-f9f141e5d9fe', 45.00, 12, 'Strong penalty saver. Calm and focused under pressure.', 43.3079, -79.8959, 10, 4.5, 64, 56, true, NOW() - interval '164 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('60121cc9-1239-4310-a282-21159de4fbfd', 'simon.singh@bot.goaliefinder.local', '$2a$11$BOTa15dc8e1d0b67d77c60ca5c718f205c11a2a390fbab399e7b0', 'Simon', 'Singh', '+19421959716', 1, true, true, 'bot_placeholder', NOW() - interval '35 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('77ff6b5d-7f5e-45c7-9591-ab382d120f8e', '60121cc9-1239-4310-a282-21159de4fbfd', 25.00, 2, 'Reliable shot-stopper available for weekend and weekday games.', 43.199, -79.8759, 25, 4.4, 7, 0, true, NOW() - interval '35 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('38611f5c-2b70-4a98-8463-4cae4e52f047', 'justin.walker@bot.goaliefinder.local', '$2a$11$BOT3b8e3bb00375d90807a5933e9380a7a9b88ae5e85ca006d790', 'Justin', 'Walker', '+17627421478', 1, true, true, 'bot_placeholder', NOW() - interval '177 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('63fa0bc4-e271-418a-ab24-ac9485ae4caf', '38611f5c-2b70-4a98-8463-4cae4e52f047', 20.00, 13, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 43.2359, -79.8397, 15, 3.5, 35, 29, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f82bcd89-ee5c-4746-9a42-5c1658edd50c', 'travis.carter@bot.goaliefinder.local', '$2a$11$BOT0cf9b20fc080d48f87eafd4a3bcb7304dd04694838ec468fb6', 'Travis', 'Carter', '+17742302623', 1, true, true, 'bot_placeholder', NOW() - interval '15 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f215719b-b0a7-4275-a49f-51047eafb5ea', 'f82bcd89-ee5c-4746-9a42-5c1658edd50c', 35.00, 11, 'Calm under pressure. Played competitive soccer for 8 years.', 43.2333, -79.9306, 10, 4.9, 36, 28, true, NOW() - interval '26 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('82bcff96-2800-49d0-9a44-82a692f7bf06', 'emilio.cruz@bot.goaliefinder.local', '$2a$11$BOTe6c6c136db812c21eb22555ba24c7230b04b196f826401485f', 'Emilio', 'Cruz', '+12702757407', 1, true, true, 'bot_placeholder', NOW() - interval '129 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('be554dbb-624d-4d87-8148-aa7ec06cc75b', '82bcff96-2800-49d0-9a44-82a692f7bf06', 30.00, 9, 'Strong penalty saver. Calm and focused under pressure.', 43.3087, -79.7942, 15, 4.7, 80, 79, true, NOW() - interval '9 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fd57470e-5a34-4471-ae0d-0b9ccc918112', 'leo.perez@bot.goaliefinder.local', '$2a$11$BOT8abcc046ebd88954572c28a204801375268eb7d2a804ce03eb', 'Leo', 'Perez', '+15029923911', 1, true, true, 'bot_placeholder', NOW() - interval '151 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6531b7ef-ded2-4932-aece-531d84c7763b', 'fd57470e-5a34-4471-ae0d-0b9ccc918112', 25.00, 5, 'Calm under pressure. Played competitive soccer for 8 years.', 43.1977, -79.8258, 30, 3.8, 81, 75, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('436970ad-d3b3-46b2-b681-fd74508b2815', 'guillaume.silva@bot.goaliefinder.local', '$2a$11$BOTfc53df213eb9f579a58a559a738576522867c53e96240e7919', 'Guillaume', 'Silva', '+18619263916', 1, true, true, 'bot_placeholder', NOW() - interval '80 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a43569a1-ef82-462a-aa8a-41c0884938bf', '436970ad-d3b3-46b2-b681-fd74508b2815', 20.00, 12, 'Tall keeper with a long reach. Command the box effectively.', 43.2211, -79.8123, 20, 3.7, 51, 51, true, NOW() - interval '155 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7700c342-375d-4e9d-9d98-95edf0cbb1a3', 'liam.parker@bot.goaliefinder.local', '$2a$11$BOTf48e5c227c7cfc734b8e4b6cd60f86800b21e3ba144832108e', 'Liam', 'Parker', '+16637785657', 1, true, true, 'bot_placeholder', NOW() - interval '102 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2ab17e13-a410-4a35-835c-fed497f062d8', '7700c342-375d-4e9d-9d98-95edf0cbb1a3', 50.00, 7, 'Athletic shot-stopper with years of competitive experience.', 43.3071, -79.936, 15, 3.6, 85, 66, true, NOW() - interval '16 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7e647057-7b21-47ba-8237-3c8b26f9ff68', 'connor.castillo@bot.goaliefinder.local', '$2a$11$BOT4c535f36a63a42e672208d594211662e487f7c19f19f953b63', 'Connor', 'Castillo', '+17587412527', 1, true, true, 'bot_placeholder', NOW() - interval '174 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('43daa33a-d0ac-4d9b-ba98-ef8ddc01f2ed', '7e647057-7b21-47ba-8237-3c8b26f9ff68', 20.00, 11, 'University-level goalkeeper looking for extra matches.', 43.2222, -79.7942, 15, 4.5, 18, 9, true, NOW() - interval '77 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c5d6ba32-d4b5-44de-9681-994f1ecac5b3', 'ryan.ahmed@bot.goaliefinder.local', '$2a$11$BOT805ad4aa2791246c6959d9c5c4dd6142533844633bece6b3da', 'Ryan', 'Ahmed', '+14538806839', 1, true, true, 'bot_placeholder', NOW() - interval '165 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3bc76ca7-80ba-487e-843c-90235197fe87', 'c5d6ba32-d4b5-44de-9681-994f1ecac5b3', 25.00, 3, 'Calm under pressure. Played competitive soccer for 8 years.', 43.2743, -79.9249, 20, 3.7, 74, 72, true, NOW() - interval '149 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2f727948-db66-4e7c-b91d-2fa3b9d8c133', 'aaron.moore@bot.goaliefinder.local', '$2a$11$BOT82d578fff727ba2adf5b8c4f0e84e54beb47c0cbc16d708e43', 'Aaron', 'Moore', '+13777153509', 1, true, true, 'bot_placeholder', NOW() - interval '147 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bc5e6f60-28b1-4663-a961-cba0cf3257e5', '2f727948-db66-4e7c-b91d-2fa3b9d8c133', 50.00, 5, 'University-level goalkeeper looking for extra matches.', 43.2869, -79.889, 15, 3.7, 51, 35, true, NOW() - interval '69 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('30702812-a3b1-44e8-b30b-b6105e1ed3a6', 'dylan.murphy@bot.goaliefinder.local', '$2a$11$BOTb0e7fd3a478f7d9b0469c7a2ad4535c884ac60aed53174e45f', 'Dylan', 'Murphy', '+17632027733', 1, true, true, 'bot_placeholder', NOW() - interval '80 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('48bf1caf-7ee0-4957-b6bb-82b9990b03a9', '30702812-a3b1-44e8-b30b-b6105e1ed3a6', 30.00, 2, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.2753, -79.806, 10, 4.6, 9, 1, true, NOW() - interval '161 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('db5a3d8e-9b09-409e-9ad6-7bac64e6286b', 'adrian.silva@bot.goaliefinder.local', '$2a$11$BOT0e612bbe564bc388b6be91672d82f367a07ce27da7a71051ee', 'Adrian', 'Silva', '+12001836330', 1, true, true, 'bot_placeholder', NOW() - interval '115 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('dbbec7f6-e32b-4a18-83dd-c0eb16733299', 'db5a3d8e-9b09-409e-9ad6-7bac64e6286b', 40.00, 7, 'Experienced keeper with quick reflexes and strong communication skills.', 43.2757, -79.8085, 30, 3.6, 52, 47, true, NOW() - interval '111 days', NOW());
-- === Ottawa (22 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d9043b67-e270-4fd1-83ac-aba1637ab31d', 'miguel.fortin@bot.goaliefinder.local', '$2a$11$BOTbe55488d75f8796b9c6e7958110bba2437096e6e18ede6acaf', 'Miguel', 'Fortin', '+15283480020', 1, true, true, 'bot_placeholder', NOW() - interval '41 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c6f20267-f804-4b5b-b0db-267393da7a98', 'd9043b67-e270-4fd1-83ac-aba1637ab31d', 25.00, 9, 'Experienced keeper with quick reflexes and strong communication skills.', 45.4153, -75.6436, 10, 3.6, 11, 7, true, NOW() - interval '58 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2d6f8c2a-3c55-4d07-ae07-0e3c5651b54c', 'gabriel.flores@bot.goaliefinder.local', '$2a$11$BOT7de8d1cf214d479316a0052319023061212a4d1a238dd8fae3', 'Gabriel', 'Flores', '+13295601107', 1, true, true, 'bot_placeholder', NOW() - interval '168 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ccfd0d1e-83d6-47e7-ab37-634c7274769c', '2d6f8c2a-3c55-4d07-ae07-0e3c5651b54c', 25.00, 4, 'Calm under pressure. Played competitive soccer for 8 years.', 45.4561, -75.6587, 10, 4.8, 77, 73, true, NOW() - interval '150 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3f95b576-270c-4b6e-9d02-23a22f1160a6', 'aaron.fortin@bot.goaliefinder.local', '$2a$11$BOTc7004f870f5a8e3e8c50f517bcd588d026ec1a75242c99de9b', 'Aaron', 'Fortin', '+17181805659', 1, true, true, 'bot_placeholder', NOW() - interval '134 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('895cb7ef-5e58-442f-bd13-e9a570a8dfee', '3f95b576-270c-4b6e-9d02-23a22f1160a6', 35.00, 7, 'Strong penalty saver. Calm and focused under pressure.', 45.4717, -75.6515, 15, 4.8, 71, 52, true, NOW() - interval '101 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('37d4947a-392c-42dd-bc79-c90c06bc235b', 'diego.thompson@bot.goaliefinder.local', '$2a$11$BOTb742eab8edb120d84142a7e1b05901246182b314400bb5b028', 'Diego', 'Thompson', '+19139980599', 1, true, true, 'bot_placeholder', NOW() - interval '161 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f87ca784-e9e0-4855-b9ae-583f66b44b41', '37d4947a-392c-42dd-bc79-c90c06bc235b', 25.00, 9, 'Available for last-minute bookings. Always match-ready.', 45.4729, -75.6258, 15, 4.5, 54, 49, true, NOW() - interval '73 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dcb26276-83b7-43ea-a505-ba89d7150d9e', 'hector.smith@bot.goaliefinder.local', '$2a$11$BOTf8214fdcc13a48780ff31d325aa0e5d42eecf9bba4504d65b2', 'Hector', 'Smith', '+15519246684', 1, true, true, 'bot_placeholder', NOW() - interval '54 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f7031346-a708-4893-b1fa-06d28c68cfdb', 'dcb26276-83b7-43ea-a505-ba89d7150d9e', 15.00, 10, 'Weekend warrior goalkeeper. Love the beautiful game!', 45.4529, -75.7485, 30, 4.0, 44, 30, true, NOW() - interval '120 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('56a1db87-8401-45ee-a59b-723694045a30', 'jack.thompson@bot.goaliefinder.local', '$2a$11$BOT7ba643a1a5ef4a626dca9e3aeaf50ffddac3a67d5d647cb699', 'Jack', 'Thompson', '+12639227265', 1, true, true, 'bot_placeholder', NOW() - interval '108 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('87ce0f1c-1e55-42fa-8a0e-249ff4f60895', '56a1db87-8401-45ee-a59b-723694045a30', 20.00, 14, 'Reliable shot-stopper available for weekend and weekday games.', 45.4788, -75.7704, 20, 4.9, 66, 66, true, NOW() - interval '9 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b7471a50-c0ae-4080-a801-66c8c818ff86', 'adrian.williams@bot.goaliefinder.local', '$2a$11$BOTbdefa1770a9264ec331390cf1f59b2c5966d7af05f5aff2b82', 'Adrian', 'Williams', '+18595808016', 1, true, true, 'bot_placeholder', NOW() - interval '67 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('230961ea-76d4-4d80-b5ac-0775116c8d3f', 'b7471a50-c0ae-4080-a801-66c8c818ff86', 45.00, 4, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 45.3669, -75.6306, 10, 4.5, 62, 55, true, NOW() - interval '56 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9bb4ff91-aa5d-43ce-a18a-7b9276539221', 'derek.flores@bot.goaliefinder.local', '$2a$11$BOT03dad9d6460eff63eb1afeb36b2d4d052d8eac4ef9ba2d843c', 'Derek', 'Flores', '+16038981288', 1, true, true, 'bot_placeholder', NOW() - interval '19 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('998c1b77-7bc5-434e-86af-1748b33c6b67', '9bb4ff91-aa5d-43ce-a18a-7b9276539221', 25.00, 7, 'Retired semi-pro goalkeeper. Still got it!', 45.4121, -75.6314, 20, 3.6, 4, 0, true, NOW() - interval '2 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('39b20524-fcd6-4b61-b29a-8f7ef4aa0b91', 'paolo.castillo@bot.goaliefinder.local', '$2a$11$BOTd8d20299912565f3c78fd532848c1afd20438f5c17acf2b427', 'Paolo', 'Castillo', '+19586786766', 1, true, true, 'bot_placeholder', NOW() - interval '81 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4e7a7a45-a043-4561-b2bb-2a959bf51d6b', '39b20524-fcd6-4b61-b29a-8f7ef4aa0b91', 30.00, 10, 'Experienced keeper with quick reflexes and strong communication skills.', 45.4103, -75.6214, 25, 3.9, 56, 48, true, NOW() - interval '24 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8545f2b0-2e51-4bb2-b705-7af9a993772c', 'brandon.castillo@bot.goaliefinder.local', '$2a$11$BOTf0982375d01ae0d71076e4b1d1381b7343f470ef123421c741', 'Brandon', 'Castillo', '+18138200423', 1, true, true, 'bot_placeholder', NOW() - interval '85 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('18133472-016f-4d82-b622-7c44e7d1b1cf', '8545f2b0-2e51-4bb2-b705-7af9a993772c', 25.00, 4, 'Athletic shot-stopper with years of competitive experience.', 45.4611, -75.6657, 10, 3.6, 39, 19, true, NOW() - interval '68 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aedfc8cd-165f-4177-8a21-fa474a89a6a0', 'arjun.robinson@bot.goaliefinder.local', '$2a$11$BOTb3dea145e5ea0ab0a6ac4edfdd3157a5619aa0e170ca518e73', 'Arjun', 'Robinson', '+12096843368', 1, true, true, 'bot_placeholder', NOW() - interval '2 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('753d1d1c-7bed-45eb-9560-f99c4dfbfec4', 'aedfc8cd-165f-4177-8a21-fa474a89a6a0', 50.00, 5, 'Former academy goalkeeper, now playing recreational leagues.', 45.4767, -75.6492, 10, 4.4, 21, 13, true, NOW() - interval '9 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ceae4eff-d87c-4ed7-a80b-bf98ef4c887c', 'alexander.robinson@bot.goaliefinder.local', '$2a$11$BOTced01a87d90ad3a0a1737d475974bd97f30dc1903b4ec41a1e', 'Alexander', 'Robinson', '+18922466044', 1, true, true, 'bot_placeholder', NOW() - interval '100 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6908dad0-6683-489b-9ea4-2296dd4ab749', 'ceae4eff-d87c-4ed7-a80b-bf98ef4c887c', 20.00, 15, 'Experienced keeper with quick reflexes and strong communication skills.', 45.4436, -75.747, 15, 4.6, 13, 5, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('49440a3d-9c30-46ec-9fc4-713a2a2cd832', 'david.walker@bot.goaliefinder.local', '$2a$11$BOT53854a02629f0ecfec85f5e94a99f6c3daffbb70d13649e03d', 'David', 'Walker', '+17306563435', 1, true, true, 'bot_placeholder', NOW() - interval '178 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0b44138e-e2f0-4aab-9af5-ed47dc178923', '49440a3d-9c30-46ec-9fc4-713a2a2cd832', 20.00, 13, 'Provincial-level experience. Strong with high balls and one-on-ones.', 45.4432, -75.6483, 25, 4.7, 22, 14, true, NOW() - interval '103 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c21f6d40-8c0e-451f-b50b-c9fc9685db81', 'ryan.phillips@bot.goaliefinder.local', '$2a$11$BOT04431ba3f7a364aac6868342af27e001d489fb1828e5b341ce', 'Ryan', 'Phillips', '+15465549202', 1, true, true, 'bot_placeholder', NOW() - interval '94 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6ff37149-b7d8-4d62-a068-bd31d94caaa8', 'c21f6d40-8c0e-451f-b50b-c9fc9685db81', 30.00, 13, 'Retired semi-pro goalkeeper. Still got it!', 45.3657, -75.6797, 15, 4.9, 47, 38, true, NOW() - interval '115 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('42872c26-1e85-4167-9207-77b346b3a0c5', 'gabriel.gauthier@bot.goaliefinder.local', '$2a$11$BOT02e19230758734db81679dfceb651881aaa5261919f0080a45', 'Gabriel', 'Gauthier', '+15458038064', 1, true, true, 'bot_placeholder', NOW() - interval '134 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('41f877cc-47c6-4b87-b33f-4ce232fa089f', '42872c26-1e85-4167-9207-77b346b3a0c5', 35.00, 10, 'Reliable shot-stopper available for weekend and weekday games.', 45.4064, -75.6526, 10, 3.8, 2, 2, true, NOW() - interval '117 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1ccdd677-b68d-438e-ad15-082395fdcd4c', 'ethan.garcia@bot.goaliefinder.local', '$2a$11$BOT82dde33aa362d8732cb6b7b168214e7380810180c80704df49', 'Ethan', 'Garcia', '+18757425534', 1, true, true, 'bot_placeholder', NOW() - interval '47 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c4b492e8-1dc0-407b-926d-4b2a7c2ebc35', '1ccdd677-b68d-438e-ad15-082395fdcd4c', 25.00, 8, 'Technical goalkeeper who loves playing out from the back.', 45.3744, -75.6633, 10, 4.5, 27, 7, true, NOW() - interval '48 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bee8bc35-8802-4cf1-90ef-3a1d4b8cc22e', 'dylan.mohamed@bot.goaliefinder.local', '$2a$11$BOT47a0a366c52808881a150c06415f7f792d74aebedee0aae50c', 'Dylan', 'Mohamed', '+14194908030', 1, true, true, 'bot_placeholder', NOW() - interval '119 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('827a0858-6eb1-411b-91fc-977ccab3a62a', 'bee8bc35-8802-4cf1-90ef-3a1d4b8cc22e', 45.00, 9, 'University-level goalkeeper looking for extra matches.', 45.4248, -75.7323, 25, 3.6, 51, 37, true, NOW() - interval '121 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c7e5dc8c-70e4-4c08-afcf-bad4f2486e08', 'amir.brown@bot.goaliefinder.local', '$2a$11$BOTcfedf665be682aca5674c1cc90b85b5aa1266a91250dcb1e47', 'Amir', 'Brown', '+14404096602', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('baebed53-b539-4be6-af84-dfdd9ded7b6d', 'c7e5dc8c-70e4-4c08-afcf-bad4f2486e08', 40.00, 10, 'Tall keeper with a long reach. Command the box effectively.', 45.4709, -75.6646, 30, 4.9, 13, 4, true, NOW() - interval '43 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2f4aca6d-bbf2-46a3-8857-ad31d17603ad', 'carlos.ibrahim@bot.goaliefinder.local', '$2a$11$BOT8222a7366b45afb7adea3de1beb088a1e5235e78b99517e654', 'Carlos', 'Ibrahim', '+18302135885', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('df54a62f-6639-4c41-b21e-f7961cb140c3', '2f4aca6d-bbf2-46a3-8857-ad31d17603ad', 25.00, 11, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 45.4392, -75.629, 25, 4.9, 23, 4, true, NOW() - interval '118 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1f7f05b2-ccd6-4deb-90e5-281d97186562', 'samuel.pelletier@bot.goaliefinder.local', '$2a$11$BOT8dcea50131466c9a250f950a6713ceabaf87e5af2da2a187e2', 'Samuel', 'Pelletier', '+18604497921', 1, true, true, 'bot_placeholder', NOW() - interval '16 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cd22da90-a24d-41e9-9631-a8ec98b501b8', '1f7f05b2-ccd6-4deb-90e5-281d97186562', 30.00, 5, 'Available for last-minute bookings. Always match-ready.', 45.4448, -75.6971, 25, 3.6, 21, 1, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fa571c63-53c5-4e6e-9e83-98a027463180', 'lucas.cruz@bot.goaliefinder.local', '$2a$11$BOT1e1faf57549714d153e0682c65e65efa9752458badb808cd6a', 'Lucas', 'Cruz', '+17914720794', 1, true, true, 'bot_placeholder', NOW() - interval '78 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b5de72b0-3d41-42f0-a557-7291248a9fbb', 'fa571c63-53c5-4e6e-9e83-98a027463180', 25.00, 8, 'Reliable shot-stopper available for weekend and weekday games.', 45.4732, -75.673, 15, 3.6, 70, 60, true, NOW() - interval '80 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8aa66a13-dcfa-4498-9420-0551be5b3fff', 'benjamin.rodriguez@bot.goaliefinder.local', '$2a$11$BOTb2f131716fabefc5fbfdf684c334fe7265788db7d98dff95cd', 'Benjamin', 'Rodriguez', '+16233161241', 1, true, true, 'bot_placeholder', NOW() - interval '133 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2e7f8588-c905-426b-b6f8-16b4a043154d', '8aa66a13-dcfa-4498-9420-0551be5b3fff', 30.00, 9, 'Provincial-level experience. Strong with high balls and one-on-ones.', 45.3802, -75.7536, 15, 4.1, 70, 53, true, NOW() - interval '150 days', NOW());
-- === Markham (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c125e28b-74d9-4390-946a-6aa594dd9434', 'hiroshi.campbell@bot.goaliefinder.local', '$2a$11$BOTbd7c16f3b7e7d13014e69e3983a35059344e976d5c03ba71b6', 'Hiroshi', 'Campbell', '+19903796065', 1, true, true, 'bot_placeholder', NOW() - interval '53 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c35067ce-1a9b-401a-b8ef-c6ae720ebdee', 'c125e28b-74d9-4390-946a-6aa594dd9434', 30.00, 1, 'Solid keeper with a positive attitude. Always on time.', 43.8837, -79.2769, 15, 4.7, 66, 46, true, NOW() - interval '81 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3f729d50-12e2-4d32-97eb-1c7870a2fdb1', 'jack.torres@bot.goaliefinder.local', '$2a$11$BOTfba2c5daad3d1886adf79c81405acf0a7fdc480d7f0b03a233', 'Jack', 'Torres', '+17834703968', 1, true, true, 'bot_placeholder', NOW() - interval '145 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ea9027ef-310c-46c4-b81f-824b56c84229', '3f729d50-12e2-4d32-97eb-1c7870a2fdb1', 20.00, 2, 'Strong penalty saver. Calm and focused under pressure.', 43.8393, -79.3267, 20, 3.7, 58, 50, true, NOW() - interval '150 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6e772a8a-7f00-489f-934c-c643073d5bd7', 'sergio.morin@bot.goaliefinder.local', '$2a$11$BOTca870211711f1619baa037f508a1465d48a39b8697dda32bb5', 'Sergio', 'Morin', '+17685968014', 1, true, true, 'bot_placeholder', NOW() - interval '164 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('35a986a0-d2ae-4316-bf6f-1485e93ea4fc', '6e772a8a-7f00-489f-934c-c643073d5bd7', 20.00, 8, 'Experienced keeper with quick reflexes and strong communication skills.', 43.8834, -79.3253, 25, 4.7, 48, 36, true, NOW() - interval '58 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5053d120-f5be-4be3-acc1-bc8605dff380', 'jean.hassan@bot.goaliefinder.local', '$2a$11$BOTd747868b09275235c7de15fdbea1ab5d386774ee11dce8df5f', 'Jean', 'Hassan', '+14424834696', 1, true, true, 'bot_placeholder', NOW() - interval '19 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('87458839-48a2-495e-a42d-d52a2baa076b', '5053d120-f5be-4be3-acc1-bc8605dff380', 35.00, 1, 'Athletic shot-stopper with years of competitive experience.', 43.814, -79.3767, 10, 4.7, 68, 50, true, NOW() - interval '55 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8c58d78c-44bf-49ea-a2b8-5c0a5841e003', 'scott.osei@bot.goaliefinder.local', '$2a$11$BOTf7ad39d4149033d9852419af581876358c2120d158f9751f56', 'Scott', 'Osei', '+15321978633', 1, true, true, 'bot_placeholder', NOW() - interval '130 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('86b70648-1c15-40d7-9cae-7aecf20b13d3', '8c58d78c-44bf-49ea-a2b8-5c0a5841e003', 45.00, 2, 'Calm under pressure. Played competitive soccer for 8 years.', 43.8577, -79.3621, 30, 4.8, 25, 8, true, NOW() - interval '98 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0e8e95c3-bd80-4ade-9040-943e2bd46e89', 'wei.harris@bot.goaliefinder.local', '$2a$11$BOTa44b5d518d22cb40a0662e8b5ec4e57d23e1681d2365bb7f4a', 'Wei', 'Harris', '+19152128859', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('12d8ed85-6f1c-48cc-a8e4-05d697cfd556', '0e8e95c3-bd80-4ade-9040-943e2bd46e89', 30.00, 6, 'University-level goalkeeper looking for extra matches.', 43.8778, -79.2803, 25, 5.0, 84, 64, true, NOW() - interval '138 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('db33d061-728c-46fa-bbbb-817a7057e255', 'vikram.nguyen@bot.goaliefinder.local', '$2a$11$BOT6a14fb00a878a10e06cdbff50f5bee0ebb5e7f2646c18cfe20', 'Vikram', 'Nguyen', '+12858774888', 1, true, true, 'bot_placeholder', NOW() - interval '132 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('21733f6c-a556-492a-819d-3b9b6e6497cb', 'db33d061-728c-46fa-bbbb-817a7057e255', 30.00, 8, 'Retired semi-pro goalkeeper. Still got it!', 43.8259, -79.3708, 20, 3.9, 10, 7, true, NOW() - interval '112 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('27a9de03-2acb-4c14-9952-eb14752c35d3', 'kevin.sato@bot.goaliefinder.local', '$2a$11$BOT6b93b06185fac12255f0f3efb818db2d9959db28bab4e918ea', 'Kevin', 'Sato', '+19042754153', 1, true, true, 'bot_placeholder', NOW() - interval '175 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5c932574-c2e6-4e8e-94dd-5a55f4b58b4b', '27a9de03-2acb-4c14-9952-eb14752c35d3', 30.00, 15, 'Played keeper since I was 12. Quick feet and safe hands.', 43.8332, -79.3888, 15, 3.9, 20, 15, true, NOW() - interval '130 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('984c1b81-439d-48b9-bb2d-7632db06ba63', 'victor.garcia@bot.goaliefinder.local', '$2a$11$BOT0ae591d18937b0c852613b40a40363144e6fc7178c08bae295', 'Victor', 'Garcia', '+17782898262', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('189122af-c342-493f-b7eb-0aef8bf1a42b', '984c1b81-439d-48b9-bb2d-7632db06ba63', 25.00, 12, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.9125, -79.3942, 15, 4.3, 67, 64, true, NOW() - interval '59 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5fb725d3-cdb6-45c3-b377-9c7b7bcfca89', 'paolo.silva@bot.goaliefinder.local', '$2a$11$BOT95037cdc406a16d62d423fcf5449b5ba7f825365a39ee18a1c', 'Paolo', 'Silva', '+13133436848', 1, true, true, 'bot_placeholder', NOW() - interval '24 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('35dad03b-413a-4d6e-9105-a36272fbf835', '5fb725d3-cdb6-45c3-b377-9c7b7bcfca89', 40.00, 9, 'Fast and agile. Best on turf and indoor surfaces.', 43.8511, -79.2804, 15, 4.3, 80, 80, true, NOW() - interval '10 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e7b2d230-3be4-41a1-8a11-c2baed96e990', 'jayden.castillo@bot.goaliefinder.local', '$2a$11$BOTae87d94891c8f4632798330f51e51a3d6a4c849fd1d6e4fcd5', 'Jayden', 'Castillo', '+13485228098', 1, true, true, 'bot_placeholder', NOW() - interval '88 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('24e4ac82-647f-456f-a4f2-85c43242b3d4', 'e7b2d230-3be4-41a1-8a11-c2baed96e990', 35.00, 11, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.8169, -79.3653, 15, 4.5, 72, 60, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1030fd22-78cc-4cfe-83bc-67e3593f49fc', 'travis.collins@bot.goaliefinder.local', '$2a$11$BOTdc86806a42a3daaf83c66973e8a9aeb55d0ca54c80390f9d4d', 'Travis', 'Collins', '+17227302921', 1, true, true, 'bot_placeholder', NOW() - interval '85 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9016f17d-d3c2-485d-ad17-fd193c9ca5e4', '1030fd22-78cc-4cfe-83bc-67e3593f49fc', 20.00, 4, 'Reliable shot-stopper available for weekend and weekday games.', 43.8069, -79.367, 25, 5.0, 10, 0, true, NOW() - interval '77 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a8c44fb7-9ddc-4ba7-8762-aabbc7d3c382', 'matthew.edwards@bot.goaliefinder.local', '$2a$11$BOTf08b621a00cccf870a05f070d55b07fdf78083ca196108b4e6', 'Matthew', 'Edwards', '+18345154778', 1, true, true, 'bot_placeholder', NOW() - interval '19 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7108e43d-67bf-413d-aec1-046b267fecd6', 'a8c44fb7-9ddc-4ba7-8762-aabbc7d3c382', 45.00, 2, 'Technical goalkeeper who loves playing out from the back.', 43.9078, -79.4122, 30, 4.4, 23, 22, true, NOW() - interval '155 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4dbbe3dd-4945-4d7b-95f4-ac7dd535eb16', 'andre.gagné@bot.goaliefinder.local', '$2a$11$BOT3603f46b7722f0b31c5b794d03a28358493f75d54d62ec3afc', 'Andre', 'Gagné', '+18253976455', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1ceb89f0-6295-4850-b081-f88faa9468c1', '4dbbe3dd-4945-4d7b-95f4-ac7dd535eb16', 50.00, 5, 'Calm under pressure. Played competitive soccer for 8 years.', 43.9142, -79.326, 15, 4.5, 38, 21, true, NOW() - interval '110 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('98f69015-17bd-4749-b4a8-e71a66688f70', 'marcus.ibrahim@bot.goaliefinder.local', '$2a$11$BOT699e43e9a46bb5cec99e1b802c4e7898c0c644031ca22d4a48', 'Marcus', 'Ibrahim', '+15345049390', 1, true, true, 'bot_placeholder', NOW() - interval '169 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2854a066-0fe2-4d2e-8f5a-aa9cdaf0b2c3', '98f69015-17bd-4749-b4a8-e71a66688f70', 30.00, 3, 'Versatile keeper, great with distribution and organizing the back line.', 43.8245, -79.264, 15, 4.3, 51, 33, true, NOW() - interval '170 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b65c3f46-6f25-4c36-b5bd-8d061188d54c', 'antoine.sato@bot.goaliefinder.local', '$2a$11$BOT3c3e697cb7b9240fa2c89784d356ac86366cfa85274d7f1f91', 'Antoine', 'Sato', '+13902816974', 1, true, true, 'bot_placeholder', NOW() - interval '167 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b1c9ccc1-8eee-4648-a60b-865eb6fa418b', 'b65c3f46-6f25-4c36-b5bd-8d061188d54c', 15.00, 9, 'Solid keeper with a positive attitude. Always on time.', 43.887, -79.3431, 10, 4.1, 65, 62, true, NOW() - interval '10 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8d0c11f5-53b0-46ea-a3cb-d598b426174f', 'noah.santos@bot.goaliefinder.local', '$2a$11$BOT13180b286ea03f9455914d94e9cb2db3d7bc12857b3809f725', 'Noah', 'Santos', '+18807725744', 1, true, true, 'bot_placeholder', NOW() - interval '119 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('be27b9f7-1a30-47b7-b513-d5160c405d57', '8d0c11f5-53b0-46ea-a3cb-d598b426174f', 35.00, 2, 'Tall keeper with a long reach. Command the box effectively.', 43.8891, -79.3648, 15, 3.9, 18, 9, true, NOW() - interval '64 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bfdb08a8-23b3-4439-b24c-283696b0e974', 'jae.roberts@bot.goaliefinder.local', '$2a$11$BOT00041958ca3fdd007d305bff227545d90cadeb19b1a914d6b1', 'Jae', 'Roberts', '+12494758582', 1, true, true, 'bot_placeholder', NOW() - interval '165 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8e21eab8-bced-4dcf-8e76-d73b65d9e591', 'bfdb08a8-23b3-4439-b24c-283696b0e974', 15.00, 14, 'Athletic shot-stopper with years of competitive experience.', 43.8092, -79.2865, 25, 4.7, 16, 10, true, NOW() - interval '94 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fac9e738-3093-4599-a3f1-c27dc5c44501', 'marcus.chukwu@bot.goaliefinder.local', '$2a$11$BOT3a5c39536d0f3175b4abf2e0a2e65d68b7dee577768c61aeb7', 'Marcus', 'Chukwu', '+14947448617', 1, true, true, 'bot_placeholder', NOW() - interval '117 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('39dcce08-2aab-4941-9b9d-7eaf96aac3e8', 'fac9e738-3093-4599-a3f1-c27dc5c44501', 25.00, 13, 'Solid keeper with a positive attitude. Always on time.', 43.8655, -79.4095, 20, 5.0, 85, 75, true, NOW() - interval '39 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b249dd3b-5ed4-4115-a005-7b8e129cc61e', 'jorge.king@bot.goaliefinder.local', '$2a$11$BOTe4ede511a42ffa152fdd06f0e34e9b2cd3e94f86ca537158f2', 'Jorge', 'King', '+16115552035', 1, true, true, 'bot_placeholder', NOW() - interval '56 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('61addb0b-1a81-40cb-9d2c-5d5bdc2e8755', 'b249dd3b-5ed4-4115-a005-7b8e129cc61e', 15.00, 12, 'Retired semi-pro goalkeeper. Still got it!', 43.8795, -79.384, 25, 4.8, 46, 37, true, NOW() - interval '66 days', NOW());
-- === Vaughan (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('17a11a31-9cfc-469f-b3cc-7d479c4995f9', 'cristian.roberts@bot.goaliefinder.local', '$2a$11$BOT8c1c738fd943d3c4d51ee3b85572a90cb77ed726c69d9dd0d7', 'Cristian', 'Roberts', '+18225801003', 1, true, true, 'bot_placeholder', NOW() - interval '23 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1a047970-e13f-4bc1-a83e-98ea3d5daa29', '17a11a31-9cfc-469f-b3cc-7d479c4995f9', 35.00, 8, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.8651, -79.4929, 25, 4.2, 9, 2, true, NOW() - interval '99 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('450621f0-fc31-4ec0-ada9-03ebb42fa59e', 'sergio.wang@bot.goaliefinder.local', '$2a$11$BOT5467fd06f5abd7b154c73d7ff8baaf8d0ab3cf3e77f9f8f9f5', 'Sergio', 'Wang', '+13346754336', 1, true, true, 'bot_placeholder', NOW() - interval '74 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1f6739d7-d05f-4586-8b4c-8075908039e4', '450621f0-fc31-4ec0-ada9-03ebb42fa59e', 20.00, 8, 'Provincial-level experience. Strong with high balls and one-on-ones.', 43.8382, -79.5659, 20, 3.9, 53, 35, true, NOW() - interval '68 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('46e56a12-4ae5-40b0-ab7e-33f572fa2456', 'jordan.patel@bot.goaliefinder.local', '$2a$11$BOT093ace5e1ba51e54efb8ea4cfb36930e0aaed023e9bce7f538', 'Jordan', 'Patel', '+17598307753', 1, true, true, 'bot_placeholder', NOW() - interval '71 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c7132d92-3103-44f3-a7d4-196a1aa3e36d', '46e56a12-4ae5-40b0-ab7e-33f572fa2456', 20.00, 3, 'Strong penalty saver. Calm and focused under pressure.', 43.7762, -79.4934, 20, 4.3, 18, 13, true, NOW() - interval '98 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('52ac1fbb-e3d2-41b0-82ca-9ae7492d7825', 'jordan.pelletier@bot.goaliefinder.local', '$2a$11$BOT2603a8162a665744df5bd06c9036464bf2f05c66ed845cd296', 'Jordan', 'Pelletier', '+16973633033', 1, true, true, 'bot_placeholder', NOW() - interval '55 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2909ec6e-89fa-4e32-a103-6276060eeaaf', '52ac1fbb-e3d2-41b0-82ca-9ae7492d7825', 25.00, 2, 'Played keeper since I was 12. Quick feet and safe hands.', 43.836, -79.5772, 15, 4.4, 25, 11, true, NOW() - interval '95 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('25ac3a19-06a7-4732-bf60-9082de7f296e', 'samuel.park@bot.goaliefinder.local', '$2a$11$BOT19f2b4eb19b16c5b7cfc5ccf6aff6c7f51b98691a6c64bebf9', 'Samuel', 'Park', '+12621726542', 1, true, true, 'bot_placeholder', NOW() - interval '81 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('dabdd7d7-e58c-4eab-996f-74e927cc4a5c', '25ac3a19-06a7-4732-bf60-9082de7f296e', 45.00, 7, 'Former academy goalkeeper, now playing recreational leagues.', 43.7952, -79.5482, 25, 3.7, 78, 71, true, NOW() - interval '104 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8e5add43-b3b5-44a6-af3e-cde1203f1d4a', 'benjamin.scott@bot.goaliefinder.local', '$2a$11$BOTd3e50a7df2f9e1ff18275f0024d14a0b573dcc6b627644d95f', 'Benjamin', 'Scott', '+13937469743', 1, true, true, 'bot_placeholder', NOW() - interval '121 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('94407e6f-a947-45f5-a458-6c5ac0dd568c', '8e5add43-b3b5-44a6-af3e-cde1203f1d4a', 30.00, 13, 'University-level goalkeeper looking for extra matches.', 43.8622, -79.5657, 15, 4.9, 53, 41, true, NOW() - interval '10 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aa6decd5-e7db-4663-9493-1d10577f4c13', 'david.cruz@bot.goaliefinder.local', '$2a$11$BOTc01a6005cf9c33b7e9acc3d75915a4657a4375a4d9ef70e532', 'David', 'Cruz', '+14768422564', 1, true, true, 'bot_placeholder', NOW() - interval '115 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7c0cfc6d-3d46-4d80-babc-3fb357be9758', 'aa6decd5-e7db-4663-9493-1d10577f4c13', 40.00, 13, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 43.8034, -79.569, 30, 4.8, 34, 30, true, NOW() - interval '4 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aaac66ec-930c-4153-9d63-7a652ec66583', 'hiroshi.gagné@bot.goaliefinder.local', '$2a$11$BOT016deddddf57f8a65f25a20d179c519e48849937b4066e3528', 'Hiroshi', 'Gagné', '+17834658321', 1, true, true, 'bot_placeholder', NOW() - interval '96 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ffb0cb53-813c-481d-a14a-a4d36e719dfb', 'aaac66ec-930c-4153-9d63-7a652ec66583', 15.00, 9, 'Solid keeper with a positive attitude. Always on time.', 43.8044, -79.4523, 15, 4.3, 32, 29, true, NOW() - interval '81 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('87cfffdd-cad6-41cc-87f9-4cb1b8671904', 'logan.campbell@bot.goaliefinder.local', '$2a$11$BOTb93fcb25704c49e557a5b37390cf08fa23120a888075fb12f6', 'Logan', 'Campbell', '+16486793021', 1, true, true, 'bot_placeholder', NOW() - interval '92 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5a8c0778-8f7b-4501-b959-6fb4bf8ce1a7', '87cfffdd-cad6-41cc-87f9-4cb1b8671904', 30.00, 4, 'Friendly and competitive. Great at organizing the defense.', 43.8203, -79.4395, 20, 4.5, 69, 51, true, NOW() - interval '102 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b0996c90-24fa-4c51-be4d-fbc946658ef7', 'cristian.le@bot.goaliefinder.local', '$2a$11$BOT835878ea5de456662eec7250935fbcaad3ad663cbcab918102', 'Cristian', 'Le', '+14636862782', 1, true, true, 'bot_placeholder', NOW() - interval '2 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c1f7c84e-8505-43a4-8145-768aaae4d56a', 'b0996c90-24fa-4c51-be4d-fbc946658ef7', 30.00, 10, 'Versatile keeper, great with distribution and organizing the back line.', 43.8519, -79.5548, 15, 3.5, 68, 66, true, NOW() - interval '54 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bd55712b-9b65-4148-aabe-8e43c5388e30', 'troy.gagné@bot.goaliefinder.local', '$2a$11$BOTa8057c093c9256f0005231b1f9941064ff6d0b433c0623c7f6', 'Troy', 'Gagné', '+18996505759', 1, true, true, 'bot_placeholder', NOW() - interval '169 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6cfc1ba6-7a40-48af-9a79-5df376c82c2b', 'bd55712b-9b65-4148-aabe-8e43c5388e30', 25.00, 9, 'Experienced keeper with quick reflexes and strong communication skills.', 43.8413, -79.5189, 15, 3.7, 23, 5, true, NOW() - interval '116 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bb5a3ddf-dc7f-4070-a4c5-56d9ffd786c8', 'owen.collins@bot.goaliefinder.local', '$2a$11$BOT05d558570dd30d885eec3b67ce6600ef7c1e8cb66da9edbdb1', 'Owen', 'Collins', '+18249153510', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('db0ef131-7665-4ce3-a8ea-2183ea48fe72', 'bb5a3ddf-dc7f-4070-a4c5-56d9ffd786c8', 30.00, 11, 'Passionate about the game. Consistent and dependable between the posts.', 43.8719, -79.4948, 25, 4.4, 15, 13, true, NOW() - interval '50 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ca06745a-e2f1-447e-8612-a823be8fb02a', 'matthew.johnson@bot.goaliefinder.local', '$2a$11$BOT5df5f2e85e421dc70f7d2ed3d05b64a138c4814cb26fdbf5ea', 'Matthew', 'Johnson', '+16792710645', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('31553805-ccb4-4963-ab53-353d210f5dd3', 'ca06745a-e2f1-447e-8612-a823be8fb02a', 25.00, 15, 'Experienced keeper with quick reflexes and strong communication skills.', 43.7993, -79.5337, 20, 4.7, 56, 52, true, NOW() - interval '141 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4ef2c132-38ba-4e23-8052-648ff3cc83f9', 'carlos.young@bot.goaliefinder.local', '$2a$11$BOT690e8274b56b4d1cf9ef9395cbb51a6477c33d8ad8e8c3c6ef', 'Carlos', 'Young', '+18615740901', 1, true, true, 'bot_placeholder', NOW() - interval '46 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fc8e4c2d-e97c-4101-be8b-3916661a6eff', '4ef2c132-38ba-4e23-8052-648ff3cc83f9', 40.00, 5, 'Former academy goalkeeper, now playing recreational leagues.', 43.8818, -79.5736, 20, 4.7, 34, 15, true, NOW() - interval '88 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('44f962b0-71e9-490e-9719-e46e9ae1e1b0', 'paolo.rodriguez@bot.goaliefinder.local', '$2a$11$BOT1373d0bdddd5942fe32f87e0b038b722c68ae8a8e140f0abb0', 'Paolo', 'Rodriguez', '+15503858197', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('323d4dbc-50b8-4e54-96d3-a76352190604', '44f962b0-71e9-490e-9719-e46e9ae1e1b0', 15.00, 5, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.864, -79.5034, 20, 4.9, 24, 12, true, NOW() - interval '79 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c335ae8a-5289-49e7-8c35-15d5e6c88b07', 'tyler.gagnon@bot.goaliefinder.local', '$2a$11$BOTa5bc190cf49670d42a118ef20af826b8bfd430ac08b6418739', 'Tyler', 'Gagnon', '+12141337579', 1, true, true, 'bot_placeholder', NOW() - interval '47 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5ec17a9b-5f60-4b6a-8310-1c716049b391', 'c335ae8a-5289-49e7-8c35-15d5e6c88b07', 35.00, 1, 'Available for last-minute bookings. Always match-ready.', 43.8782, -79.4898, 20, 4.4, 25, 7, true, NOW() - interval '153 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2b933f72-a736-488d-af43-8897a744e655', 'michael.khan@bot.goaliefinder.local', '$2a$11$BOT9fc9be00a35cb6b0c567e62885d2d2523ee21d0c96f4c0ac85', 'Michael', 'Khan', '+19584615320', 1, true, true, 'bot_placeholder', NOW() - interval '97 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('37939e06-f206-48dd-9dd3-2e4c6ae08c94', '2b933f72-a736-488d-af43-8897a744e655', 20.00, 10, 'University-level goalkeeper looking for extra matches.', 43.8188, -79.4726, 20, 4.3, 48, 45, true, NOW() - interval '136 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f6cb3c76-bfe2-4afa-8ad4-42d8e01e7a3e', 'hector.le@bot.goaliefinder.local', '$2a$11$BOT6d5c3787920a30790769e7d44f29d91d8cb38caedfe1b7238b', 'Hector', 'Le', '+16686669788', 1, true, true, 'bot_placeholder', NOW() - interval '132 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d69df0d9-5905-4e8f-99fb-b33ee11f85aa', 'f6cb3c76-bfe2-4afa-8ad4-42d8e01e7a3e', 20.00, 8, 'Tall keeper with a long reach. Command the box effectively.', 43.8617, -79.432, 30, 4.1, 72, 72, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dda49f4e-19b2-4971-af1d-68f60807044a', 'scott.tanaka@bot.goaliefinder.local', '$2a$11$BOT1246b43a37ec6cc63950e0e4cf54fc00c5a4bb294c50c7617a', 'Scott', 'Tanaka', '+12168332469', 1, true, true, 'bot_placeholder', NOW() - interval '92 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('704c2f13-8219-4288-8679-44f7fc7e4a73', 'dda49f4e-19b2-4971-af1d-68f60807044a', 20.00, 4, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 43.8003, -79.4417, 10, 4.8, 33, 31, true, NOW() - interval '58 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('28b82e46-0f19-49e8-aba3-922bf3960f7e', 'nicolas.miller@bot.goaliefinder.local', '$2a$11$BOT301594d54423d04cb2415f7c7c8bd75cbfd1351df36e6822ff', 'Nicolas', 'Miller', '+14144364621', 1, true, true, 'bot_placeholder', NOW() - interval '155 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b4143ecc-4437-4f7e-b32c-2860fe8534bc', '28b82e46-0f19-49e8-aba3-922bf3960f7e', 45.00, 15, 'Experienced keeper with quick reflexes and strong communication skills.', 43.884, -79.5196, 25, 4.8, 21, 18, true, NOW() - interval '29 days', NOW());
-- === Kitchener-Waterloo (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e2dabae2-d2a0-40b7-a2a4-8f4bb3fc6f08', 'simon.ibrahim@bot.goaliefinder.local', '$2a$11$BOT02c7c1ba9c8c455e4f5ea0d13ccbd8700cc61b8077089353f2', 'Simon', 'Ibrahim', '+16162638931', 1, true, true, 'bot_placeholder', NOW() - interval '41 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('925b83cd-ee43-4e8d-9470-1d2050a95451', 'e2dabae2-d2a0-40b7-a2a4-8f4bb3fc6f08', 30.00, 4, 'Friendly and competitive. Great at organizing the defense.', 43.4733, -80.4731, 25, 3.5, 44, 27, true, NOW() - interval '76 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7317c14e-96e5-4fc2-b125-67dd9f95e574', 'arjun.hassan@bot.goaliefinder.local', '$2a$11$BOT7bc3a6b3d26987539a514207b524f820b25df2edbb68296f3b', 'Arjun', 'Hassan', '+12649859976', 1, true, true, 'bot_placeholder', NOW() - interval '157 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9f9b10aa-c110-4b41-846b-ac7ea7a97e31', '7317c14e-96e5-4fc2-b125-67dd9f95e574', 30.00, 12, 'New to the city and looking to play as much as possible.', 43.4108, -80.4794, 25, 4.7, 47, 31, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ac850784-a89d-4031-8684-3d80620d522b', 'roberto.li@bot.goaliefinder.local', '$2a$11$BOT6bd8370346c2cf08d214b51712aa9661284debbe0cdc369231', 'Roberto', 'Li', '+18418069639', 1, true, true, 'bot_placeholder', NOW() - interval '171 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('dcfe6b2f-62ed-4f2d-8b42-410a517a6b6e', 'ac850784-a89d-4031-8684-3d80620d522b', 25.00, 15, 'Experienced keeper with quick reflexes and strong communication skills.', 43.4159, -80.4322, 30, 4.0, 5, 0, true, NOW() - interval '27 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('322b73c2-02fe-4185-9180-c96d689ed571', 'derek.smith@bot.goaliefinder.local', '$2a$11$BOT17075f0324c3686319b416b0190f389791a6595b1ec2704f92', 'Derek', 'Smith', '+12618675691', 1, true, true, 'bot_placeholder', NOW() - interval '56 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('aa09aacd-7725-4d17-95dc-37ddbdd2cc85', '322b73c2-02fe-4185-9180-c96d689ed571', 15.00, 9, 'Friendly and competitive. Great at organizing the defense.', 43.4767, -80.5645, 10, 5.0, 7, 1, true, NOW() - interval '60 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e4030813-29bd-4f0c-8705-5050a07537fc', 'andrew.smith@bot.goaliefinder.local', '$2a$11$BOT273e61cedd1fae79f05b7d27631a97b6b1ef0bf00a089da377', 'Andrew', 'Smith', '+14632732398', 1, true, true, 'bot_placeholder', NOW() - interval '155 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fd89a52a-478d-4f8c-9f10-13197195891e', 'e4030813-29bd-4f0c-8705-5050a07537fc', 40.00, 7, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.4519, -80.414, 30, 3.7, 12, 10, true, NOW() - interval '103 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f9a9f4bb-65cd-4e1e-a21c-bf9af23db2b4', 'scott.ali@bot.goaliefinder.local', '$2a$11$BOT45ae967965e14c8c01b37f4674861c5b7808e3e7b04328266c', 'Scott', 'Ali', '+15139544053', 1, true, true, 'bot_placeholder', NOW() - interval '117 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('68f425b4-697e-4c7f-97ab-e218372102e2', 'f9a9f4bb-65cd-4e1e-a21c-bf9af23db2b4', 40.00, 5, 'Fast and agile. Best on turf and indoor surfaces.', 43.4283, -80.5048, 30, 4.0, 66, 55, true, NOW() - interval '42 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f7ce0b7c-fd3c-4e36-89de-e8bdd5609d33', 'jordan.white@bot.goaliefinder.local', '$2a$11$BOTa73c71acda2709922adf67c4f1bfd14b85477a61d9e6c19e27', 'Jordan', 'White', '+19774776367', 1, true, true, 'bot_placeholder', NOW() - interval '75 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1a407fe7-d22d-4129-b2a5-d496d3e2139f', 'f7ce0b7c-fd3c-4e36-89de-e8bdd5609d33', 45.00, 5, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.4095, -80.4841, 25, 4.3, 67, 56, true, NOW() - interval '35 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('70d32fa6-c2f8-4d96-90d0-2eec54284a65', 'felipe.roberts@bot.goaliefinder.local', '$2a$11$BOT7f76c33804a8f843aa3cc7b27c51436dbc5656e47322661fef', 'Felipe', 'Roberts', '+19084904532', 1, true, true, 'bot_placeholder', NOW() - interval '31 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b0f8edde-e8d0-4854-84c1-973bec1bf304', '70d32fa6-c2f8-4d96-90d0-2eec54284a65', 15.00, 9, 'Weekend warrior goalkeeper. Love the beautiful game!', 43.4764, -80.5253, 25, 4.4, 83, 66, true, NOW() - interval '48 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b89cf367-2abe-40e2-95bc-f38806fa6ba4', 'liam.martin@bot.goaliefinder.local', '$2a$11$BOT53948826d49365fecb5dced74873d409c84855b794bb6998d9', 'Liam', 'Martin', '+18186309684', 1, true, true, 'bot_placeholder', NOW() - interval '25 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('03095dab-5405-4ed0-9d28-f382a457e3d5', 'b89cf367-2abe-40e2-95bc-f38806fa6ba4', 45.00, 1, 'Experienced keeper with quick reflexes and strong communication skills.', 43.4773, -80.4894, 25, 3.5, 29, 24, true, NOW() - interval '102 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6cda79cf-b707-48e5-8eeb-f70bbd38eb28', 'liam.white@bot.goaliefinder.local', '$2a$11$BOT0cdf723a794bd986c328acdbf4cb95dc10ce30e5638a6eef66', 'Liam', 'White', '+15465075967', 1, true, true, 'bot_placeholder', NOW() - interval '7 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b1a114c9-353f-40c2-a87d-c34749c9875b', '6cda79cf-b707-48e5-8eeb-f70bbd38eb28', 20.00, 8, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 43.4898, -80.5075, 30, 4.9, 18, 5, true, NOW() - interval '55 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6436ca92-3799-49f8-a556-1a9d3fefc614', 'emilio.torres@bot.goaliefinder.local', '$2a$11$BOT7988bf41a4fedb9ed3562caa022ced82029f29fd4d423de9c5', 'Emilio', 'Torres', '+13286610189', 1, true, true, 'bot_placeholder', NOW() - interval '150 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3fd11c34-0c96-466f-80ec-105a55d34bb4', '6436ca92-3799-49f8-a556-1a9d3fefc614', 15.00, 3, 'Experienced keeper with quick reflexes and strong communication skills.', 43.4275, -80.4972, 15, 4.1, 36, 26, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c50ee0a0-73b3-4b5c-b80e-96541bd7dbf0', 'adrian.thomas@bot.goaliefinder.local', '$2a$11$BOT3398195ad3f80ad3feaf70ff0517904d9a3f5b76dfd8ae5c5b', 'Adrian', 'Thomas', '+12589737221', 1, true, true, 'bot_placeholder', NOW() - interval '162 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c1ca3194-9af9-49e1-a4cb-e49a5b404c63', 'c50ee0a0-73b3-4b5c-b80e-96541bd7dbf0', 50.00, 9, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.4916, -80.5489, 25, 4.3, 74, 74, true, NOW() - interval '31 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f8351622-be6d-40eb-a53a-ef715e4c5d0b', 'eric.brown@bot.goaliefinder.local', '$2a$11$BOT6e51b444ab9fb6581bb39efbe977970cfa11ac981567c7b9c3', 'Eric', 'Brown', '+15444788772', 1, true, true, 'bot_placeholder', NOW() - interval '79 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f2acd8b4-7a57-42c8-afba-c5c4ec1601a3', 'f8351622-be6d-40eb-a53a-ef715e4c5d0b', 40.00, 10, 'Provincial-level experience. Strong with high balls and one-on-ones.', 43.4765, -80.5652, 20, 3.9, 18, 8, true, NOW() - interval '47 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fd714a13-1a66-4b9b-b267-832dadca5204', 'ethan.diallo@bot.goaliefinder.local', '$2a$11$BOT6e70bb35e9a41d810a7834e8473d510c2880663370e7961abb', 'Ethan', 'Diallo', '+14318145520', 1, true, true, 'bot_placeholder', NOW() - interval '177 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5ef8f17d-c5a1-44d8-9550-6636350a2f48', 'fd714a13-1a66-4b9b-b267-832dadca5204', 20.00, 7, 'Strong penalty saver. Calm and focused under pressure.', 43.4613, -80.4585, 15, 4.1, 80, 77, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9f15ed71-21ba-4a50-a5ed-efc8eb65d768', 'nathan.tremblay@bot.goaliefinder.local', '$2a$11$BOT452883454d20959c9329bddd3cac5dc217811bddd9a043353a', 'Nathan', 'Tremblay', '+18669905566', 1, true, true, 'bot_placeholder', NOW() - interval '95 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d86f15a6-7043-40bd-a1a3-6a52e7202f67', '9f15ed71-21ba-4a50-a5ed-efc8eb65d768', 20.00, 14, 'Fast and agile. Best on turf and indoor surfaces.', 43.4028, -80.4164, 15, 4.1, 24, 6, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d18871fb-111e-47ae-8b3f-ae0b298abd4c', 'maxime.ramirez@bot.goaliefinder.local', '$2a$11$BOTa3d551db6fc39372cd2c58689f3807d39dc99e80ee3153aefe', 'Maxime', 'Ramirez', '+17163296920', 1, true, true, 'bot_placeholder', NOW() - interval '122 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ed303dea-bbc4-410d-9a77-efae8723ae52', 'd18871fb-111e-47ae-8b3f-ae0b298abd4c', 25.00, 14, 'Reliable shot-stopper available for weekend and weekday games.', 43.4727, -80.4799, 20, 4.5, 85, 78, true, NOW() - interval '151 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0eb933c8-006b-4ad7-ac4e-94a4e947fceb', 'justin.adebayo@bot.goaliefinder.local', '$2a$11$BOTe670af7494fcb61eebbd599c100ac48e552b02f0c31bcca80f', 'Justin', 'Adebayo', '+19479056112', 1, true, true, 'bot_placeholder', NOW() - interval '21 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ba17dbee-915d-47c8-8a54-5f1582cbcfd1', '0eb933c8-006b-4ad7-ac4e-94a4e947fceb', 40.00, 13, 'Technical goalkeeper who loves playing out from the back.', 43.396, -80.5122, 20, 4.9, 71, 56, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3754de15-5904-415d-8272-f7146ca47ccb', 'yousef.flores@bot.goaliefinder.local', '$2a$11$BOT366c856257ff4854c9c5e552e27bca96e7e6b523a089e5607d', 'Yousef', 'Flores', '+15989785179', 1, true, true, 'bot_placeholder', NOW() - interval '48 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cfd6b4ac-7b07-4ef5-8f3a-aeff731ba1e6', '3754de15-5904-415d-8272-f7146ca47ccb', 35.00, 9, 'Fast and agile. Best on turf and indoor surfaces.', 43.4286, -80.4223, 15, 4.2, 45, 38, true, NOW() - interval '79 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c0272fa5-3cee-4b39-ba8a-3d939f5dce6a', 'oscar.fortin@bot.goaliefinder.local', '$2a$11$BOTd898c245eaa60551d53f35974e15ee445b537f09b7ea6b544d', 'Oscar', 'Fortin', '+14851647033', 1, true, true, 'bot_placeholder', NOW() - interval '112 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e31dbd59-da90-4328-a5f5-2f371d1f46f1', 'c0272fa5-3cee-4b39-ba8a-3d939f5dce6a', 40.00, 9, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 43.3936, -80.4921, 20, 3.5, 75, 63, true, NOW() - interval '83 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f0e62fe0-3593-49ac-8fe1-14beae659823', 'samuel.miller@bot.goaliefinder.local', '$2a$11$BOTba59d4c22d33b9e7262963612729c0ccccb86548645912bbc2', 'Samuel', 'Miller', '+13342865429', 1, true, true, 'bot_placeholder', NOW() - interval '144 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('933e4588-47aa-4b5a-9b07-cd05f7f0a8e4', 'f0e62fe0-3593-49ac-8fe1-14beae659823', 20.00, 4, 'Friendly and competitive. Great at organizing the defense.', 43.408, -80.5437, 30, 4.1, 18, 2, true, NOW() - interval '91 days', NOW());
-- === London (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1f15ab6b-4e4f-4919-b0de-93451d4b789d', 'henry.tran@bot.goaliefinder.local', '$2a$11$BOT2318835fa385281cb769194cfdcb5cbf7d417ae77c428d1d85', 'Henry', 'Tran', '+19831045747', 1, true, true, 'bot_placeholder', NOW() - interval '50 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0482a35b-5f9b-4b56-82f5-e7af98e16195', '1f15ab6b-4e4f-4919-b0de-93451d4b789d', 15.00, 13, 'Available for last-minute bookings. Always match-ready.', 42.9835, -81.1846, 15, 4.1, 58, 56, true, NOW() - interval '57 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2b237e29-7ff0-49cb-b996-ab0b6a25c847', 'sergio.garcia@bot.goaliefinder.local', '$2a$11$BOTc50eb541ddb7d48ed33936279a860e1c8fea5dc621010e84da', 'Sergio', 'Garcia', '+13908434388', 1, true, true, 'bot_placeholder', NOW() - interval '12 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b9f33089-c93a-44c5-9ff9-e96ff398fac2', '2b237e29-7ff0-49cb-b996-ab0b6a25c847', 40.00, 12, 'Technical goalkeeper who loves playing out from the back.', 42.9785, -81.1965, 20, 4.8, 15, 15, true, NOW() - interval '156 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dff8d1e2-fd39-4ed3-b2a2-cf08f9ddaae7', 'julien.roberts@bot.goaliefinder.local', '$2a$11$BOT53a40897ec085f046a42a9bd4c1af0e1f6b11e64c8bd0a02de', 'Julien', 'Roberts', '+17622529069', 1, true, true, 'bot_placeholder', NOW() - interval '41 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('db1b5cd2-a234-4744-a162-5dafd01a9f43', 'dff8d1e2-fd39-4ed3-b2a2-cf08f9ddaae7', 50.00, 12, 'Retired semi-pro goalkeeper. Still got it!', 42.927, -81.172, 10, 4.9, 32, 12, true, NOW() - interval '53 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b4c87cd9-b0fc-4baa-9d06-8efaeecab033', 'noah.wilson@bot.goaliefinder.local', '$2a$11$BOT99426fec822350dccf61d586bed5658822c26ee3bc0c19f893', 'Noah', 'Wilson', '+19516978877', 1, true, true, 'bot_placeholder', NOW() - interval '67 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('adda1f72-e168-4c48-ad83-789166904ea7', 'b4c87cd9-b0fc-4baa-9d06-8efaeecab033', 45.00, 1, 'Athletic shot-stopper with years of competitive experience.', 42.987, -81.2827, 20, 4.9, 6, 5, true, NOW() - interval '119 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5de38644-2755-480f-a53a-b2b42de97fed', 'rémi.taylor@bot.goaliefinder.local', '$2a$11$BOT40d39534afd503ba4dce7561dcc804189d543b3383d99f3396', 'Rémi', 'Taylor', '+15816967319', 1, true, true, 'bot_placeholder', NOW() - interval '22 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('892aafcf-dd18-4da2-b723-e4c80ec1a5ea', '5de38644-2755-480f-a53a-b2b42de97fed', 25.00, 2, 'Versatile keeper, great with distribution and organizing the back line.', 43.0058, -81.2782, 20, 4.1, 71, 52, true, NOW() - interval '49 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a0bdbf71-448f-4245-bd62-fb32a921e6c0', 'françois.rodriguez@bot.goaliefinder.local', '$2a$11$BOT4ea777779a7380275e77b01d6a68df9626f793a195cb64f7a7', 'François', 'Rodriguez', '+12696196986', 1, true, true, 'bot_placeholder', NOW() - interval '71 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c0b45358-69bd-41c4-85c3-0213d11c13bc', 'a0bdbf71-448f-4245-bd62-fb32a921e6c0', 25.00, 13, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 42.9981, -81.2725, 25, 4.9, 56, 48, true, NOW() - interval '116 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('eefbf679-4586-406a-a866-246b6a939843', 'jayden.gauthier@bot.goaliefinder.local', '$2a$11$BOTb7d8402639a1cc8f6f58192c6cb334054a09ab6882961e1a2e', 'Jayden', 'Gauthier', '+19194271357', 1, true, true, 'bot_placeholder', NOW() - interval '114 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9b123a68-a692-407b-af84-9ac48fffbd41', 'eefbf679-4586-406a-a866-246b6a939843', 20.00, 11, 'Provincial-level experience. Strong with high balls and one-on-ones.', 42.9663, -81.1754, 25, 4.1, 49, 40, true, NOW() - interval '127 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9021942e-9abd-479a-ba83-ec3b00ed5fa4', 'simon.gagnon@bot.goaliefinder.local', '$2a$11$BOT18b9ce0311c1499638b7ec923c4d54a703f446190d082a73d5', 'Simon', 'Gagnon', '+15427206131', 1, true, true, 'bot_placeholder', NOW() - interval '64 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2702ed0d-10f9-41b9-b067-6fe935f948f7', '9021942e-9abd-479a-ba83-ec3b00ed5fa4', 20.00, 5, 'Played keeper since I was 12. Quick feet and safe hands.', 42.9258, -81.1681, 15, 3.6, 4, 3, true, NOW() - interval '21 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5a936f08-f8bf-4861-b0c6-e3866d1e7939', 'antonio.fernandez@bot.goaliefinder.local', '$2a$11$BOTdfceb777270cb162b735dc691e99c4e5f1cccc8a9cb588f114', 'Antonio', 'Fernandez', '+16365300163', 1, true, true, 'bot_placeholder', NOW() - interval '43 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8f28c964-0ba6-4028-93c9-9acc87a8f434', '5a936f08-f8bf-4861-b0c6-e3866d1e7939', 40.00, 6, 'Provincial-level experience. Strong with high balls and one-on-ones.', 42.9999, -81.2862, 15, 4.6, 63, 63, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e4de24e6-df0e-46d2-bed4-9397ccf6ae14', 'carter.nguyen@bot.goaliefinder.local', '$2a$11$BOT7414bfa4c39dcadc1b16bbd4aeaabbcb6e0f9907c509f69032', 'Carter', 'Nguyen', '+14567020969', 1, true, true, 'bot_placeholder', NOW() - interval '156 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a73ce256-d535-4572-a3fb-20f3c31fb5e7', 'e4de24e6-df0e-46d2-bed4-9397ccf6ae14', 30.00, 13, 'Provincial-level experience. Strong with high balls and one-on-ones.', 43.0212, -81.2227, 15, 3.5, 36, 30, true, NOW() - interval '115 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c34d3874-53f6-4e12-9d60-ff79e2f3185b', 'sung.rodriguez@bot.goaliefinder.local', '$2a$11$BOT7f6e479426fdfae540311a3988d0dd30f6a8b10d7ca8123600', 'Sung', 'Rodriguez', '+13092254417', 1, true, true, 'bot_placeholder', NOW() - interval '148 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('400a6607-8b87-4856-a7cc-6f2b97634a9d', 'c34d3874-53f6-4e12-9d60-ff79e2f3185b', 40.00, 1, 'New to the city and looking to play as much as possible.', 42.933, -81.1746, 15, 3.6, 13, 12, true, NOW() - interval '24 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('01df5984-f244-42d1-9b61-fa2d6b30558b', 'isaac.morris@bot.goaliefinder.local', '$2a$11$BOT600e221a3183451f76da9a29bc670d689516b2c8f7a8993fdd', 'Isaac', 'Morris', '+18079833170', 1, true, true, 'bot_placeholder', NOW() - interval '147 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4b282847-0dd2-4651-aebf-9db8fb296c49', '01df5984-f244-42d1-9b61-fa2d6b30558b', 15.00, 12, 'Played keeper since I was 12. Quick feet and safe hands.', 42.9438, -81.1999, 30, 4.9, 51, 32, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4b39ea55-ce54-43e1-b137-9f897c0d66d5', 'diego.wang@bot.goaliefinder.local', '$2a$11$BOTc1de6a1357cbcbca12920f5ae46daff7755b85358e14263346', 'Diego', 'Wang', '+13839669199', 1, true, true, 'bot_placeholder', NOW() - interval '96 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2acebd35-e493-4b01-87b4-1d44505ce574', '4b39ea55-ce54-43e1-b137-9f897c0d66d5', 25.00, 11, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 42.9696, -81.2253, 15, 4.4, 75, 74, true, NOW() - interval '76 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d6863c1f-a74c-43e8-a907-ea6a026a3a13', 'alejandro.morris@bot.goaliefinder.local', '$2a$11$BOT00ada3d8098a53a17aae601a3c76ec0489539adf1c9fd9db4e', 'Alejandro', 'Morris', '+17216712623', 1, true, true, 'bot_placeholder', NOW() - interval '65 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b04494ae-face-48fd-8791-8b64a5df63b7', 'd6863c1f-a74c-43e8-a907-ea6a026a3a13', 35.00, 4, 'Versatile keeper, great with distribution and organizing the back line.', 42.9586, -81.18, 15, 4.3, 23, 15, true, NOW() - interval '17 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1107bcc3-be4f-4f28-b860-a7fadf3d9311', 'arjun.ali@bot.goaliefinder.local', '$2a$11$BOT581b9786f54f8e70b4138d274dae1955baa3bcba86509cdb7d', 'Arjun', 'Ali', '+13217868200', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a6e74af0-5180-4516-a384-595df208d244', '1107bcc3-be4f-4f28-b860-a7fadf3d9311', 35.00, 13, 'Played keeper since I was 12. Quick feet and safe hands.', 42.9495, -81.3205, 20, 4.8, 68, 53, true, NOW() - interval '135 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aa2f6bd9-397d-4dad-99a5-1e8d35761802', 'françois.okafor@bot.goaliefinder.local', '$2a$11$BOT365a4d3e0aea8f0a04699c90a4b540caad39b1f72aa6132e5d', 'François', 'Okafor', '+15831143529', 1, true, true, 'bot_placeholder', NOW() - interval '39 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('438c11e2-91d1-4b09-977d-035c1900286c', 'aa2f6bd9-397d-4dad-99a5-1e8d35761802', 20.00, 11, 'Reliable shot-stopper available for weekend and weekday games.', 43.0343, -81.2922, 20, 4.4, 68, 56, true, NOW() - interval '66 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c86bd6b6-0c5c-4f3e-9c39-ea8ea5de6990', 'victor.perez@bot.goaliefinder.local', '$2a$11$BOTd28e6388d05291497ab75a28a72f63a8c4c66ea223b11de85c', 'Victor', 'Perez', '+12326504007', 1, true, true, 'bot_placeholder', NOW() - interval '117 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5d6f209b-a638-45c5-b6ae-abdf6881840c', 'c86bd6b6-0c5c-4f3e-9c39-ea8ea5de6990', 25.00, 8, 'New to the city and looking to play as much as possible.', 43.0296, -81.1682, 15, 3.9, 42, 36, true, NOW() - interval '55 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('084a3530-5d78-40f0-85a6-4c5bf622ddd6', 'carlos.cruz@bot.goaliefinder.local', '$2a$11$BOTaf245e8e0464795bdc46e4d4e0dfd776eba210c7d1735563da', 'Carlos', 'Cruz', '+13212838403', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b6aeef61-c8e3-4b60-80d9-bcc9a867229d', '084a3530-5d78-40f0-85a6-4c5bf622ddd6', 50.00, 8, 'Weekend warrior goalkeeper. Love the beautiful game!', 42.9322, -81.2067, 30, 3.5, 39, 38, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('edccbcaa-7436-4f11-8f2a-e4e46c7b27dc', 'min.anderson@bot.goaliefinder.local', '$2a$11$BOT0f425a533d314d249836d13dd838886cab2e05a3af3de60429', 'Min', 'Anderson', '+18213614237', 1, true, true, 'bot_placeholder', NOW() - interval '139 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a92a0a40-ef33-4eb1-bf54-11a05405ebcc', 'edccbcaa-7436-4f11-8f2a-e4e46c7b27dc', 20.00, 15, 'Provincial-level experience. Strong with high balls and one-on-ones.', 42.9255, -81.2824, 20, 3.6, 74, 54, true, NOW() - interval '70 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e7762f07-dbaa-4a3d-8b71-7cf4a8ee8cf7', 'guillaume.brown@bot.goaliefinder.local', '$2a$11$BOT70d4d15603687eec5ee3200c50934579560689b0b2a41ac1fd', 'Guillaume', 'Brown', '+19314361490', 1, true, true, 'bot_placeholder', NOW() - interval '25 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bc863aa4-53db-4246-b887-f2471bd3033a', 'e7762f07-dbaa-4a3d-8b71-7cf4a8ee8cf7', 35.00, 3, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 42.9798, -81.2473, 20, 4.8, 10, 3, true, NOW() - interval '89 days', NOW());
-- === Milton (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('71505238-627f-42ca-a3ab-1d45e6367c53', 'takumi.mensah@bot.goaliefinder.local', '$2a$11$BOTb5d5407d4ed8e7f5d98dd05f404c3f56aaef0559f1b67159d8', 'Takumi', 'Mensah', '+16256014948', 1, true, true, 'bot_placeholder', NOW() - interval '73 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b20ecbf5-81dd-4055-986b-40dde361d215', '71505238-627f-42ca-a3ab-1d45e6367c53', 15.00, 9, 'University-level goalkeeper looking for extra matches.', 43.4953, -79.8153, 30, 4.2, 7, 0, true, NOW() - interval '75 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('03d3eab0-8804-4b31-b5b3-1d3cc3642621', 'wei.castillo@bot.goaliefinder.local', '$2a$11$BOT2e7c883923539f0c3ec9799d7710f6f0f9cfd72763d3d2fa0e', 'Wei', 'Castillo', '+14844569798', 1, true, true, 'bot_placeholder', NOW() - interval '37 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0f5843a3-9323-4346-b0e3-4416cbe30c63', '03d3eab0-8804-4b31-b5b3-1d3cc3642621', 20.00, 3, 'Reliable shot-stopper available for weekend and weekday games.', 43.5769, -79.8932, 10, 4.3, 43, 37, true, NOW() - interval '158 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9afb5d39-896a-469b-8642-e139ea5f9c4d', 'alexandre.cruz@bot.goaliefinder.local', '$2a$11$BOTf995e4829e4a51fff248a78a9eb9bc7473e2d1b1adf9a2ded0', 'Alexandre', 'Cruz', '+15377359763', 1, true, true, 'bot_placeholder', NOW() - interval '11 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('69ae8ce1-dd3c-464b-8b0c-d9877d7cc22f', '9afb5d39-896a-469b-8642-e139ea5f9c4d', 30.00, 9, 'Solid keeper with a positive attitude. Always on time.', 43.5751, -79.8376, 20, 4.6, 12, 6, true, NOW() - interval '65 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d0d51eeb-8775-4cdb-81d7-ef9c2cedb7f0', 'jorge.khan@bot.goaliefinder.local', '$2a$11$BOT980c70b3204587fd554fd23a453e1f739db848fe0149ff8416', 'Jorge', 'Khan', '+19858721692', 1, true, true, 'bot_placeholder', NOW() - interval '157 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('34db2756-8101-45b0-bbb3-baee8bb6fb7b', 'd0d51eeb-8775-4cdb-81d7-ef9c2cedb7f0', 20.00, 4, 'Played keeper since I was 12. Quick feet and safe hands.', 43.5556, -79.9429, 20, 4.4, 28, 10, true, NOW() - interval '148 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('583d6b18-2304-4bba-8cc9-0d4d65c8e901', 'andrew.lopez@bot.goaliefinder.local', '$2a$11$BOT70feafebc6e7d5053d81a0811e00b71ce206824ac11b8022da', 'Andrew', 'Lopez', '+14592746497', 1, true, true, 'bot_placeholder', NOW() - interval '164 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ce47aa9e-038e-43d3-a7c4-455b4bfbc95d', '583d6b18-2304-4bba-8cc9-0d4d65c8e901', 25.00, 1, 'Friendly and competitive. Great at organizing the defense.', 43.5323, -79.9319, 20, 4.9, 45, 25, true, NOW() - interval '172 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('702bfd53-07f0-4621-82e1-9587938e8cbf', 'alberto.martinez@bot.goaliefinder.local', '$2a$11$BOT414153861f41b7b909c2b512ac0bac00cde66561a1ba9ec275', 'Alberto', 'Martinez', '+13165685533', 1, true, true, 'bot_placeholder', NOW() - interval '175 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6c8e810e-18b9-448e-acd6-048247116ef1', '702bfd53-07f0-4621-82e1-9587938e8cbf', 45.00, 13, 'Athletic shot-stopper with years of competitive experience.', 43.4677, -79.8418, 20, 4.4, 82, 64, true, NOW() - interval '149 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1eb2e916-f33c-4d49-b25e-c16021136d00', 'sebastian.white@bot.goaliefinder.local', '$2a$11$BOTfbc1bb85450947d5d881eb28157d32a537739797d455d1d938', 'Sebastian', 'White', '+17413512550', 1, true, true, 'bot_placeholder', NOW() - interval '124 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ea7e1a6b-946c-44cd-b4bd-371773676209', '1eb2e916-f33c-4d49-b25e-c16021136d00', 25.00, 10, 'Technical goalkeeper who loves playing out from the back.', 43.5357, -79.9108, 25, 4.7, 12, 9, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b5723e8b-0b74-4987-8c44-ee5206c1bd20', 'jae.santos@bot.goaliefinder.local', '$2a$11$BOT06f7e79da6c27f68d3651b7537e8c68d717f14d6247ca6d46d', 'Jae', 'Santos', '+12121098153', 1, true, true, 'bot_placeholder', NOW() - interval '53 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7e085660-5ef0-4e4f-b577-ec5c6a608657', 'b5723e8b-0b74-4987-8c44-ee5206c1bd20', 45.00, 5, 'Athletic shot-stopper with years of competitive experience.', 43.5547, -79.8188, 15, 3.9, 38, 36, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d21d5bab-1aba-4b61-9d87-cc62604a1dff', 'alexandre.garcia@bot.goaliefinder.local', '$2a$11$BOTbe80e64dc0b08e6fac0e60b72f7215af020a47a65b84ca50ca', 'Alexandre', 'Garcia', '+17161770461', 1, true, true, 'bot_placeholder', NOW() - interval '18 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f75df201-ae42-46cb-86b1-6d654c44b646', 'd21d5bab-1aba-4b61-9d87-cc62604a1dff', 20.00, 7, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 43.5293, -79.9186, 20, 3.5, 81, 75, true, NOW() - interval '171 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('354ec2b8-f9be-4950-b8c5-9e22d6ed3a48', 'matthew.park@bot.goaliefinder.local', '$2a$11$BOTd5af58a3a83d592adfffcca6414402ecf53f2b36f24c080f39', 'Matthew', 'Park', '+16525047536', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cdc37c0c-5f4a-44a4-83e3-0687bb02a363', '354ec2b8-f9be-4950-b8c5-9e22d6ed3a48', 50.00, 7, 'Versatile keeper, great with distribution and organizing the back line.', 43.4712, -79.9348, 15, 3.6, 83, 68, true, NOW() - interval '77 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fb9a3880-59d0-4cf0-aba3-21ec7257e533', 'travis.gauthier@bot.goaliefinder.local', '$2a$11$BOT5b57ff006b659d3143076bfb6e1ebc9f9c463b17e4846ba902', 'Travis', 'Gauthier', '+14405499132', 1, true, true, 'bot_placeholder', NOW() - interval '13 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e89c3396-9f49-4a36-a2ab-1d7da1d98743', 'fb9a3880-59d0-4cf0-aba3-21ec7257e533', 15.00, 10, 'Technical goalkeeper who loves playing out from the back.', 43.4639, -79.8441, 20, 3.8, 2, 0, true, NOW() - interval '11 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ca66f140-ab3e-47ca-ba9c-3ad5803ce9ec', 'yousef.wright@bot.goaliefinder.local', '$2a$11$BOT8060727cb614cddd05d302b5dda9ce4f57dda459e1646306a6', 'Yousef', 'Wright', '+17657254403', 1, true, true, 'bot_placeholder', NOW() - interval '179 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fa0bcd03-f32c-4092-a329-5523bbb094d0', 'ca66f140-ab3e-47ca-ba9c-3ad5803ce9ec', 25.00, 6, 'Available for last-minute bookings. Always match-ready.', 43.5282, -79.8706, 20, 4.5, 1, 0, true, NOW() - interval '39 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2f1d7944-4534-4222-916f-884829e2e3a1', 'ethan.young@bot.goaliefinder.local', '$2a$11$BOTca506a03d633ac8bebd253083dba5b6311bcdbeba79f57d665', 'Ethan', 'Young', '+13828733867', 1, true, true, 'bot_placeholder', NOW() - interval '17 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('05a42f8a-7ad3-423c-ad59-60cfb3c63107', '2f1d7944-4534-4222-916f-884829e2e3a1', 35.00, 7, 'Calm under pressure. Played competitive soccer for 8 years.', 43.4629, -79.9485, 10, 4.7, 52, 47, true, NOW() - interval '25 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f9fce42d-8897-4df1-b0f0-b7703892dcaf', 'lucas.ahmed@bot.goaliefinder.local', '$2a$11$BOT37df4804f4f6f096f320b02b53d0d980d0bb5f293acc060e5c', 'Lucas', 'Ahmed', '+15247576227', 1, true, true, 'bot_placeholder', NOW() - interval '109 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('222ec79b-c807-45d5-924d-0a8b2b447845', 'f9fce42d-8897-4df1-b0f0-b7703892dcaf', 30.00, 3, 'Played keeper since I was 12. Quick feet and safe hands.', 43.4584, -79.8551, 20, 3.8, 69, 56, true, NOW() - interval '168 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1174cb98-d954-4724-ad41-bb274f1f61d9', 'jason.thompson@bot.goaliefinder.local', '$2a$11$BOT8218b8964c041dc6aec0fb4eee919a508cfb11758c4a05261a', 'Jason', 'Thompson', '+17192166779', 1, true, true, 'bot_placeholder', NOW() - interval '35 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e097ea0f-28de-490d-a491-71bf5236e3cb', '1174cb98-d954-4724-ad41-bb274f1f61d9', 30.00, 4, 'Passionate about the game. Consistent and dependable between the posts.', 43.5119, -79.8344, 20, 3.8, 47, 39, true, NOW() - interval '146 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('96268202-2cc4-4a9a-819f-4dcd64e174e1', 'andres.gagné@bot.goaliefinder.local', '$2a$11$BOT4db68d34751a03a08d6931ed18a7f06a8175d55d050ee88743', 'Andres', 'Gagné', '+14546643775', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5e54d8f2-002e-4dcc-9c9d-9ee1d78224da', '96268202-2cc4-4a9a-819f-4dcd64e174e1', 45.00, 5, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 43.4745, -79.8126, 20, 4.1, 43, 25, true, NOW() - interval '49 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1fd94744-94f4-4ad6-a573-0371eec64575', 'amir.young@bot.goaliefinder.local', '$2a$11$BOT655e786b7b3994259cfbe654e3a7c5a7c1ec8a4de05d11ef43', 'Amir', 'Young', '+18186107141', 1, true, true, 'bot_placeholder', NOW() - interval '166 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bf0bbf42-4edd-478e-b31b-46f4e9dd279b', '1fd94744-94f4-4ad6-a573-0371eec64575', 25.00, 3, 'Former academy goalkeeper, now playing recreational leagues.', 43.4654, -79.9212, 15, 3.8, 24, 22, true, NOW() - interval '163 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('426cd94c-6674-40c1-8a9e-cc348e7acf33', 'ethan.ali@bot.goaliefinder.local', '$2a$11$BOT2a166fe7bb52f9e83394df40fd128d13b880bbbb408f7b1b58', 'Ethan', 'Ali', '+18177208140', 1, true, true, 'bot_placeholder', NOW() - interval '63 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('18151ecd-4879-4683-92fa-e3a33b14888e', '426cd94c-6674-40c1-8a9e-cc348e7acf33', 35.00, 8, 'Technical goalkeeper who loves playing out from the back.', 43.5739, -79.9002, 20, 4.4, 7, 0, true, NOW() - interval '170 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e1f7ab5a-e8a1-4790-b6ab-dfce4d7ccbcb', 'matthew.young@bot.goaliefinder.local', '$2a$11$BOT6de92baaa918f47bd6ba8dca6d428b0d673f46ea251167bb88', 'Matthew', 'Young', '+12011637461', 1, true, true, 'bot_placeholder', NOW() - interval '39 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b2a8b75e-c28d-4c3c-9442-6325782522f6', 'e1f7ab5a-e8a1-4790-b6ab-dfce4d7ccbcb', 20.00, 9, 'Former academy goalkeeper, now playing recreational leagues.', 43.5546, -79.7982, 10, 4.8, 77, 60, true, NOW() - interval '135 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d65d32ee-adcb-4bed-a221-ac60f4bd297e', 'andrew.suzuki@bot.goaliefinder.local', '$2a$11$BOT2a0cf760fdf6b1f1665a9d5de0a58f45e834fbd219416aaaed', 'Andrew', 'Suzuki', '+18946156613', 1, true, true, 'bot_placeholder', NOW() - interval '118 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('02e2902f-e865-42e0-9260-40df73ed7fd7', 'd65d32ee-adcb-4bed-a221-ac60f4bd297e', 20.00, 8, 'Solid keeper with a positive attitude. Always on time.', 43.4973, -79.806, 15, 4.7, 2, 0, true, NOW() - interval '74 days', NOW());
-- === Vancouver (25 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b887fde5-fce2-4f33-8681-6aba0f0d3f82', 'leo.lavoie@bot.goaliefinder.local', '$2a$11$BOT6a97da4ec3c97a8cff15ad0509e1385e6be64feeb2b683ee57', 'Leo', 'Lavoie', '+12829142233', 1, true, true, 'bot_placeholder', NOW() - interval '8 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3a4065cd-20ec-44f6-a119-f79f4cc2a786', 'b887fde5-fce2-4f33-8681-6aba0f0d3f82', 25.00, 7, 'Provincial-level experience. Strong with high balls and one-on-ones.', 49.2267, -123.1288, 20, 4.2, 48, 44, true, NOW() - interval '113 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('67f44cdf-8982-4bee-a511-5e1287804e31', 'sung.vargas@bot.goaliefinder.local', '$2a$11$BOTb0787a103ca54f9524ff5455602c0121f4f57cfa6b8cb17e2a', 'Sung', 'Vargas', '+15054034853', 1, true, true, 'bot_placeholder', NOW() - interval '29 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b6bad692-3041-4a0a-a05f-ec748900cb40', '67f44cdf-8982-4bee-a511-5e1287804e31', 20.00, 14, 'Experienced keeper with quick reflexes and strong communication skills.', 49.3355, -123.1625, 10, 4.2, 76, 57, true, NOW() - interval '20 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('34478d7a-2c9e-43df-aa4b-db2e1002f941', 'aaron.kim@bot.goaliefinder.local', '$2a$11$BOT638ad0be279fe42b770445959cd2aa85c066f762ecb0f88fa2', 'Aaron', 'Kim', '+12829264737', 1, true, true, 'bot_placeholder', NOW() - interval '76 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('df15361f-7afd-4e5e-b733-02145f365ffe', '34478d7a-2c9e-43df-aa4b-db2e1002f941', 25.00, 11, 'New to the city and looking to play as much as possible.', 49.302, -123.1586, 10, 3.9, 56, 39, true, NOW() - interval '139 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4fe9c4c5-ca24-46e3-91bf-2dc1838f37f6', 'hugo.lopez@bot.goaliefinder.local', '$2a$11$BOT1f7cd6d5091ec02afbe5e9f47ca230152024c8ff238b8a9bd3', 'Hugo', 'Lopez', '+16427527704', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b22f3659-b03c-4ad9-a4f7-293f5b215012', '4fe9c4c5-ca24-46e3-91bf-2dc1838f37f6', 20.00, 2, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 49.2439, -123.0941, 15, 4.5, 17, 6, true, NOW() - interval '147 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4d316640-0b49-44e3-999e-61dc498fefe7', 'shane.khan@bot.goaliefinder.local', '$2a$11$BOT4a13928a2657bc62fd8771393872073d3eb41ffae03b91bb12', 'Shane', 'Khan', '+16482626196', 1, true, true, 'bot_placeholder', NOW() - interval '51 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1c73164a-7f98-442c-becd-28c2d84f27e4', '4d316640-0b49-44e3-999e-61dc498fefe7', 40.00, 4, 'Experienced keeper with quick reflexes and strong communication skills.', 49.2589, -123.069, 25, 4.1, 76, 70, true, NOW() - interval '26 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a704a20b-322e-4548-ba37-3a1540467273', 'vikram.brown@bot.goaliefinder.local', '$2a$11$BOT82394e88a0b493480e00663497498744a7f8d899a83794dcf9', 'Vikram', 'Brown', '+16428479788', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ca2471c3-b534-4093-8996-c0cb7fd7e029', 'a704a20b-322e-4548-ba37-3a1540467273', 25.00, 10, 'University-level goalkeeper looking for extra matches.', 49.2553, -123.0893, 20, 3.7, 64, 60, true, NOW() - interval '100 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('600ac4d3-ac01-47c2-8df7-772f6e28a375', 'hugo.king@bot.goaliefinder.local', '$2a$11$BOTf5c1ad02baaf375c25dc53d0bce37fd6a48576d23a96e169a9', 'Hugo', 'King', '+12348515301', 1, true, true, 'bot_placeholder', NOW() - interval '29 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('23a5b730-6f01-4215-8162-793d26519074', '600ac4d3-ac01-47c2-8df7-772f6e28a375', 25.00, 12, 'Solid keeper with a positive attitude. Always on time.', 49.296, -123.1696, 10, 4.5, 6, 0, true, NOW() - interval '41 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e7b64645-b6df-4fca-8be2-00b2878c724e', 'felipe.lee@bot.goaliefinder.local', '$2a$11$BOTd72241bbc944d80a70a2bb5a86f4ecbf6615590a3b4fce94fd', 'Felipe', 'Lee', '+12332163710', 1, true, true, 'bot_placeholder', NOW() - interval '130 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8a54301e-38f2-4ee0-8d13-88737ec1622b', 'e7b64645-b6df-4fca-8be2-00b2878c724e', 25.00, 7, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 49.2502, -123.1811, 20, 4.4, 67, 47, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5ca47319-bd89-45de-8639-066611ec9f1b', 'justin.ali@bot.goaliefinder.local', '$2a$11$BOTecbcf6bb117bf3195cc52ef1b1d8e447e0f1d6322a81869f46', 'Justin', 'Ali', '+12375455552', 1, true, true, 'bot_placeholder', NOW() - interval '166 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1559e85c-1dbf-4ec4-9128-a9ba734a5700', '5ca47319-bd89-45de-8639-066611ec9f1b', 25.00, 1, 'Passionate about the game. Consistent and dependable between the posts.', 49.3052, -123.1789, 30, 4.4, 31, 22, true, NOW() - interval '118 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c8e129f4-093e-4f38-a3e5-72611b0b013a', 'théo.bouchard@bot.goaliefinder.local', '$2a$11$BOT7a2e30bd3001b3d92c29fe73c1c033bb6610e3f2f3bda4efeb', 'Théo', 'Bouchard', '+17844728055', 1, true, true, 'bot_placeholder', NOW() - interval '115 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f91cdfa8-8055-4c78-86b4-2d2f2eaa9182', 'c8e129f4-093e-4f38-a3e5-72611b0b013a', 50.00, 11, 'Strong penalty saver. Calm and focused under pressure.', 49.2396, -123.1685, 10, 3.7, 63, 63, true, NOW() - interval '136 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3e3d17f3-784a-4d91-babd-b574f2a7a6ec', 'josue.phillips@bot.goaliefinder.local', '$2a$11$BOT630674e1aa5ae0cabd30c1c6df3fa125553dac048b86364c8c', 'Josue', 'Phillips', '+17383093606', 1, true, true, 'bot_placeholder', NOW() - interval '5 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4bd9c35d-33f3-4e41-b2ba-3e641e8ce2bc', '3e3d17f3-784a-4d91-babd-b574f2a7a6ec', 35.00, 12, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.3116, -123.1079, 15, 3.8, 0, 0, true, NOW() - interval '34 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e166671e-0227-467a-b322-778e4136d18a', 'kenji.young@bot.goaliefinder.local', '$2a$11$BOT07eebca3fae3e84bb4196f62ce5ff6ca8575831ec6ea487639', 'Kenji', 'Young', '+13805492182', 1, true, true, 'bot_placeholder', NOW() - interval '83 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('28341c9b-5055-482f-aa36-0924b26cfbc7', 'e166671e-0227-467a-b322-778e4136d18a', 35.00, 6, 'Athletic shot-stopper with years of competitive experience.', 49.2714, -123.0597, 15, 3.6, 73, 68, true, NOW() - interval '118 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2e521090-6e99-4d22-8115-d72eb3d22033', 'paolo.gagné@bot.goaliefinder.local', '$2a$11$BOTcec8cb8c4abc8d0a1c977374708faaaf38262e4eb035223948', 'Paolo', 'Gagné', '+18841851316', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0cbfac5e-a782-4f07-944b-2a6e8aca3e02', '2e521090-6e99-4d22-8115-d72eb3d22033', 20.00, 3, 'Tall keeper with a long reach. Command the box effectively.', 49.2857, -123.1441, 15, 4.3, 6, 0, true, NOW() - interval '144 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fc89ea47-01c8-4631-be7d-544f42ae64fa', 'mathieu.miller@bot.goaliefinder.local', '$2a$11$BOTa6dfd49ec392bea5de9b87edd028b81836d88a0c0ac3ced866', 'Mathieu', 'Miller', '+19354423989', 1, true, true, 'bot_placeholder', NOW() - interval '59 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b0bc6962-05ae-481c-812a-5aa8457aad09', 'fc89ea47-01c8-4631-be7d-544f42ae64fa', 25.00, 15, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 49.2405, -123.1229, 15, 3.5, 7, 0, true, NOW() - interval '158 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b422c418-7a8c-4fd4-a76c-c964df2a4e70', 'connor.garcia@bot.goaliefinder.local', '$2a$11$BOT0c90ffb8e41c3cefaabfa1194ef86c03f05bf8502e89c3aa6d', 'Connor', 'Garcia', '+17795262860', 1, true, true, 'bot_placeholder', NOW() - interval '25 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('15c1dfc4-8b33-463c-a817-3b491e2050a0', 'b422c418-7a8c-4fd4-a76c-c964df2a4e70', 50.00, 11, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 49.234, -123.1311, 30, 4.1, 63, 56, true, NOW() - interval '37 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0c32d11d-8508-4a90-9795-da0e4993c831', 'james.tremblay@bot.goaliefinder.local', '$2a$11$BOTa62e2aa1281f63fc1270c053af31b20ecf97fafcdea55601b0', 'James', 'Tremblay', '+12463420750', 1, true, true, 'bot_placeholder', NOW() - interval '37 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('743e1308-fdd5-4a80-a573-f8905904333c', '0c32d11d-8508-4a90-9795-da0e4993c831', 20.00, 12, 'Passionate about the game. Consistent and dependable between the posts.', 49.3166, -123.1403, 25, 4.9, 85, 76, true, NOW() - interval '150 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0c730eb4-0622-4053-ba7a-fbc21fdedfcc', 'james.oliveira@bot.goaliefinder.local', '$2a$11$BOT7c41df7cc049c48f551a1769e7f89e60bd93c045c2db402983', 'James', 'Oliveira', '+15892235500', 1, true, true, 'bot_placeholder', NOW() - interval '69 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d0b94742-2431-4f59-ab64-f8ff9f110e6c', '0c730eb4-0622-4053-ba7a-fbc21fdedfcc', 15.00, 7, 'Played keeper since I was 12. Quick feet and safe hands.', 49.2866, -123.1594, 25, 3.8, 58, 38, true, NOW() - interval '56 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('aa333dd9-8d7d-4aeb-a0e2-8bd2ada210e5', 'hugo.khan@bot.goaliefinder.local', '$2a$11$BOTb1c05b8911a705e5b0210c54fba8081df3276c44cbe037653c', 'Hugo', 'Khan', '+12741981457', 1, true, true, 'bot_placeholder', NOW() - interval '8 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e5261d33-172b-413c-91ea-15a2fc88475d', 'aa333dd9-8d7d-4aeb-a0e2-8bd2ada210e5', 25.00, 12, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.3282, -123.1459, 15, 5.0, 46, 27, true, NOW() - interval '110 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1bbb90ce-027c-4a87-bf5b-0f8dd2d3e4c2', 'hector.fortin@bot.goaliefinder.local', '$2a$11$BOTf87d730910f6eb6611f15370813863ffd642ebc47385f5c391', 'Hector', 'Fortin', '+17252395834', 1, true, true, 'bot_placeholder', NOW() - interval '115 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0fe131f9-2c69-4dc2-8dac-50489e6ce9a0', '1bbb90ce-027c-4a87-bf5b-0f8dd2d3e4c2', 15.00, 1, 'Former academy goalkeeper, now playing recreational leagues.', 49.2795, -123.0461, 10, 4.3, 72, 52, true, NOW() - interval '54 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5ade662c-7422-49c7-b7ee-f038a7247245', 'roberto.diallo@bot.goaliefinder.local', '$2a$11$BOT8092ca6ec5190717666e57858c14346ebd591780d6327f5489', 'Roberto', 'Diallo', '+19396690737', 1, true, true, 'bot_placeholder', NOW() - interval '146 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0700fd65-251b-48ed-aaf3-11fee26e56a5', '5ade662c-7422-49c7-b7ee-f038a7247245', 30.00, 13, 'Former academy goalkeeper, now playing recreational leagues.', 49.2703, -123.1327, 15, 4.2, 22, 5, true, NOW() - interval '154 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('efe66d87-1e90-49a3-b3c0-2883a67d566c', 'ryan.park@bot.goaliefinder.local', '$2a$11$BOTc10b21c1bfd76ab82c447a647176cfa963882a71522b61c89c', 'Ryan', 'Park', '+13004803616', 1, true, true, 'bot_placeholder', NOW() - interval '53 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a1f10546-e63d-471a-a247-18061c945bcf', 'efe66d87-1e90-49a3-b3c0-2883a67d566c', 15.00, 5, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 49.2566, -123.1706, 30, 4.4, 37, 20, true, NOW() - interval '140 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5df8f130-85a0-4644-b0b7-56804214be7f', 'carlos.white@bot.goaliefinder.local', '$2a$11$BOTbc9e4be4667229c4885b24c42b9cceee4a7cd0c4a5178e8e94', 'Carlos', 'White', '+12402567606', 1, true, true, 'bot_placeholder', NOW() - interval '166 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0527688a-ff98-4543-a577-be4e5c27c314', '5df8f130-85a0-4644-b0b7-56804214be7f', 30.00, 14, 'Experienced keeper with quick reflexes and strong communication skills.', 49.2502, -123.1197, 20, 4.9, 55, 49, true, NOW() - interval '98 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('82e79c88-bdf3-48c0-95ba-bd02a865d1e9', 'santiago.tremblay@bot.goaliefinder.local', '$2a$11$BOTe4708f245a94555db9eab84daccc0b273db13fed2ac6055c12', 'Santiago', 'Tremblay', '+18506998787', 1, true, true, 'bot_placeholder', NOW() - interval '22 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('16691820-2120-4db9-8b1e-28d8d90a858c', '82e79c88-bdf3-48c0-95ba-bd02a865d1e9', 50.00, 12, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 49.2511, -123.1592, 30, 3.9, 30, 13, true, NOW() - interval '134 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e84f1071-7eee-40ce-8da3-eee724051b3d', 'hugo.jones@bot.goaliefinder.local', '$2a$11$BOT005bf96cfb454e5169f31c6260e72a39d7077a3cc1cda50e55', 'Hugo', 'Jones', '+19694185019', 1, true, true, 'bot_placeholder', NOW() - interval '153 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ca6b7bca-3c4c-4ac3-aad5-b4d91fe8c8ff', 'e84f1071-7eee-40ce-8da3-eee724051b3d', 25.00, 3, 'Provincial-level experience. Strong with high balls and one-on-ones.', 49.25, -123.0638, 20, 4.9, 73, 73, true, NOW() - interval '98 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('73f777b0-fec1-4c77-bf7b-77ef353994c5', 'lucas.morin@bot.goaliefinder.local', '$2a$11$BOT79c9d47956ac03a62086765be720d889e3f44d0e1b2c67165e', 'Lucas', 'Morin', '+15279745268', 1, true, true, 'bot_placeholder', NOW() - interval '117 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8aac8864-3eaf-4c8b-8452-372b104404db', '73f777b0-fec1-4c77-bf7b-77ef353994c5', 30.00, 9, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.254, -123.1859, 30, 4.3, 63, 59, true, NOW() - interval '25 days', NOW());
-- === Surrey (22 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('da6e42f2-2bc5-4c0b-82af-68b1d1af7120', 'jayden.martinez@bot.goaliefinder.local', '$2a$11$BOT2faeda6cc5f9bf7e24095c397ff868bd3d64bb1c551c0ed988', 'Jayden', 'Martinez', '+12352783233', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9443132f-9bd4-4e79-8742-22243852c67b', 'da6e42f2-2bc5-4c0b-82af-68b1d1af7120', 45.00, 14, 'Friendly and competitive. Great at organizing the defense.', 49.2471, -122.8364, 10, 4.1, 39, 30, true, NOW() - interval '128 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a7f6bc2a-60e9-4bc8-9841-0a81cc140bf6', 'luis.king@bot.goaliefinder.local', '$2a$11$BOT8b9343280efe61def382dd78a9421e7eb5054d2d53900d1917', 'Luis', 'King', '+17374274230', 1, true, true, 'bot_placeholder', NOW() - interval '171 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0df5ddd8-f490-449d-8328-b20612c7e1f3', 'a7f6bc2a-60e9-4bc8-9841-0a81cc140bf6', 40.00, 1, 'University-level goalkeeper looking for extra matches.', 49.2287, -122.8665, 25, 4.6, 27, 23, true, NOW() - interval '3 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7db28266-4444-4790-9c47-e22017366cd7', 'pierre.smith@bot.goaliefinder.local', '$2a$11$BOT5b341fe59df91f5e764454ad6fce76ae98e633fe348f6374ca', 'Pierre', 'Smith', '+15827054257', 1, true, true, 'bot_placeholder', NOW() - interval '83 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('131da1c7-05c0-4158-8855-7b29a06cb048', '7db28266-4444-4790-9c47-e22017366cd7', 25.00, 1, 'Experienced keeper with quick reflexes and strong communication skills.', 49.196, -122.8506, 20, 4.4, 85, 77, true, NOW() - interval '5 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e03df2db-8c5c-4bb4-a0db-8dfc9ee6fe45', 'fernando.green@bot.goaliefinder.local', '$2a$11$BOTf9fe6d18bfc2e2439e211146bd366a42c06ae4887a5aefd090', 'Fernando', 'Green', '+19769277180', 1, true, true, 'bot_placeholder', NOW() - interval '81 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0f9cea33-9f61-44a5-a6e8-e93797bf19e1', 'e03df2db-8c5c-4bb4-a0db-8dfc9ee6fe45', 25.00, 15, 'Reliable shot-stopper available for weekend and weekday games.', 49.1923, -122.8519, 15, 3.9, 8, 0, true, NOW() - interval '169 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6809cd8d-1fae-4bec-8286-7e0411c4a3e5', 'sergio.young@bot.goaliefinder.local', '$2a$11$BOT27f3d4cde944999368d32d7f60c1469ce0145bdcff353ecd05', 'Sergio', 'Young', '+19835037879', 1, true, true, 'bot_placeholder', NOW() - interval '77 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('65e563a8-b99b-422d-b60c-75ef335970d3', '6809cd8d-1fae-4bec-8286-7e0411c4a3e5', 30.00, 12, 'Experienced keeper with quick reflexes and strong communication skills.', 49.1878, -122.8089, 20, 3.5, 27, 27, true, NOW() - interval '101 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('71768928-e4a2-47a4-ab93-f72abd4d8980', 'carlos.santos@bot.goaliefinder.local', '$2a$11$BOT9fc26387c912af84c8f1c4ce91e2b5ef274b8da1f1551dadfc', 'Carlos', 'Santos', '+12436749117', 1, true, true, 'bot_placeholder', NOW() - interval '92 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4a85a1a8-ba4c-45df-a0cd-38d3157a6403', '71768928-e4a2-47a4-ab93-f72abd4d8980', 40.00, 2, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 49.2433, -122.792, 10, 3.5, 23, 3, true, NOW() - interval '29 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('551d57bf-6afb-4e85-b825-4ce3800a184d', 'caleb.garcia@bot.goaliefinder.local', '$2a$11$BOTfd4bb0e4f5387b10af4d9e97f2c5074937aabfed688baf092c', 'Caleb', 'Garcia', '+12683805323', 1, true, true, 'bot_placeholder', NOW() - interval '139 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('066bd402-5bae-4c48-963c-b2b370855c26', '551d57bf-6afb-4e85-b825-4ce3800a184d', 30.00, 13, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.1506, -122.8282, 25, 4.0, 56, 43, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e3d00f12-7110-4979-ae4e-42d85239177a', 'jayden.turner@bot.goaliefinder.local', '$2a$11$BOTacebea22b6e6e33f9a15e01e8f54223ff64d112b853161d1d2', 'Jayden', 'Turner', '+15618120689', 1, true, true, 'bot_placeholder', NOW() - interval '40 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4b94cfeb-b971-4595-a224-5b829efbe91b', 'e3d00f12-7110-4979-ae4e-42d85239177a', 30.00, 4, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 49.1427, -122.844, 25, 4.1, 11, 0, true, NOW() - interval '119 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5329cb56-51ee-454c-8e5b-d7f22fc6bc4a', 'ravi.tremblay@bot.goaliefinder.local', '$2a$11$BOT40eced80fd9e43190be964232eccde5f23512423533db4c8d5', 'Ravi', 'Tremblay', '+15046043559', 1, true, true, 'bot_placeholder', NOW() - interval '9 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2dc61131-0951-4f6f-93ee-d4c3ef28063e', '5329cb56-51ee-454c-8e5b-d7f22fc6bc4a', 30.00, 5, 'Calm under pressure. Played competitive soccer for 8 years.', 49.2154, -122.9084, 30, 3.6, 28, 23, true, NOW() - interval '133 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e0556602-22b6-4e8e-b6df-589fb81aa49a', 'isaac.rodriguez@bot.goaliefinder.local', '$2a$11$BOTe971539f7fe24b8f5328b284a1a556bd2de90d7595b8cfbb0e', 'Isaac', 'Rodriguez', '+15689178754', 1, true, true, 'bot_placeholder', NOW() - interval '157 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1b513d3e-fb7e-4ad6-b7fa-5b954d7edd81', 'e0556602-22b6-4e8e-b6df-589fb81aa49a', 45.00, 12, 'Retired semi-pro goalkeeper. Still got it!', 49.1779, -122.8201, 10, 3.5, 36, 22, true, NOW() - interval '73 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3fc9b131-800e-4c0f-a365-18258e040edc', 'jason.lewis@bot.goaliefinder.local', '$2a$11$BOT6209cf9593bead5ad1073c6ad6834ef0c5d97422aabad3325a', 'Jason', 'Lewis', '+14129688914', 1, true, true, 'bot_placeholder', NOW() - interval '112 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('818681c6-cc55-4bf7-8d66-a06b829a44d6', '3fc9b131-800e-4c0f-a365-18258e040edc', 45.00, 2, 'Calm under pressure. Played competitive soccer for 8 years.', 49.1954, -122.7998, 15, 3.5, 85, 80, true, NOW() - interval '170 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5d6fe135-02cf-4c1a-9a09-02849d89d4dc', 'nathan.scott@bot.goaliefinder.local', '$2a$11$BOTc10019494b4387acd758def0f2b2bd3872d51c188d038c2981', 'Nathan', 'Scott', '+18983823472', 1, true, true, 'bot_placeholder', NOW() - interval '48 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4600ce39-7af3-4d91-8177-3b3eeae1749e', '5d6fe135-02cf-4c1a-9a09-02849d89d4dc', 20.00, 13, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 49.2209, -122.862, 20, 4.1, 8, 2, true, NOW() - interval '91 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6fdfdef9-e14c-42c1-8cec-635cb1163347', 'sebastian.flores@bot.goaliefinder.local', '$2a$11$BOT1c2907186cb13822b4e73058be28aa3932db7113e5c487a3ef', 'Sebastian', 'Flores', '+18172392733', 1, true, true, 'bot_placeholder', NOW() - interval '36 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9ae0837c-0a13-4130-b3b1-e88573a965c9', '6fdfdef9-e14c-42c1-8cec-635cb1163347', 50.00, 1, 'Retired semi-pro goalkeeper. Still got it!', 49.1705, -122.8759, 20, 3.8, 3, 0, true, NOW() - interval '52 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7a968acf-855b-4bcb-84cc-87ab1c985271', 'mateo.anderson@bot.goaliefinder.local', '$2a$11$BOTbf1499de379abd9720c73611fe15634bb1b269fa41cc55b523', 'Mateo', 'Anderson', '+12207053356', 1, true, true, 'bot_placeholder', NOW() - interval '84 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1cc6d24b-9e84-4045-9022-d5f0b3dfc92a', '7a968acf-855b-4bcb-84cc-87ab1c985271', 25.00, 3, 'Athletic shot-stopper with years of competitive experience.', 49.2436, -122.8563, 20, 3.6, 20, 7, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('27a1919d-7522-4d13-ac8f-a142cf5f4f20', 'brandon.santos@bot.goaliefinder.local', '$2a$11$BOT37d6bf05c3bd4b344fa33bc1e9814f6a1d9b896d5cea9edb5f', 'Brandon', 'Santos', '+18384847187', 1, true, true, 'bot_placeholder', NOW() - interval '34 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5fc56bfb-6eb9-499f-80d2-89df07e9304b', '27a1919d-7522-4d13-ac8f-a142cf5f4f20', 40.00, 14, 'Played keeper since I was 12. Quick feet and safe hands.', 49.1802, -122.8436, 10, 4.9, 22, 18, true, NOW() - interval '44 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1a356e43-c891-4d53-98d8-7aad3acc28f3', 'raul.evans@bot.goaliefinder.local', '$2a$11$BOTdeca25c8adce61544edd8af7cfb02bc35c31102af2911bba7c', 'Raul', 'Evans', '+15874976515', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('92305d1c-9bf9-4dd9-8543-2ab4c548b8a7', '1a356e43-c891-4d53-98d8-7aad3acc28f3', 35.00, 15, 'Calm under pressure. Played competitive soccer for 8 years.', 49.2156, -122.8421, 15, 3.9, 79, 60, true, NOW() - interval '4 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e8588d57-ed65-4700-9dde-d8373a08bf09', 'justin.turner@bot.goaliefinder.local', '$2a$11$BOT4f0a3f03563479fe49adfb36cd4730cb5cd992812bd4f52d96', 'Justin', 'Turner', '+12262446775', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('13dc282e-3a0a-4855-b4cc-0e791eb58008', 'e8588d57-ed65-4700-9dde-d8373a08bf09', 40.00, 12, 'Technical goalkeeper who loves playing out from the back.', 49.2304, -122.8017, 20, 4.1, 37, 18, true, NOW() - interval '14 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ba8f35df-a801-4565-beeb-406b96f5dce3', 'vikram.baker@bot.goaliefinder.local', '$2a$11$BOT032ddd66516d974b14bfe23929b89facf1f1f3a53a46898b71', 'Vikram', 'Baker', '+16452020972', 1, true, true, 'bot_placeholder', NOW() - interval '179 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f98f1bab-cacc-4953-9ce9-26c7f2860dda', 'ba8f35df-a801-4565-beeb-406b96f5dce3', 40.00, 15, 'Played keeper since I was 12. Quick feet and safe hands.', 49.2299, -122.9144, 15, 4.1, 38, 27, true, NOW() - interval '144 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a085071a-dfc9-440e-a316-3f7e6f2093ad', 'alberto.ahmed@bot.goaliefinder.local', '$2a$11$BOTf903aefa739844d42dcc11cce326e568de099ae94f464d6b71', 'Alberto', 'Ahmed', '+13558027835', 1, true, true, 'bot_placeholder', NOW() - interval '135 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cb028650-a60c-431d-a4b1-348db5acce85', 'a085071a-dfc9-440e-a316-3f7e6f2093ad', 30.00, 13, 'New to the city and looking to play as much as possible.', 49.17, -122.9277, 20, 4.8, 29, 16, true, NOW() - interval '130 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('77657b28-48d2-48e2-b933-68cbfb945a0f', 'andres.lavoie@bot.goaliefinder.local', '$2a$11$BOT831970b8e473625018e506f0fc296378ba35e4f72cda97b2e4', 'Andres', 'Lavoie', '+15766011028', 1, true, true, 'bot_placeholder', NOW() - interval '7 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b1dfbd7a-814e-4909-8ec9-7a4c5c31c51a', '77657b28-48d2-48e2-b933-68cbfb945a0f', 20.00, 6, 'New to the city and looking to play as much as possible.', 49.1602, -122.8257, 10, 3.9, 72, 54, true, NOW() - interval '120 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8330ee62-3593-40a0-89f3-308f46443c17', 'emilio.suzuki@bot.goaliefinder.local', '$2a$11$BOT7fdf89aa65754a10948091376e9c2bf6c5e429d7b8aaa8dc32', 'Emilio', 'Suzuki', '+13193224318', 1, true, true, 'bot_placeholder', NOW() - interval '52 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1c653f7e-a560-41a3-be94-0c8c4e6af7ee', '8330ee62-3593-40a0-89f3-308f46443c17', 20.00, 9, 'Weekend warrior goalkeeper. Love the beautiful game!', 49.1551, -122.8677, 30, 3.8, 43, 38, true, NOW() - interval '80 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('be873c09-37f4-4806-aeed-f4a5b3b8a981', 'andrew.miller@bot.goaliefinder.local', '$2a$11$BOTb2ebc118123f75ae963835ac77ea58b36fefff1bdb65707d13', 'Andrew', 'Miller', '+13634231190', 1, true, true, 'bot_placeholder', NOW() - interval '55 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ce747d1e-097d-42fb-a072-0fb51a7c6f7c', 'be873c09-37f4-4806-aeed-f4a5b3b8a981', 25.00, 13, 'Provincial-level experience. Strong with high balls and one-on-ones.', 49.237, -122.8259, 30, 4.1, 8, 0, true, NOW() - interval '67 days', NOW());
-- === Richmond (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6680183b-6f68-4c26-b82a-8b861f453499', 'owen.perez@bot.goaliefinder.local', '$2a$11$BOT166dd5eff04a60fc853dc9a71961ec8fc1cdf28abc8fd92ec9', 'Owen', 'Perez', '+14292974248', 1, true, true, 'bot_placeholder', NOW() - interval '25 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('45b8c165-1d6d-4e3e-81c1-675f32bb2232', '6680183b-6f68-4c26-b82a-8b861f453499', 30.00, 14, 'Strong penalty saver. Calm and focused under pressure.', 49.1532, -123.1646, 10, 3.6, 2, 2, true, NOW() - interval '34 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4db424d8-8f66-4bdb-ac50-7eeed832f288', 'jae.cruz@bot.goaliefinder.local', '$2a$11$BOTa3d56a9aaf286b427f0eb1dcf5e140c290294f9d4847ee1e9b', 'Jae', 'Cruz', '+19228618309', 1, true, true, 'bot_placeholder', NOW() - interval '176 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('88dd7835-7048-4207-a5ff-d760728f9b31', '4db424d8-8f66-4bdb-ac50-7eeed832f288', 45.00, 12, 'Weekend warrior goalkeeper. Love the beautiful game!', 49.1761, -123.0712, 15, 4.7, 1, 0, true, NOW() - interval '1 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e06e8c1a-be1a-4621-917e-bc741a65cf28', 'ethan.chukwu@bot.goaliefinder.local', '$2a$11$BOT2425bdb3099bbd2a057028f065054c28646280d43e63efe5a8', 'Ethan', 'Chukwu', '+16169913828', 1, true, true, 'bot_placeholder', NOW() - interval '164 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('483ff02b-a799-485a-b0dc-d3c542e0d206', 'e06e8c1a-be1a-4621-917e-bc741a65cf28', 20.00, 10, 'Friendly and competitive. Great at organizing the defense.', 49.1855, -123.1532, 20, 3.7, 81, 77, true, NOW() - interval '154 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fc229494-5efa-4c48-9e76-a516840aa349', 'jun.roy@bot.goaliefinder.local', '$2a$11$BOT153cc75171dcc192c8dd535f44bf0651d15160eebc7b8d90fd', 'Jun', 'Roy', '+12889194449', 1, true, true, 'bot_placeholder', NOW() - interval '49 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d0e86c0a-34ca-485a-b240-bb0e4d866cd3', 'fc229494-5efa-4c48-9e76-a516840aa349', 25.00, 6, 'Reliable shot-stopper available for weekend and weekday games.', 49.1314, -123.1103, 20, 4.9, 59, 48, true, NOW() - interval '43 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('59f9409f-f897-432b-b8dc-def840007e77', 'owen.gagné@bot.goaliefinder.local', '$2a$11$BOTc92ccee837f69a0d356f37005cfa69f2252cea4cba52fd4484', 'Owen', 'Gagné', '+12655601757', 1, true, true, 'bot_placeholder', NOW() - interval '111 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('eb0021dc-8777-4540-b889-c72f2c8386c6', '59f9409f-f897-432b-b8dc-def840007e77', 30.00, 3, 'Retired semi-pro goalkeeper. Still got it!', 49.2239, -123.12, 10, 3.5, 55, 47, true, NOW() - interval '21 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('47b0efb9-a4cd-4c12-82cc-80d15817a2f9', 'guillaume.moore@bot.goaliefinder.local', '$2a$11$BOT29609a674074371ec0d01ca35a10be141e815acfb75d75369e', 'Guillaume', 'Moore', '+15537054644', 1, true, true, 'bot_placeholder', NOW() - interval '163 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fbe0b290-f1fa-4f0d-bdb4-b7131ccedbb0', '47b0efb9-a4cd-4c12-82cc-80d15817a2f9', 30.00, 7, 'Versatile keeper, great with distribution and organizing the back line.', 49.1573, -123.2105, 25, 3.7, 32, 27, true, NOW() - interval '174 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('291dbf90-fd67-4174-aae4-10fe93143054', 'hector.roy@bot.goaliefinder.local', '$2a$11$BOT77cf10a62f29838aa98f7ddaca86227537c36830d5a582ea6f', 'Hector', 'Roy', '+18035887847', 1, true, true, 'bot_placeholder', NOW() - interval '48 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e7d5886d-1c94-4362-9bf5-d2f9ceeacc19', '291dbf90-fd67-4174-aae4-10fe93143054', 30.00, 10, 'Experienced keeper with quick reflexes and strong communication skills.', 49.2094, -123.0852, 10, 3.7, 28, 23, true, NOW() - interval '60 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('57639e1c-ea6a-4375-9598-7eb166af4c6e', 'carlos.smith@bot.goaliefinder.local', '$2a$11$BOT913da06bf6d5441392be9f05b115eeda2161331efd03a6430a', 'Carlos', 'Smith', '+16233895101', 1, true, true, 'bot_placeholder', NOW() - interval '84 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ee66b412-8f9d-4668-ba1f-81ae43ccc786', '57639e1c-ea6a-4375-9598-7eb166af4c6e', 15.00, 12, 'Calm under pressure. Played competitive soccer for 8 years.', 49.2157, -123.0604, 25, 3.9, 57, 51, true, NOW() - interval '100 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0264ff4a-830d-447d-8104-950f3e88994d', 'daniel.castillo@bot.goaliefinder.local', '$2a$11$BOTa4fbebd5acf60912ff4cf5f937166fb90e298005a97bc4e540', 'Daniel', 'Castillo', '+13469409330', 1, true, true, 'bot_placeholder', NOW() - interval '153 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('58e3d6dc-035f-462f-a3e0-bc089289abb1', '0264ff4a-830d-447d-8104-950f3e88994d', 25.00, 15, 'University-level goalkeeper looking for extra matches.', 49.1326, -123.0895, 20, 4.0, 15, 2, true, NOW() - interval '152 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c5d6beb8-aa6e-462f-8c03-2f0f996d5c43', 'miguel.ali@bot.goaliefinder.local', '$2a$11$BOTf636379e0281b4d292fc3754259564faa930ef8d3e42dc8c47', 'Miguel', 'Ali', '+19178684713', 1, true, true, 'bot_placeholder', NOW() - interval '100 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('18c0c3e8-6702-4984-9eef-4ed028c737ba', 'c5d6beb8-aa6e-462f-8c03-2f0f996d5c43', 15.00, 2, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 49.1457, -123.193, 20, 4.3, 17, 7, true, NOW() - interval '103 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('059ee764-40ac-4a23-a646-5255d84d9db1', 'dylan.reyes@bot.goaliefinder.local', '$2a$11$BOTfb6ccea4c0bcee2c79a1e83a45c7f148509182f3b070fa3ff4', 'Dylan', 'Reyes', '+17115476074', 1, true, true, 'bot_placeholder', NOW() - interval '153 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6b82c92c-1b8b-44c8-8143-af8f5f53a6c4', '059ee764-40ac-4a23-a646-5255d84d9db1', 15.00, 7, 'Fast and agile. Best on turf and indoor surfaces.', 49.1234, -123.1072, 25, 5.0, 9, 0, true, NOW() - interval '105 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('854209be-1179-4929-9615-92bb894673e1', 'vikram.osei@bot.goaliefinder.local', '$2a$11$BOT6b810d86387e6150010d7743796b7b15465fd56d2d3bbba03a', 'Vikram', 'Osei', '+13145553987', 1, true, true, 'bot_placeholder', NOW() - interval '22 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1cd33b96-b71b-40c7-9b17-112f7b299b5d', '854209be-1179-4929-9615-92bb894673e1', 25.00, 12, 'Available for last-minute bookings. Always match-ready.', 49.2048, -123.1256, 30, 4.1, 79, 59, true, NOW() - interval '42 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3388e155-fd41-4084-9a5a-87092609cdf1', 'guillaume.rodriguez@bot.goaliefinder.local', '$2a$11$BOT0f610f41db8389cf1fcc52ee9c610618956dc0e0f5ebb9ee28', 'Guillaume', 'Rodriguez', '+17354529600', 1, true, true, 'bot_placeholder', NOW() - interval '32 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('24e4b40c-4967-4fce-bf06-3765d49085a4', '3388e155-fd41-4084-9a5a-87092609cdf1', 45.00, 4, 'Athletic shot-stopper with years of competitive experience.', 49.1077, -123.1127, 20, 4.0, 49, 48, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('44bf479e-3716-4ddc-a028-3ecf0b1759f5', 'owen.oliveira@bot.goaliefinder.local', '$2a$11$BOT4188dbde2de41f558d30b9aa701293027c41cb6c364cfec2c9', 'Owen', 'Oliveira', '+15355505054', 1, true, true, 'bot_placeholder', NOW() - interval '151 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9b31dc26-e34c-449c-b045-b9580b3feb96', '44bf479e-3716-4ddc-a028-3ecf0b1759f5', 20.00, 7, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 49.1134, -123.126, 20, 4.7, 9, 0, true, NOW() - interval '25 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('de87e725-4c4c-46a0-a54f-9aa30dd95ad5', 'yousef.chukwu@bot.goaliefinder.local', '$2a$11$BOT8faff49894df04dbf2c992beef53027af41aeb64acffaad7d9', 'Yousef', 'Chukwu', '+18411928829', 1, true, true, 'bot_placeholder', NOW() - interval '7 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8e9b644e-36a5-4ebe-b37d-784e496c6c01', 'de87e725-4c4c-46a0-a54f-9aa30dd95ad5', 40.00, 5, 'Tall keeper with a long reach. Command the box effectively.', 49.2073, -123.1529, 20, 4.9, 64, 59, true, NOW() - interval '139 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('39b5adfb-6cda-4619-986b-2ef9dc0b3c47', 'brian.white@bot.goaliefinder.local', '$2a$11$BOTa29c5df8780d11785c0888dcd2d97b5880f0067800164b2350', 'Brian', 'White', '+18113879044', 1, true, true, 'bot_placeholder', NOW() - interval '54 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('65e911a4-cbe2-4a83-b12b-03849f9710ca', '39b5adfb-6cda-4619-986b-2ef9dc0b3c47', 30.00, 6, 'Versatile keeper, great with distribution and organizing the back line.', 49.1113, -123.1979, 20, 4.3, 10, 0, true, NOW() - interval '149 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('78d60a1b-ade2-469d-b24f-d4464ba812d9', 'benjamin.collins@bot.goaliefinder.local', '$2a$11$BOT7d8c0f21510c3f72663112bd7999067500b3d1c649312d1dad', 'Benjamin', 'Collins', '+12371310669', 1, true, true, 'bot_placeholder', NOW() - interval '110 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6567da00-cca0-4133-87fb-da7a1da784cc', '78d60a1b-ade2-469d-b24f-d4464ba812d9', 35.00, 6, 'Strong penalty saver. Calm and focused under pressure.', 49.1657, -123.1629, 15, 5.0, 10, 1, true, NOW() - interval '37 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('11d095d3-7107-4a55-bde2-38cf18289d1e', 'carter.scott@bot.goaliefinder.local', '$2a$11$BOT339e9dfc8e3d0f0e9cbe4ff8b33c6fc9e71b43583db1e9c05f', 'Carter', 'Scott', '+13446518157', 1, true, true, 'bot_placeholder', NOW() - interval '78 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7b790104-4179-4403-b28e-a0018552cd91', '11d095d3-7107-4a55-bde2-38cf18289d1e', 35.00, 12, 'Retired semi-pro goalkeeper. Still got it!', 49.1354, -123.1699, 20, 3.5, 12, 10, true, NOW() - interval '31 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f24ec37f-0acb-4701-a1ae-6db74b170ed2', 'rafael.ramirez@bot.goaliefinder.local', '$2a$11$BOTff98d70274db6fc01c9fefb01ffa9df2db174ea12ada8de57f', 'Rafael', 'Ramirez', '+16209400679', 1, true, true, 'bot_placeholder', NOW() - interval '168 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('da39f520-b5f6-4d4f-83a0-6ecd46e0dafc', 'f24ec37f-0acb-4701-a1ae-6db74b170ed2', 30.00, 9, 'Tall keeper with a long reach. Command the box effectively.', 49.1639, -123.1742, 15, 3.8, 60, 50, true, NOW() - interval '143 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('70c716fe-fa86-4c9b-bfff-4e792e80cac7', 'alexandre.tremblay@bot.goaliefinder.local', '$2a$11$BOTdfde34c6a7d8745e315e24e1b90bf168a9aa4b05c0efadbd7a', 'Alexandre', 'Tremblay', '+18985671556', 1, true, true, 'bot_placeholder', NOW() - interval '98 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('12738b3b-d535-4d83-b68c-75ddd745425c', '70c716fe-fa86-4c9b-bfff-4e792e80cac7', 40.00, 9, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 49.1161, -123.0588, 20, 4.4, 67, 50, true, NOW() - interval '123 days', NOW());
-- === Montreal (25 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6587c6bc-3bce-43c4-825b-01e16a0dcd90', 'emilio.castillo@bot.goaliefinder.local', '$2a$11$BOT6c3ff0a64c6c66c992e470c10cb95ec6e5af4f060eff40ba07', 'Emilio', 'Castillo', '+14857823953', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5d8226a6-fb8b-4f5d-9d1a-192a6284f267', '6587c6bc-3bce-43c4-825b-01e16a0dcd90', 20.00, 4, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 45.4921, -73.629, 15, 4.6, 10, 4, true, NOW() - interval '130 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('55eb9342-9e3e-4484-9c40-78a86d4155b3', 'david.scott@bot.goaliefinder.local', '$2a$11$BOT277ac1cc65291c4c4ead53ad49234a414aac524d4fe146bf04', 'David', 'Scott', '+15073052319', 1, true, true, 'bot_placeholder', NOW() - interval '176 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('694c716e-a84e-4b36-886e-b9d180b25a46', '55eb9342-9e3e-4484-9c40-78a86d4155b3', 15.00, 9, 'Friendly and competitive. Great at organizing the defense.', 45.5398, -73.5335, 30, 4.6, 21, 13, true, NOW() - interval '11 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('361be8fd-198f-47d2-a63f-e08ebdb482cb', 'min.singh@bot.goaliefinder.local', '$2a$11$BOTbd01a1b1239d109b4837e6baaa5dce3678b55a30391f16281c', 'Min', 'Singh', '+14757073040', 1, true, true, 'bot_placeholder', NOW() - interval '109 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9e47b1e0-e981-4ea3-9742-0d13cad176c1', '361be8fd-198f-47d2-a63f-e08ebdb482cb', 25.00, 4, 'Calm under pressure. Played competitive soccer for 8 years.', 45.4927, -73.5551, 20, 3.8, 81, 64, true, NOW() - interval '154 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6b1271b8-561d-4d2b-bb6b-142b12e89c46', 'tyler.mohamed@bot.goaliefinder.local', '$2a$11$BOT98ef5fc817d0f8c6bf0ad9e752428916237600110dbc143a67', 'Tyler', 'Mohamed', '+13444402837', 1, true, true, 'bot_placeholder', NOW() - interval '123 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d076c250-7dcf-48d1-9a55-5d2f1e490dff', '6b1271b8-561d-4d2b-bb6b-142b12e89c46', 15.00, 2, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 45.4678, -73.5715, 20, 4.2, 11, 7, true, NOW() - interval '71 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('45dde0a4-b420-4a7e-8e46-dafb1de22648', 'pierre.green@bot.goaliefinder.local', '$2a$11$BOT4ccce8217b671aa7663181db6e893d4530dda35203f7960c57', 'Pierre', 'Green', '+17484531534', 1, true, true, 'bot_placeholder', NOW() - interval '31 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('44fe455b-e8c1-45ea-8c94-5c27bea0cab3', '45dde0a4-b420-4a7e-8e46-dafb1de22648', 20.00, 4, 'Retired semi-pro goalkeeper. Still got it!', 45.5064, -73.5282, 25, 4.4, 37, 17, true, NOW() - interval '63 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a851728b-7ecb-42e0-8e76-4f2f302c9037', 'liam.okafor@bot.goaliefinder.local', '$2a$11$BOT7d849311cbe505d73ac0483ab450ae85ae23966429e54ff62f', 'Liam', 'Okafor', '+15447699949', 1, true, true, 'bot_placeholder', NOW() - interval '167 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('37c2cd4b-c7db-4531-8335-4299fee26443', 'a851728b-7ecb-42e0-8e76-4f2f302c9037', 25.00, 9, 'Reliable shot-stopper available for weekend and weekday games.', 45.5366, -73.5716, 20, 4.4, 11, 11, true, NOW() - interval '127 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5e4b643c-2663-45d4-a867-7ee8003210f1', 'kenji.moore@bot.goaliefinder.local', '$2a$11$BOT2b7ca6090bd5005d05179e9e15031ed04dfc3639de8aa6af4b', 'Kenji', 'Moore', '+15174197478', 1, true, true, 'bot_placeholder', NOW() - interval '169 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c1f05ee8-be41-4de5-98ec-9ab74666b401', '5e4b643c-2663-45d4-a867-7ee8003210f1', 45.00, 10, 'Retired semi-pro goalkeeper. Still got it!', 45.4894, -73.6276, 15, 4.2, 21, 21, true, NOW() - interval '41 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('de61d889-9576-4aa2-b8fa-39d30f073ed0', 'felipe.gagné@bot.goaliefinder.local', '$2a$11$BOTbdc64d285d78914998a9c505ac701cd25d8779cc5aa2441030', 'Felipe', 'Gagné', '+13818346271', 1, true, true, 'bot_placeholder', NOW() - interval '172 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a65a93fe-182f-45c1-b337-501b26683c5f', 'de61d889-9576-4aa2-b8fa-39d30f073ed0', 40.00, 14, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 45.4912, -73.5473, 25, 4.6, 2, 0, true, NOW() - interval '51 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('16449ba0-8a0b-4b07-a1a7-53b2051e586d', 'andres.miller@bot.goaliefinder.local', '$2a$11$BOT34e46910abc145d9c2b0faef4f36a23209b2293e8718fcfcbb', 'Andres', 'Miller', '+19336109138', 1, true, true, 'bot_placeholder', NOW() - interval '2 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ff80fab7-21b5-44c4-bf00-446ceaac1f86', '16449ba0-8a0b-4b07-a1a7-53b2051e586d', 35.00, 10, 'Fast and agile. Best on turf and indoor surfaces.', 45.4915, -73.5888, 20, 4.2, 48, 39, true, NOW() - interval '127 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('17dfb389-9568-404d-9422-0e2cfa207f1e', 'antoine.evans@bot.goaliefinder.local', '$2a$11$BOT7ab6cafdb383b48522d529e19edd45584735901cbe465c468a', 'Antoine', 'Evans', '+19339604406', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('cd7892ea-67da-46f4-9246-17f028f6adf8', '17dfb389-9568-404d-9422-0e2cfa207f1e', 45.00, 5, 'Technical goalkeeper who loves playing out from the back.', 45.4553, -73.5379, 15, 3.8, 7, 0, true, NOW() - interval '66 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('90241172-be7f-4508-90d9-58ce49a3936c', 'scott.kofi@bot.goaliefinder.local', '$2a$11$BOTa6e419ee19669fb03a372499e5a29555ea36bf100ee53680fb', 'Scott', 'Kofi', '+19016668124', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3c0bed70-3a9b-41ea-9eed-3676c4db7ef3', '90241172-be7f-4508-90d9-58ce49a3936c', 20.00, 3, 'Strong penalty saver. Calm and focused under pressure.', 45.5076, -73.6242, 15, 4.8, 59, 49, true, NOW() - interval '112 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('28359e05-93cf-4109-9ffa-d536dca42d40', 'jason.perez@bot.goaliefinder.local', '$2a$11$BOT944a3471c6f686b87618c3454baee516ef37ffa444e2016336', 'Jason', 'Perez', '+16867722189', 1, true, true, 'bot_placeholder', NOW() - interval '166 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4ad53779-a830-4387-b399-ea009e5ca6ca', '28359e05-93cf-4109-9ffa-d536dca42d40', 15.00, 3, 'Available for last-minute bookings. Always match-ready.', 45.4489, -73.6444, 15, 4.6, 14, 12, true, NOW() - interval '117 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('168c094c-8ef3-447e-9ab2-b6c5cd96de4a', 'connor.white@bot.goaliefinder.local', '$2a$11$BOTdeca892c000d8e5be162811bf3809b6b817ea8da3c6a69e8d2', 'Connor', 'White', '+13807140327', 1, true, true, 'bot_placeholder', NOW() - interval '42 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1b284e9b-f11a-49df-9fb8-6ca06fef34a5', '168c094c-8ef3-447e-9ab2-b6c5cd96de4a', 45.00, 2, 'Strong penalty saver. Calm and focused under pressure.', 45.5024, -73.5155, 15, 4.3, 3, 0, true, NOW() - interval '36 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('18d6e50c-c84b-4fb9-b362-f39d3003b281', 'wei.smith@bot.goaliefinder.local', '$2a$11$BOT891a553b066b1ee99a50cba0cf56069fc2fdb8fc26204e1d96', 'Wei', 'Smith', '+19201985768', 1, true, true, 'bot_placeholder', NOW() - interval '6 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6ce006d4-48b9-48d2-ae46-8ef854db3890', '18d6e50c-c84b-4fb9-b362-f39d3003b281', 25.00, 1, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 45.5607, -73.5179, 20, 4.8, 15, 0, true, NOW() - interval '132 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3bc41e3b-e357-43f6-ab41-361648f24924', 'sergio.wilson@bot.goaliefinder.local', '$2a$11$BOT1ae5348413a9aef74addca05cca7ab9f83853f0d978c0f3365', 'Sergio', 'Wilson', '+13131323141', 1, true, true, 'bot_placeholder', NOW() - interval '117 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5c2e028b-c2a5-4bb5-8259-186ef3a4d385', '3bc41e3b-e357-43f6-ab41-361648f24924', 25.00, 13, 'Tall keeper with a long reach. Command the box effectively.', 45.5204, -73.5821, 15, 4.0, 47, 36, true, NOW() - interval '167 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7f390a89-d8ff-4d46-a134-ba156748c19d', 'shane.walker@bot.goaliefinder.local', '$2a$11$BOT152ff6301b267fadd08392a6450a3caa4bba632d58628b0e7f', 'Shane', 'Walker', '+19827719520', 1, true, true, 'bot_placeholder', NOW() - interval '61 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2268ce6b-092f-4504-bc48-247dca907f6a', '7f390a89-d8ff-4d46-a134-ba156748c19d', 30.00, 15, 'Played keeper since I was 12. Quick feet and safe hands.', 45.5096, -73.5112, 30, 3.8, 73, 65, true, NOW() - interval '155 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e143532b-8adb-4f74-82a1-abd7c79dc44c', 'santiago.pelletier@bot.goaliefinder.local', '$2a$11$BOT656b64c0e05e9ae959730f793dd3f2af99e0c9124d2a554081', 'Santiago', 'Pelletier', '+19029066610', 1, true, true, 'bot_placeholder', NOW() - interval '151 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d0b320a2-f6fe-45b1-aff0-3d22be24c267', 'e143532b-8adb-4f74-82a1-abd7c79dc44c', 50.00, 10, 'Technical goalkeeper who loves playing out from the back.', 45.4857, -73.6072, 10, 4.7, 33, 15, true, NOW() - interval '57 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2187267a-207b-4862-ba23-361e98464a7b', 'ryan.young@bot.goaliefinder.local', '$2a$11$BOT4f7448c878bcee95ae915eb6fdd8e2e4dda452a51891897f20', 'Ryan', 'Young', '+17511568342', 1, true, true, 'bot_placeholder', NOW() - interval '109 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('787ae101-cf7c-440a-abcb-440148bb9ee7', '2187267a-207b-4862-ba23-361e98464a7b', 35.00, 2, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 45.507, -73.4898, 20, 3.9, 57, 48, true, NOW() - interval '94 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4acc300a-0d9e-4205-bee4-1349c8637127', 'derek.campbell@bot.goaliefinder.local', '$2a$11$BOT85dab778de4f76dbd77f70e654c5c7ed1854f380faaa67c0cf', 'Derek', 'Campbell', '+14274556977', 1, true, true, 'bot_placeholder', NOW() - interval '88 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c736315d-c289-4cf8-98b0-6d7b91f311f5', '4acc300a-0d9e-4205-bee4-1349c8637127', 45.00, 13, 'Retired semi-pro goalkeeper. Still got it!', 45.4662, -73.4965, 15, 3.7, 67, 50, true, NOW() - interval '83 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dff3be8e-3d97-4c2e-bc64-12390b59df8b', 'santiago.wilson@bot.goaliefinder.local', '$2a$11$BOTbd9a2e865cba185ade962a45c055728b027005306887fcf349', 'Santiago', 'Wilson', '+16064737016', 1, true, true, 'bot_placeholder', NOW() - interval '159 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5c00b8c3-9c1f-4dd0-939a-c0c7bb3c6984', 'dff3be8e-3d97-4c2e-bc64-12390b59df8b', 25.00, 14, 'Technical goalkeeper who loves playing out from the back.', 45.4998, -73.6229, 15, 3.7, 46, 29, true, NOW() - interval '113 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('49e81433-16f2-4565-8d02-7acc94e72feb', 'santiago.martinez@bot.goaliefinder.local', '$2a$11$BOTf8ae478ef52cde38a96250722c19be3663e6c2ffb96aec0408', 'Santiago', 'Martinez', '+19189246524', 1, true, true, 'bot_placeholder', NOW() - interval '132 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ade0a355-2ef0-49ce-9cc8-c03aeda7278b', '49e81433-16f2-4565-8d02-7acc94e72feb', 25.00, 5, 'Former academy goalkeeper, now playing recreational leagues.', 45.5613, -73.5245, 20, 4.4, 34, 14, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('df8d2fcc-82bd-4105-b4cb-b502a66984c1', 'wei.carter@bot.goaliefinder.local', '$2a$11$BOTeca6cbd60091180c9227e2a7fb0ae35b2181e0853810d23fe2', 'Wei', 'Carter', '+14622371999', 1, true, true, 'bot_placeholder', NOW() - interval '83 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('01a9fc70-70d8-4341-a3c1-410f00989ce0', 'df8d2fcc-82bd-4105-b4cb-b502a66984c1', 25.00, 15, 'Provincial-level experience. Strong with high balls and one-on-ones.', 45.5282, -73.6016, 20, 3.6, 16, 16, true, NOW() - interval '174 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a42a4796-aafd-49a2-9b85-e183dbc344f1', 'françois.chukwu@bot.goaliefinder.local', '$2a$11$BOT63aea02505133938e42e7c25cfaaed6510bfa3a44d5e3f192a', 'François', 'Chukwu', '+17952640681', 1, true, true, 'bot_placeholder', NOW() - interval '6 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a09d2e72-14c1-45c7-90f6-c295b4b28c3b', 'a42a4796-aafd-49a2-9b85-e183dbc344f1', 50.00, 6, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 45.4568, -73.6043, 20, 4.3, 42, 26, true, NOW() - interval '168 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c34021c3-f336-44f0-a988-6245fd1f82a5', 'simon.ahmed@bot.goaliefinder.local', '$2a$11$BOT24a00b481477f919a1a7653330181fa339036aed9a165d73e9', 'Simon', 'Ahmed', '+19358921940', 1, true, true, 'bot_placeholder', NOW() - interval '42 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1aa1bae5-604f-4ae1-a4c5-76248b5d830b', 'c34021c3-f336-44f0-a988-6245fd1f82a5', 15.00, 15, 'Former academy goalkeeper, now playing recreational leagues.', 45.4875, -73.6411, 25, 4.8, 59, 45, true, NOW() - interval '136 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8aa9a4c4-1a30-414a-bbc4-c657395fdc4f', 'samuel.parker@bot.goaliefinder.local', '$2a$11$BOT296d7b48d8378eabd5f542e075936c36f6cb75be1ead41e8de', 'Samuel', 'Parker', '+14157883654', 1, true, true, 'bot_placeholder', NOW() - interval '36 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4e98b1fd-c6ae-4986-a942-3551b08e4de1', '8aa9a4c4-1a30-414a-bbc4-c657395fdc4f', 30.00, 4, 'Available for last-minute bookings. Always match-ready.', 45.5275, -73.6303, 15, 3.6, 81, 66, true, NOW() - interval '115 days', NOW());
-- === Quebec City (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bdf5933b-7b41-46ed-9cce-7a16a087d610', 'mason.stewart@bot.goaliefinder.local', '$2a$11$BOTec7e9e955d9c2f380708fc213bed58912fe652124b203d3f39', 'Mason', 'Stewart', '+17897501705', 1, true, true, 'bot_placeholder', NOW() - interval '128 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b85b8a26-66d4-428e-9ecb-83ff8ac7db5c', 'bdf5933b-7b41-46ed-9cce-7a16a087d610', 20.00, 12, 'Versatile keeper, great with distribution and organizing the back line.', 46.8478, -71.2258, 10, 4.7, 65, 52, true, NOW() - interval '63 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5e4c1474-8794-4098-95b7-a43702776980', 'connor.scott@bot.goaliefinder.local', '$2a$11$BOT2c893096029c768aa5a6ced623ac136a0c477e0b7c29e11352', 'Connor', 'Scott', '+19318925228', 1, true, true, 'bot_placeholder', NOW() - interval '63 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('849d4fab-87af-40a5-af4c-c9b745f583c5', '5e4c1474-8794-4098-95b7-a43702776980', 30.00, 9, 'Friendly and competitive. Great at organizing the defense.', 46.7808, -71.1465, 15, 3.5, 45, 43, true, NOW() - interval '148 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('27bea41a-c521-4437-b6a0-73555236f3a6', 'wei.clark@bot.goaliefinder.local', '$2a$11$BOTf4436f590ec90b60a4165ed908516989cb917671e1c00f799c', 'Wei', 'Clark', '+15417314175', 1, true, true, 'bot_placeholder', NOW() - interval '46 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('402e1f61-fd5d-408a-b95d-e81e2b3f349d', '27bea41a-c521-4437-b6a0-73555236f3a6', 25.00, 15, 'Played keeper since I was 12. Quick feet and safe hands.', 46.8487, -71.2865, 25, 4.4, 21, 6, true, NOW() - interval '108 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c039e87c-1d90-4e0f-a1cb-f58e06a5df9c', 'scott.thomas@bot.goaliefinder.local', '$2a$11$BOTa2041e467ed53aa22472a67206dccefef37b3073347f388ff7', 'Scott', 'Thomas', '+13927446648', 1, true, true, 'bot_placeholder', NOW() - interval '151 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('646f8099-4a0e-4c44-b5c0-e59ca8bad053', 'c039e87c-1d90-4e0f-a1cb-f58e06a5df9c', 20.00, 1, 'Weekend warrior goalkeeper. Love the beautiful game!', 46.8151, -71.2501, 30, 3.9, 4, 0, true, NOW() - interval '32 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e3010a5f-c66e-4f86-9aed-6f42df600ea8', 'jae.robinson@bot.goaliefinder.local', '$2a$11$BOT6a21d6c90c80121d1453c49a24907af4eda42724f78802ea88', 'Jae', 'Robinson', '+12099240126', 1, true, true, 'bot_placeholder', NOW() - interval '68 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ee986ff9-5f4f-4131-884c-29f62b071148', 'e3010a5f-c66e-4f86-9aed-6f42df600ea8', 20.00, 6, 'Former academy goalkeeper, now playing recreational leagues.', 46.8334, -71.1362, 30, 4.8, 44, 30, true, NOW() - interval '77 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('077081f8-4135-4960-b5e9-e395c3a9df8a', 'oscar.herrera@bot.goaliefinder.local', '$2a$11$BOT41d677d8d1d7a367baa3b59371926cf2260babc1c0d9e88002', 'Oscar', 'Herrera', '+16932254537', 1, true, true, 'bot_placeholder', NOW() - interval '69 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3ca58504-5ae2-47f6-9e56-e29193f8cdc1', '077081f8-4135-4960-b5e9-e395c3a9df8a', 20.00, 2, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 46.8127, -71.2673, 20, 4.1, 17, 9, true, NOW() - interval '111 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('83df63bc-61e9-4714-ba9f-fec82be86e4d', 'james.baker@bot.goaliefinder.local', '$2a$11$BOTcd2d39ea2c3e961b9186d9ae6e1ea46b348a5771ccb3a9f8c6', 'James', 'Baker', '+17816177333', 1, true, true, 'bot_placeholder', NOW() - interval '72 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('541e6132-dcd2-47f7-b521-5913599508f6', '83df63bc-61e9-4714-ba9f-fec82be86e4d', 30.00, 5, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 46.8046, -71.2235, 15, 4.0, 4, 0, true, NOW() - interval '83 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3edae0e5-9a16-4111-b44d-ab2c17a79f55', 'emilio.turner@bot.goaliefinder.local', '$2a$11$BOT60d39c8d9504af0606e095b8d9e6ea7290703da93d2abf3e59', 'Emilio', 'Turner', '+19762088870', 1, true, true, 'bot_placeholder', NOW() - interval '84 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4a2099a1-540b-4d22-991f-8b900655cadb', '3edae0e5-9a16-4111-b44d-ab2c17a79f55', 25.00, 13, 'Passionate about the game. Consistent and dependable between the posts.', 46.7745, -71.1587, 30, 4.0, 80, 76, true, NOW() - interval '36 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('41e405b7-18bc-43e0-a0f0-7ac92c0e8c65', 'ricardo.white@bot.goaliefinder.local', '$2a$11$BOTe0f7df75518291a80bbe0f824952d94d0e4bf28442aca4de1f', 'Ricardo', 'White', '+16544672194', 1, true, true, 'bot_placeholder', NOW() - interval '2 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6b88180e-346e-4e89-85a3-824b58e2e440', '41e405b7-18bc-43e0-a0f0-7ac92c0e8c65', 35.00, 2, 'Experienced keeper with quick reflexes and strong communication skills.', 46.8194, -71.1669, 20, 4.8, 81, 62, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('91a5c1df-f74f-481d-8dbf-8b340b4490f4', 'yousef.le@bot.goaliefinder.local', '$2a$11$BOTc451ec4d453ef410b9364641dbbb1985ccc6e25fa6434e512d', 'Yousef', 'Le', '+19533495721', 1, true, true, 'bot_placeholder', NOW() - interval '81 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8a0270ad-88e7-4735-becc-4e987bd22362', '91a5c1df-f74f-481d-8dbf-8b340b4490f4', 25.00, 9, 'Retired semi-pro goalkeeper. Still got it!', 46.8141, -71.2805, 25, 4.4, 36, 31, true, NOW() - interval '110 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3776f1ba-7570-4077-a15b-6a4132127d71', 'théo.tanaka@bot.goaliefinder.local', '$2a$11$BOTf5f2ab7fd9a86c6634ad6808971ff753f6721e7f2b0a44711f', 'Théo', 'Tanaka', '+13705297403', 1, true, true, 'bot_placeholder', NOW() - interval '141 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1852588a-7527-46b1-a2c0-bef575114e21', '3776f1ba-7570-4077-a15b-6a4132127d71', 25.00, 2, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 46.7878, -71.1287, 25, 4.7, 26, 24, true, NOW() - interval '31 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('de27e787-5d59-4ecc-9aae-6ca047f1b05f', 'oscar.mitchell@bot.goaliefinder.local', '$2a$11$BOTeb40b2ce86ecefc0ebe931c55ff0060b4089bd5db37566d025', 'Oscar', 'Mitchell', '+19378580773', 1, true, true, 'bot_placeholder', NOW() - interval '72 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c4eeaa35-ed14-4a8f-96b7-8f77e908c0d6', 'de27e787-5d59-4ecc-9aae-6ca047f1b05f', 45.00, 2, 'Calm under pressure. Played competitive soccer for 8 years.', 46.8367, -71.2476, 20, 4.8, 70, 70, true, NOW() - interval '96 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('20292930-107d-42ba-8792-a3cf3bd3830e', 'gabriel.pelletier@bot.goaliefinder.local', '$2a$11$BOTbd17a4a329dc4022904c99dd430fd82123caa0f75c00677a44', 'Gabriel', 'Pelletier', '+13874485491', 1, true, true, 'bot_placeholder', NOW() - interval '101 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('727b561f-e683-4019-82bc-8ea4eae53e02', '20292930-107d-42ba-8792-a3cf3bd3830e', 20.00, 7, 'Fast and agile. Best on turf and indoor surfaces.', 46.8226, -71.2164, 30, 3.8, 49, 48, true, NOW() - interval '113 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('15baf894-872b-4ce4-b18b-68457a6c0bec', 'mathieu.li@bot.goaliefinder.local', '$2a$11$BOTba1a22f428091f34a3f09395dcfd48bad0d57ab6f8e7bd0fc1', 'Mathieu', 'Li', '+17463938037', 1, true, true, 'bot_placeholder', NOW() - interval '141 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('151ecd78-ca03-4f81-bb0e-a0c1c6443f1f', '15baf894-872b-4ce4-b18b-68457a6c0bec', 30.00, 10, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 46.768, -71.1949, 30, 3.6, 24, 22, true, NOW() - interval '3 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('22bf34b7-80a5-4420-9a11-26f70545a416', 'jorge.santos@bot.goaliefinder.local', '$2a$11$BOT79234b852fc3b78cb1b8dddb7ee92942e5adddd693be90634d', 'Jorge', 'Santos', '+15723255759', 1, true, true, 'bot_placeholder', NOW() - interval '7 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('11c6e8ea-e2a8-4f06-bb79-5c91af6f6e0c', '22bf34b7-80a5-4420-9a11-26f70545a416', 20.00, 15, 'Played keeper since I was 12. Quick feet and safe hands.', 46.8599, -71.249, 15, 3.8, 21, 7, true, NOW() - interval '53 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2ddbebb6-d5aa-4026-9896-f0f99426c334', 'aaron.bouchard@bot.goaliefinder.local', '$2a$11$BOTee0165b3c811cfe1c67959db08cbe8db7f4c0a8ca842479341', 'Aaron', 'Bouchard', '+16008462754', 1, true, true, 'bot_placeholder', NOW() - interval '77 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('13b8d0d7-4fef-4d35-9aca-31c5a33b827a', '2ddbebb6-d5aa-4026-9896-f0f99426c334', 45.00, 4, 'University-level goalkeeper looking for extra matches.', 46.8438, -71.2516, 25, 4.9, 28, 21, true, NOW() - interval '140 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9a89cc6b-69d2-46ce-a634-322f761d9345', 'jorge.le@bot.goaliefinder.local', '$2a$11$BOTb139fe2bff3ebf14f05988f9f5da2ceee5eb69e584ba2ebb47', 'Jorge', 'Le', '+19152206331', 1, true, true, 'bot_placeholder', NOW() - interval '56 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5f1fde3e-23d5-4927-8986-9a7ab4cbbf5f', '9a89cc6b-69d2-46ce-a634-322f761d9345', 30.00, 15, 'Experienced keeper with quick reflexes and strong communication skills.', 46.8074, -71.1772, 15, 3.6, 57, 48, true, NOW() - interval '177 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1bcdab53-2dd7-4564-83bd-5a7936372f82', 'wei.li@bot.goaliefinder.local', '$2a$11$BOTc1c76c19f1c7d6077bad3794f86a6cdb96679c59a09cc26d47', 'Wei', 'Li', '+18831200079', 1, true, true, 'bot_placeholder', NOW() - interval '22 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('287627fa-439a-4311-9239-272b16aed062', '1bcdab53-2dd7-4564-83bd-5a7936372f82', 20.00, 12, 'Friendly and competitive. Great at organizing the defense.', 46.8024, -71.2375, 25, 5.0, 84, 64, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dcaa540c-e363-4b3e-9aa1-c5e363328081', 'josue.lavoie@bot.goaliefinder.local', '$2a$11$BOT83c066464b88e0e524eb7b62205cdfd1235a83cbc30ca8afe7', 'Josue', 'Lavoie', '+16098684266', 1, true, true, 'bot_placeholder', NOW() - interval '136 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('45ffa306-3429-4b72-88dc-4583ce3e5d6d', 'dcaa540c-e363-4b3e-9aa1-c5e363328081', 30.00, 14, 'Versatile keeper, great with distribution and organizing the back line.', 46.8384, -71.2677, 10, 4.1, 67, 52, true, NOW() - interval '62 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2ae5ba5c-453d-49e1-b085-2cd31afeb6b1', 'jorge.gonzalez@bot.goaliefinder.local', '$2a$11$BOT0e2cbb7399f6c9d29c5865f8558a07c552318aea640a6d94f4', 'Jorge', 'Gonzalez', '+13211461396', 1, true, true, 'bot_placeholder', NOW() - interval '30 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('19b1d830-1888-45c6-9f8a-08636068c4c6', '2ae5ba5c-453d-49e1-b085-2cd31afeb6b1', 20.00, 7, 'Tall keeper with a long reach. Command the box effectively.', 46.8325, -71.1962, 15, 4.4, 22, 10, true, NOW() - interval '47 days', NOW());
-- === Calgary (25 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5cf819bb-63a9-41e2-b374-588fc07dbae8', 'kyle.thomas@bot.goaliefinder.local', '$2a$11$BOT4950a0065080d063713f6e5307f1fd6838362e0f9e01a1abaa', 'Kyle', 'Thomas', '+19289218839', 1, true, true, 'bot_placeholder', NOW() - interval '42 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('212947dd-c5d0-4473-8989-9e193a33d1ab', '5cf819bb-63a9-41e2-b374-588fc07dbae8', 45.00, 7, 'Technical goalkeeper who loves playing out from the back.', 51.0755, -114.034, 30, 4.3, 6, 0, true, NOW() - interval '138 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bca760dd-c699-4624-8785-b9a1c4581157', 'marco.chukwu@bot.goaliefinder.local', '$2a$11$BOTc74fbf9ae2fae911cb5085d2f273c4170704b345750e443fb4', 'Marco', 'Chukwu', '+17883120444', 1, true, true, 'bot_placeholder', NOW() - interval '6 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bb78cb61-713c-42d2-9865-aa680b83bf1d', 'bca760dd-c699-4624-8785-b9a1c4581157', 25.00, 13, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 51.0811, -114.0224, 15, 5.0, 80, 64, true, NOW() - interval '1 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a1f29d90-539d-4a74-ac7b-b2e8ae89f105', 'victor.thomas@bot.goaliefinder.local', '$2a$11$BOTc7976a75f6b7a3c4d25f143e927e9353f5cc4b44a2baff2922', 'Victor', 'Thomas', '+16802895711', 1, true, true, 'bot_placeholder', NOW() - interval '114 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('079ef26b-49db-4300-94a2-a130c2127137', 'a1f29d90-539d-4a74-ac7b-b2e8ae89f105', 25.00, 1, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 51.0425, -114.0896, 20, 4.1, 66, 66, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7c65ca1d-a93e-4fe6-b75d-153f22ad0751', 'carter.osei@bot.goaliefinder.local', '$2a$11$BOTf3bf7f3ffec8b4d17478eaf47d7a01e102247b2ba8a5958f73', 'Carter', 'Osei', '+13517783243', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d49774f9-c5d8-4b3c-9e92-a8e18d6f4160', '7c65ca1d-a93e-4fe6-b75d-153f22ad0751', 25.00, 5, 'Available for last-minute bookings. Always match-ready.', 51.0017, -114.1425, 20, 3.6, 17, 1, true, NOW() - interval '175 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0969a530-4d85-4a34-b61b-e19d9a27ced2', 'miguel.nguyen@bot.goaliefinder.local', '$2a$11$BOT231a35c7b17fa5464e708a312729b7769873153c20fe22ae05', 'Miguel', 'Nguyen', '+12342319391', 1, true, true, 'bot_placeholder', NOW() - interval '59 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4a35a3a5-7f2e-444a-a134-8b876f0d3477', '0969a530-4d85-4a34-b61b-e19d9a27ced2', 25.00, 6, 'Played keeper since I was 12. Quick feet and safe hands.', 51.1035, -114.1161, 25, 3.7, 6, 0, true, NOW() - interval '121 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5c622b71-186b-49b4-a2eb-683249527f12', 'eduardo.okafor@bot.goaliefinder.local', '$2a$11$BOTab6d23e3cf31da00c39a17fc9f89cfcaea41d781cbf7f70963', 'Eduardo', 'Okafor', '+17052094593', 1, true, true, 'bot_placeholder', NOW() - interval '37 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b4daeb74-f524-4e03-bde8-5919af6a2ee3', '5c622b71-186b-49b4-a2eb-683249527f12', 25.00, 1, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 51.0603, -114.0564, 20, 3.7, 3, 0, true, NOW() - interval '138 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7875f577-f139-4330-9aaa-261815c6e287', 'james.osei@bot.goaliefinder.local', '$2a$11$BOT58b9e4eccd9f71a396bd8c20030955997bb6d34fe57fbcfc03', 'James', 'Osei', '+16198783641', 1, true, true, 'bot_placeholder', NOW() - interval '118 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fc8a2bfb-e0f9-44a9-a529-98e574a5fc50', '7875f577-f139-4330-9aaa-261815c6e287', 15.00, 11, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 51.0575, -114.1185, 15, 4.2, 61, 42, true, NOW() - interval '75 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0dd411bd-760c-469d-904e-044064ce160b', 'emilio.patel@bot.goaliefinder.local', '$2a$11$BOT2c849830ede925dbbab0e5a114f924c74b1fd31897f59b32b7', 'Emilio', 'Patel', '+19213444413', 1, true, true, 'bot_placeholder', NOW() - interval '30 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3388e0cd-11bc-4eef-9fca-aa1af67d013c', '0dd411bd-760c-469d-904e-044064ce160b', 15.00, 6, 'Strong penalty saver. Calm and focused under pressure.', 51.0476, -114.0137, 20, 4.6, 54, 42, true, NOW() - interval '94 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c28030e9-dd49-4656-8bac-97f00e869e9c', 'carlos.tanaka@bot.goaliefinder.local', '$2a$11$BOTb7cbbe26804e793cbad40897fabc5f6a6b5db5efa4ad13024c', 'Carlos', 'Tanaka', '+19893729448', 1, true, true, 'bot_placeholder', NOW() - interval '63 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('abe3cdb6-b559-4f96-a5f1-2ff52f9533e7', 'c28030e9-dd49-4656-8bac-97f00e869e9c', 50.00, 9, 'Solid keeper with a positive attitude. Always on time.', 51.0277, -114.1054, 10, 4.2, 47, 45, true, NOW() - interval '166 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6f15de75-6af3-4987-98a3-a9f2ef39881c', 'rafael.tran@bot.goaliefinder.local', '$2a$11$BOTb0e969057edc30461c6bb10fe71c862de05592625d1362c19d', 'Rafael', 'Tran', '+17165368659', 1, true, true, 'bot_placeholder', NOW() - interval '123 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2a97fb65-845a-464e-8656-85600742bfbb', '6f15de75-6af3-4987-98a3-a9f2ef39881c', 20.00, 6, 'Strong penalty saver. Calm and focused under pressure.', 51.0935, -114.0083, 20, 4.8, 12, 6, true, NOW() - interval '41 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a3d01f2b-84b0-4859-9ab6-e295b3a3c9f8', 'ricardo.walker@bot.goaliefinder.local', '$2a$11$BOTa498aed0926c4251ea8d4cbd07f68960af2a588eafb5d48eea', 'Ricardo', 'Walker', '+18524121609', 1, true, true, 'bot_placeholder', NOW() - interval '152 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5c85bb3c-9f30-48e9-ba10-42ebe104941a', 'a3d01f2b-84b0-4859-9ab6-e295b3a3c9f8', 35.00, 10, 'Retired semi-pro goalkeeper. Still got it!', 51.0482, -114.1017, 10, 3.9, 9, 6, true, NOW() - interval '68 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6c263256-84b4-4143-97db-7cc3ad17e2fd', 'santiago.lavoie@bot.goaliefinder.local', '$2a$11$BOTf7b2000568c11382e6cfed505659d1741dd4644d54ece35e84', 'Santiago', 'Lavoie', '+13227889347', 1, true, true, 'bot_placeholder', NOW() - interval '112 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1d208ac1-f502-493d-80a6-a0cbeebb949d', '6c263256-84b4-4143-97db-7cc3ad17e2fd', 20.00, 13, 'Solid keeper with a positive attitude. Always on time.', 50.9951, -114.094, 15, 4.1, 38, 30, true, NOW() - interval '71 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6a62fb3c-3d9f-40af-9ecb-2ed744120280', 'yousef.murphy@bot.goaliefinder.local', '$2a$11$BOTc51def575e2b016d8c0116a3f329896dead2ac322ebd913eaf', 'Yousef', 'Murphy', '+18068462819', 1, true, true, 'bot_placeholder', NOW() - interval '105 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7e8ca0b3-6611-4840-bcd3-0c465a5e31ec', '6a62fb3c-3d9f-40af-9ecb-2ed744120280', 15.00, 6, 'Provincial-level experience. Strong with high balls and one-on-ones.', 50.9866, -114.1103, 20, 4.5, 67, 48, true, NOW() - interval '61 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('54caac92-927b-4357-96e2-3993568482e1', 'maxime.adebayo@bot.goaliefinder.local', '$2a$11$BOT7e349dfb6ddb025707915e5fff7f972c0f09c17898347a1cc6', 'Maxime', 'Adebayo', '+15807680062', 1, true, true, 'bot_placeholder', NOW() - interval '135 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f478cc88-3972-4be0-b63a-8591f89ab206', '54caac92-927b-4357-96e2-3993568482e1', 15.00, 10, 'Experienced keeper with quick reflexes and strong communication skills.', 51.0402, -114.0982, 25, 4.6, 32, 15, true, NOW() - interval '89 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6c8715c4-dd0b-4d67-86e6-19f586b6594a', 'andres.smith@bot.goaliefinder.local', '$2a$11$BOT746a636c7ef32c6a87651ba52c141b1e7e8fd234a6bdf43488', 'Andres', 'Smith', '+17731956650', 1, true, true, 'bot_placeholder', NOW() - interval '51 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0d8e1820-fbb4-4d58-a1f4-46315e6366a4', '6c8715c4-dd0b-4d67-86e6-19f586b6594a', 20.00, 12, 'Weekend warrior goalkeeper. Love the beautiful game!', 51.0188, -114.07, 30, 3.7, 54, 50, true, NOW() - interval '169 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2a46c409-ea57-4b3b-b445-0e4bc169cb68', 'emilio.chukwu@bot.goaliefinder.local', '$2a$11$BOT3c7faf815dd1e3f5b04f4013954d25eb18396bb8505785831f', 'Emilio', 'Chukwu', '+14583324883', 1, true, true, 'bot_placeholder', NOW() - interval '60 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5e19a858-e7cd-4724-a725-fe200c98aac9', '2a46c409-ea57-4b3b-b445-0e4bc169cb68', 25.00, 13, 'Strong penalty saver. Calm and focused under pressure.', 51.0445, -114.0675, 20, 4.2, 24, 17, true, NOW() - interval '24 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dd2cb68d-27bf-41ef-aeb3-ff2d6d867651', 'dylan.smith@bot.goaliefinder.local', '$2a$11$BOT7fa576bd9d2cfaf33b53a3904255dee01dca5fc4ed6e36094e', 'Dylan', 'Smith', '+13985546251', 1, true, true, 'bot_placeholder', NOW() - interval '142 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('48e9d83b-93e7-4e9d-bb87-78bdd3d7fb1d', 'dd2cb68d-27bf-41ef-aeb3-ff2d6d867651', 20.00, 6, 'Former academy goalkeeper, now playing recreational leagues.', 51.0394, -114.0665, 20, 4.0, 25, 13, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bf6581d7-4f71-4b96-bac9-5a4813f51ca3', 'eduardo.santos@bot.goaliefinder.local', '$2a$11$BOTcfe8ac25def8181e90a1bdb92f83485c11f6e62e425fafd22f', 'Eduardo', 'Santos', '+15919695142', 1, true, true, 'bot_placeholder', NOW() - interval '159 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('117626f8-42b7-4462-ad6d-657750130a9c', 'bf6581d7-4f71-4b96-bac9-5a4813f51ca3', 20.00, 7, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 51.0729, -114.0031, 15, 4.7, 46, 43, true, NOW() - interval '41 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('43ab8265-3d6f-4e0c-9a1d-7cfc62decc48', 'tyler.castillo@bot.goaliefinder.local', '$2a$11$BOT093e2e11bb8b247979d11534eb20fcaa4f66bdd8da2db2f270', 'Tyler', 'Castillo', '+19658547738', 1, true, true, 'bot_placeholder', NOW() - interval '70 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d42cf44b-8638-4101-844e-17f6f9c4027f', '43ab8265-3d6f-4e0c-9a1d-7cfc62decc48', 25.00, 12, 'Experienced keeper with quick reflexes and strong communication skills.', 51.0464, -114.0392, 15, 4.3, 18, 1, true, NOW() - interval '78 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b9b1e361-c55b-4548-8b3b-895168465c6d', 'guillaume.mitchell@bot.goaliefinder.local', '$2a$11$BOT7ca49a67979c7a363c3f603b2ebf1c3447ee4d7024d8c28f2a', 'Guillaume', 'Mitchell', '+16725018361', 1, true, true, 'bot_placeholder', NOW() - interval '169 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('92913c91-00f8-4b76-9ddf-b0ad4be33516', 'b9b1e361-c55b-4548-8b3b-895168465c6d', 35.00, 13, 'Weekend warrior goalkeeper. Love the beautiful game!', 51.0469, -114.1261, 25, 4.2, 9, 0, true, NOW() - interval '142 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('208065f8-41bc-4545-a673-478da7d35460', 'yousef.walker@bot.goaliefinder.local', '$2a$11$BOT9b91679e82fb356bd750c9df6ca72bc81f7a764ecd9e66028a', 'Yousef', 'Walker', '+17163223761', 1, true, true, 'bot_placeholder', NOW() - interval '50 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ad7a48cf-bbc7-4c8b-8c0b-47ea59250566', '208065f8-41bc-4545-a673-478da7d35460', 35.00, 2, 'Weekend warrior goalkeeper. Love the beautiful game!', 51.0825, -114.1136, 15, 4.3, 14, 9, true, NOW() - interval '35 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('db021906-f6cc-4ef4-9a34-4c518bdef5d7', 'julien.murphy@bot.goaliefinder.local', '$2a$11$BOTb85a02be0d3f5fb3734873478f314f70035720efdbeda62d9c', 'Julien', 'Murphy', '+15558547984', 1, true, true, 'bot_placeholder', NOW() - interval '164 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('49c234d4-703a-4f38-ad91-4c1e6234e6e7', 'db021906-f6cc-4ef4-9a34-4c518bdef5d7', 20.00, 7, 'Weekend warrior goalkeeper. Love the beautiful game!', 51.0859, -114.0808, 25, 4.7, 38, 30, true, NOW() - interval '62 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e8843dd6-1942-4202-bb9b-fb58d0971425', 'alexandre.kofi@bot.goaliefinder.local', '$2a$11$BOT26635f4ce41ee363a6f0c3b3d0424af7498a1c308093929dc4', 'Alexandre', 'Kofi', '+13295957972', 1, true, true, 'bot_placeholder', NOW() - interval '45 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('844f5b05-7852-476b-968f-25f69e9671ba', 'e8843dd6-1942-4202-bb9b-fb58d0971425', 25.00, 4, 'Versatile keeper, great with distribution and organizing the back line.', 51.0907, -114.0813, 20, 4.3, 78, 77, true, NOW() - interval '19 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ae831be5-e71c-4b6a-9bc9-43b8ffed31bc', 'alberto.phillips@bot.goaliefinder.local', '$2a$11$BOTb9a0f43da9f2a66f9da7fce5ae9727fe876e23f5b5e6926ca1', 'Alberto', 'Phillips', '+14114737102', 1, true, true, 'bot_placeholder', NOW() - interval '160 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('605179d3-0849-4859-aeb7-cb03f0845b2a', 'ae831be5-e71c-4b6a-9bc9-43b8ffed31bc', 30.00, 13, 'Reliable shot-stopper available for weekend and weekday games.', 50.9937, -114.0524, 20, 3.6, 80, 80, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2c3a1085-7126-419d-ac5a-955f165f69ad', 'sung.stewart@bot.goaliefinder.local', '$2a$11$BOT43731beeb5d19082eab59d66a62e8e52e1bc700d93564127f2', 'Sung', 'Stewart', '+15283640858', 1, true, true, 'bot_placeholder', NOW() - interval '162 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f0d0bd61-dffa-44b0-9c02-a7a7e7a4f0f0', '2c3a1085-7126-419d-ac5a-955f165f69ad', 25.00, 13, 'Reliable shot-stopper available for weekend and weekday games.', 51.0907, -114.0089, 15, 3.8, 41, 36, true, NOW() - interval '137 days', NOW());
-- === Edmonton (22 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('dca911d8-c727-4001-8fc8-f8e5f350c7fe', 'diego.rodriguez@bot.goaliefinder.local', '$2a$11$BOT9513f7f83c1aafe4f611c47c74e8f7f29f19861169390c1d77', 'Diego', 'Rodriguez', '+15082004577', 1, true, true, 'bot_placeholder', NOW() - interval '74 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3ca007cb-3369-42ea-a6c4-190b010a3fcc', 'dca911d8-c727-4001-8fc8-f8e5f350c7fe', 30.00, 14, 'Tall keeper with a long reach. Command the box effectively.', 53.5416, -113.4682, 15, 3.5, 15, 6, true, NOW() - interval '51 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6df63cc5-a714-45c5-8d85-208abe535ed6', 'pierre.santos@bot.goaliefinder.local', '$2a$11$BOT3fae9595d0aec835315bc2ab512800da9f44732235774bbefe', 'Pierre', 'Santos', '+14865080508', 1, true, true, 'bot_placeholder', NOW() - interval '149 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e67fa968-d89f-4435-8988-975c8fb20c1f', '6df63cc5-a714-45c5-8d85-208abe535ed6', 50.00, 3, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 53.4964, -113.5277, 30, 3.8, 13, 0, true, NOW() - interval '15 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('47087461-9683-4bce-ad63-9fc91bfbe583', 'victor.herrera@bot.goaliefinder.local', '$2a$11$BOTde54b4244b987ad3f762d0f4b4b4a521c74324cb7c29587d3e', 'Victor', 'Herrera', '+18623351603', 1, true, true, 'bot_placeholder', NOW() - interval '72 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('18c10234-d620-4f14-9830-afe95043145f', '47087461-9683-4bce-ad63-9fc91bfbe583', 30.00, 8, 'Retired semi-pro goalkeeper. Still got it!', 53.6057, -113.4676, 25, 4.1, 40, 23, true, NOW() - interval '31 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('256f2340-3a39-44f4-9c4b-4646cf37a040', 'rafael.wright@bot.goaliefinder.local', '$2a$11$BOT46120280870c17f00799057a06fcbc2ed83b5fcb6c4b0a70ba', 'Rafael', 'Wright', '+14497106920', 1, true, true, 'bot_placeholder', NOW() - interval '142 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2447c0e5-6356-411e-905f-58e577491139', '256f2340-3a39-44f4-9c4b-4646cf37a040', 25.00, 11, 'Strong penalty saver. Calm and focused under pressure.', 53.5218, -113.418, 10, 4.8, 14, 12, true, NOW() - interval '65 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fdb23792-9786-42ff-be12-50f14ac795ac', 'rémi.jackson@bot.goaliefinder.local', '$2a$11$BOT47dd537f4a375ee47b17dc68159f9ca0ce897b332371fbe621', 'Rémi', 'Jackson', '+17761326069', 1, true, true, 'bot_placeholder', NOW() - interval '105 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3f630ebb-8e82-49db-8f3f-f9989b2cca45', 'fdb23792-9786-42ff-be12-50f14ac795ac', 45.00, 7, 'Versatile keeper, great with distribution and organizing the back line.', 53.5076, -113.5625, 15, 5.0, 14, 6, true, NOW() - interval '115 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8149a9c3-8a57-4b34-bd95-4d4e1322a9b1', 'marcus.silva@bot.goaliefinder.local', '$2a$11$BOT50be44dc665d1a0812827730affea8ec6943458dc142c50c0a', 'Marcus', 'Silva', '+19148695384', 1, true, true, 'bot_placeholder', NOW() - interval '93 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('27ceb90f-e1ee-4970-90af-307242742762', '8149a9c3-8a57-4b34-bd95-4d4e1322a9b1', 15.00, 10, 'Provincial-level experience. Strong with high balls and one-on-ones.', 53.5623, -113.4597, 10, 4.8, 31, 19, true, NOW() - interval '105 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('978b1ca1-bd5e-4fa4-8503-2613a2491f97', 'aaron.castillo@bot.goaliefinder.local', '$2a$11$BOT729102ab4473c582a5be217f8c71d2aa1b8648b00cf559c701', 'Aaron', 'Castillo', '+14358870606', 1, true, true, 'bot_placeholder', NOW() - interval '112 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d55ddbe7-5b0d-4fb4-8bb2-60737a1a61dc', '978b1ca1-bd5e-4fa4-8503-2613a2491f97', 30.00, 11, 'Provincial-level experience. Strong with high balls and one-on-ones.', 53.5638, -113.4361, 15, 4.5, 68, 53, true, NOW() - interval '159 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bd07abd0-c849-4ff9-b505-5eada3019884', 'alberto.rodriguez@bot.goaliefinder.local', '$2a$11$BOT5d0d5d5791e9c0c77dd0897b7686211bf6b374acf0a3de8ec5', 'Alberto', 'Rodriguez', '+13994473031', 1, true, true, 'bot_placeholder', NOW() - interval '70 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b62ef368-cb6e-4715-ac41-19dc19f16b03', 'bd07abd0-c849-4ff9-b505-5eada3019884', 30.00, 10, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 53.5504, -113.5596, 25, 3.6, 4, 0, true, NOW() - interval '38 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0d0ddf52-2f8e-4502-932c-4834ba392de4', 'mason.brown@bot.goaliefinder.local', '$2a$11$BOTc0dcca11f5944f97b0751f17bc702eaa9d8ac7c897a8c90278', 'Mason', 'Brown', '+15806230721', 1, true, true, 'bot_placeholder', NOW() - interval '140 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('70d3efc2-22a7-4dd4-82ac-7ccdd0c28f08', '0d0ddf52-2f8e-4502-932c-4834ba392de4', 25.00, 2, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 53.5346, -113.4189, 15, 4.9, 20, 5, true, NOW() - interval '16 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4019a94f-e362-476e-bbe1-e5dda72e3520', 'hector.gauthier@bot.goaliefinder.local', '$2a$11$BOTc0efd6a77371fbd4a03806754be557d6cc1aecbb8bb0d8279e', 'Hector', 'Gauthier', '+12344419571', 1, true, true, 'bot_placeholder', NOW() - interval '24 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5283ed0e-779e-4b7b-bfa1-8b93f8bf3e18', '4019a94f-e362-476e-bbe1-e5dda72e3520', 30.00, 2, 'Tall keeper with a long reach. Command the box effectively.', 53.5235, -113.4642, 25, 3.8, 70, 58, true, NOW() - interval '159 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('202ce5b6-b5dc-4941-955c-dabf9e9ba88a', 'isaac.king@bot.goaliefinder.local', '$2a$11$BOT730b599a8bea3087bf50fb4ee05fefc4204767bc644f53893f', 'Isaac', 'King', '+19471497988', 1, true, true, 'bot_placeholder', NOW() - interval '156 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('14b36971-e1aa-4304-b73a-579a12bd49c7', '202ce5b6-b5dc-4941-955c-dabf9e9ba88a', 25.00, 8, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 53.5206, -113.5509, 10, 3.7, 8, 0, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('593279ba-41bf-4a86-9e3a-bf4796777de8', 'roberto.chen@bot.goaliefinder.local', '$2a$11$BOTb6bbdfa25f756a0e4fa04cf2d43fb5f1a6298c31316a66aca4', 'Roberto', 'Chen', '+14055825354', 1, true, true, 'bot_placeholder', NOW() - interval '176 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ba5a74f9-7729-4434-b961-d4d62c0fa72b', '593279ba-41bf-4a86-9e3a-bf4796777de8', 40.00, 9, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 53.5964, -113.5646, 10, 4.4, 24, 23, true, NOW() - interval '70 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('97579e25-2376-4579-baec-842919f6b28c', 'hiroshi.evans@bot.goaliefinder.local', '$2a$11$BOT6f9058c142e36756ebda48381ff13e0c42c9de30b627806585', 'Hiroshi', 'Evans', '+18549917366', 1, true, true, 'bot_placeholder', NOW() - interval '142 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('84732f82-01b5-4286-be5e-435a7c92a50c', '97579e25-2376-4579-baec-842919f6b28c', 50.00, 12, 'Versatile keeper, great with distribution and organizing the back line.', 53.5775, -113.4858, 20, 4.7, 1, 0, true, NOW() - interval '147 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b9b8a558-00c0-412d-a0fb-55695797b691', 'emilio.martinez@bot.goaliefinder.local', '$2a$11$BOTdcbdac481ec3817ceef8efedd72d45f5683eb46784b5398d99', 'Emilio', 'Martinez', '+12688623882', 1, true, true, 'bot_placeholder', NOW() - interval '87 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d47859e3-90a3-473e-8f38-22c92da3d97b', 'b9b8a558-00c0-412d-a0fb-55695797b691', 25.00, 1, 'Friendly and competitive. Great at organizing the defense.', 53.5758, -113.5367, 10, 4.4, 29, 17, true, NOW() - interval '44 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('1b74b92d-036b-4d7d-b5ba-6a2f3f7719db', 'ravi.smith@bot.goaliefinder.local', '$2a$11$BOTb5a62896f05d7800da360935db72620689287b0cf7476bc0ba', 'Ravi', 'Smith', '+14521330018', 1, true, true, 'bot_placeholder', NOW() - interval '170 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9f692617-86e9-4624-a4e7-3c43db49418c', '1b74b92d-036b-4d7d-b5ba-6a2f3f7719db', 45.00, 1, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 53.5779, -113.4716, 15, 3.9, 68, 62, true, NOW() - interval '178 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c58fd4f8-2587-4f54-b159-e56e57afe3a1', 'scott.parker@bot.goaliefinder.local', '$2a$11$BOT8037ac21cb8b0b801a4704d38f783ad252770aa6f5c4ab5c86', 'Scott', 'Parker', '+17273219107', 1, true, true, 'bot_placeholder', NOW() - interval '123 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('aaeae92f-4e78-413c-b16e-088b52670e1c', 'c58fd4f8-2587-4f54-b159-e56e57afe3a1', 25.00, 6, 'University-level goalkeeper looking for extra matches.', 53.5335, -113.5304, 10, 3.5, 26, 23, true, NOW() - interval '158 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3d14d5c6-6f2b-40fd-828d-d03bb8576eb9', 'connor.diallo@bot.goaliefinder.local', '$2a$11$BOT5241a642b9f31f679cdf39913ccd87289a95483b6fce58554e', 'Connor', 'Diallo', '+13634329224', 1, true, true, 'bot_placeholder', NOW() - interval '109 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('64a1cff1-23c2-46f0-a330-fa53b24f260a', '3d14d5c6-6f2b-40fd-828d-d03bb8576eb9', 15.00, 6, 'Solid keeper with a positive attitude. Always on time.', 53.509, -113.532, 20, 3.9, 0, 0, true, NOW() - interval '127 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2881c8ce-f6c7-40bf-bc53-2904465f3fec', 'thomas.mohamed@bot.goaliefinder.local', '$2a$11$BOTc299b275398a9cba6c7b88b215b95109efe33de8fd68a57ad1', 'Thomas', 'Mohamed', '+16532876906', 1, true, true, 'bot_placeholder', NOW() - interval '15 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5667b59d-8907-4311-8e7e-c4a002ef3d03', '2881c8ce-f6c7-40bf-bc53-2904465f3fec', 40.00, 5, 'Experienced keeper with quick reflexes and strong communication skills.', 53.5506, -113.472, 10, 4.8, 65, 47, true, NOW() - interval '18 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b69fe08a-3cb6-45e5-b976-851a8b31d7c0', 'derek.baker@bot.goaliefinder.local', '$2a$11$BOTa703590eca08b25621226226f5225ac9a494fe8b9472723f4e', 'Derek', 'Baker', '+17467207951', 1, true, true, 'bot_placeholder', NOW() - interval '174 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('da02ca54-a358-4534-834d-266379006009', 'b69fe08a-3cb6-45e5-b976-851a8b31d7c0', 20.00, 15, 'New to the city and looking to play as much as possible.', 53.5495, -113.5252, 30, 4.5, 22, 10, true, NOW() - interval '49 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c8ac779d-3eed-4292-a169-980052376374', 'min.brown@bot.goaliefinder.local', '$2a$11$BOT7447b1b455c73cc1daacfb2910b1b1dd75cd1aef7f3b5c1dec', 'Min', 'Brown', '+19721448087', 1, true, true, 'bot_placeholder', NOW() - interval '167 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3d8e8c07-e50f-4c88-81f6-0f7cb0b32618', 'c8ac779d-3eed-4292-a169-980052376374', 40.00, 8, 'Strong penalty saver. Calm and focused under pressure.', 53.5855, -113.5166, 20, 4.0, 34, 18, true, NOW() - interval '157 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('008d7713-a2e1-43b7-875c-dc762387e49c', 'julien.rodriguez@bot.goaliefinder.local', '$2a$11$BOTb4256af4af55c44cf905d56c33035b34e4e551be41526b965b', 'Julien', 'Rodriguez', '+13715719533', 1, true, true, 'bot_placeholder', NOW() - interval '129 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7b7935f1-95e5-4d1a-83c7-c6a00f31d230', '008d7713-a2e1-43b7-875c-dc762387e49c', 30.00, 4, 'Former academy goalkeeper, now playing recreational leagues.', 53.5168, -113.4604, 15, 4.7, 42, 38, true, NOW() - interval '8 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e8ea42d2-a699-4fa7-8baf-9a600edc207a', 'marcus.morris@bot.goaliefinder.local', '$2a$11$BOT732c406bdc3de0794ab30d760d059f842e69a7743531f1a096', 'Marcus', 'Morris', '+13829842455', 1, true, true, 'bot_placeholder', NOW() - interval '59 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ba6fa04c-47fd-45a9-8dda-d18c8beca52c', 'e8ea42d2-a699-4fa7-8baf-9a600edc207a', 25.00, 12, 'Available for last-minute bookings. Always match-ready.', 53.5646, -113.5126, 25, 4.3, 66, 64, true, NOW() - interval '178 days', NOW());
-- === Winnipeg (22 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('59326636-4169-497b-9e3f-80b97e18a971', 'justin.hill@bot.goaliefinder.local', '$2a$11$BOTb10466dc0d336280bb7be5bf4c610caaacfd1ce5d049018f32', 'Justin', 'Hill', '+13509750592', 1, true, true, 'bot_placeholder', NOW() - interval '76 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('afddfac0-c9be-441c-9418-aec603265f8b', '59326636-4169-497b-9e3f-80b97e18a971', 15.00, 15, 'Strong penalty saver. Calm and focused under pressure.', 49.8529, -97.169, 25, 3.6, 33, 30, true, NOW() - interval '124 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('76949e2c-ce2d-47d2-a970-ce1035a7a9c9', 'connor.davis@bot.goaliefinder.local', '$2a$11$BOTe615f0d32a70c79098c86c3ef1df0cf295ea4cc53121504194', 'Connor', 'Davis', '+17815366702', 1, true, true, 'bot_placeholder', NOW() - interval '80 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('56ea9d43-39e9-4172-be56-14b5f2ca0699', '76949e2c-ce2d-47d2-a970-ce1035a7a9c9', 25.00, 3, 'Provincial-level experience. Strong with high balls and one-on-ones.', 49.9395, -97.1528, 20, 4.5, 52, 42, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('525babac-a58c-4eab-960e-d6b93bf5cff7', 'aiden.reyes@bot.goaliefinder.local', '$2a$11$BOTc144c068467d4d7d4482711c0b44941afc273fc89a6705ce1f', 'Aiden', 'Reyes', '+17853426996', 1, true, true, 'bot_placeholder', NOW() - interval '60 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('48cb1fe6-c231-4e13-84a4-18b6fa761dae', '525babac-a58c-4eab-960e-d6b93bf5cff7', 25.00, 11, 'Tall keeper with a long reach. Command the box effectively.', 49.8604, -97.1309, 20, 4.1, 45, 27, true, NOW() - interval '117 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a3cf1f9b-e34f-407e-84ec-d4e391ac2eb6', 'lucas.martinez@bot.goaliefinder.local', '$2a$11$BOTab43dc0830c523aeef6a3952efcdc2d4ea24f06c354405742d', 'Lucas', 'Martinez', '+18759593914', 1, true, true, 'bot_placeholder', NOW() - interval '161 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e4e8cf67-ac03-4694-bac3-ab04d97dc7f1', 'a3cf1f9b-e34f-407e-84ec-d4e391ac2eb6', 15.00, 9, 'Reliable shot-stopper available for weekend and weekday games.', 49.9071, -97.0943, 25, 4.6, 61, 58, true, NOW() - interval '51 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ba28c842-e8e5-4ed5-a070-0baa2fd8eecb', 'hiroshi.castillo@bot.goaliefinder.local', '$2a$11$BOT54395e5a1597c4129e5deb8a1d6472721912affc42a494baa4', 'Hiroshi', 'Castillo', '+17332454795', 1, true, true, 'bot_placeholder', NOW() - interval '57 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c76b0318-1505-4d87-8729-2b64c8e60d56', 'ba28c842-e8e5-4ed5-a070-0baa2fd8eecb', 25.00, 10, 'Passionate about the game. Consistent and dependable between the posts.', 49.9367, -97.0698, 25, 3.7, 27, 16, true, NOW() - interval '78 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a776ddba-1b63-4db7-82d8-890a7ff15598', 'rémi.cruz@bot.goaliefinder.local', '$2a$11$BOT27e208179e801d43da4538da7b84fb7deeda2e6d504847d119', 'Rémi', 'Cruz', '+15458652299', 1, true, true, 'bot_placeholder', NOW() - interval '138 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1f2698c1-d1e2-4665-9094-83d687ce4b3d', 'a776ddba-1b63-4db7-82d8-890a7ff15598', 25.00, 5, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.9093, -97.0814, 15, 4.1, 57, 56, true, NOW() - interval '116 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9a68553f-1b0f-436e-9d5b-145782fc5382', 'cristian.turner@bot.goaliefinder.local', '$2a$11$BOTdf842fc6d9b5c6cdcdc2144b65f692e9583fc18cbdf4427ecc', 'Cristian', 'Turner', '+13897499905', 1, true, true, 'bot_placeholder', NOW() - interval '154 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('72616786-e425-4a58-aca9-b59612257070', '9a68553f-1b0f-436e-9d5b-145782fc5382', 45.00, 14, 'Experienced keeper with quick reflexes and strong communication skills.', 49.8745, -97.1549, 20, 4.9, 15, 1, true, NOW() - interval '155 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7bb18a4d-ab11-496f-9b8c-6db6ca7bbdbe', 'eduardo.nguyen@bot.goaliefinder.local', '$2a$11$BOT5dd45b86e2b83718c141b9f5aedb54a7a72e7bb98b4f28c138', 'Eduardo', 'Nguyen', '+17847316641', 1, true, true, 'bot_placeholder', NOW() - interval '70 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('587aa3bd-1daa-42d6-814f-5f7d5a95fe4b', '7bb18a4d-ab11-496f-9b8c-6db6ca7bbdbe', 15.00, 8, 'Tall keeper with a long reach. Command the box effectively.', 49.8663, -97.0979, 25, 4.0, 65, 63, true, NOW() - interval '104 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('483a9f89-89d2-4182-901c-d1342b37432e', 'victor.tran@bot.goaliefinder.local', '$2a$11$BOT40b88d5f1db6ad6475ef406bd01ac6608d9e20ff92d0698714', 'Victor', 'Tran', '+14483674866', 1, true, true, 'bot_placeholder', NOW() - interval '142 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a306efbf-50b4-448a-908b-92dee351b25f', '483a9f89-89d2-4182-901c-d1342b37432e', 15.00, 14, 'New to the city and looking to play as much as possible.', 49.9374, -97.0803, 15, 4.3, 41, 33, true, NOW() - interval '45 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2b3025e7-9195-42d6-812c-36a69798d63e', 'roberto.thompson@bot.goaliefinder.local', '$2a$11$BOTbcd742cce5c6ca2917642b0f008748b196a2ca33edef183db4', 'Roberto', 'Thompson', '+15912207744', 1, true, true, 'bot_placeholder', NOW() - interval '172 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('78ef0d70-ee9a-4d4a-87ff-2384a0972942', '2b3025e7-9195-42d6-812c-36a69798d63e', 25.00, 11, 'Strong penalty saver. Calm and focused under pressure.', 49.9505, -97.0922, 30, 4.8, 32, 30, true, NOW() - interval '72 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('03fb2d53-73ce-4ddc-b6fc-d0b53a9a8368', 'noah.kofi@bot.goaliefinder.local', '$2a$11$BOT98cee19419b297fe6faa58d70c6485fd2a322378ca47f1ebdb', 'Noah', 'Kofi', '+18185216800', 1, true, true, 'bot_placeholder', NOW() - interval '100 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('53219392-f591-46e0-86a1-1c53b50f40d5', '03fb2d53-73ce-4ddc-b6fc-d0b53a9a8368', 30.00, 11, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 49.9182, -97.0991, 10, 4.5, 17, 10, true, NOW() - interval '124 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0e5785c5-c9f8-4a26-80e2-8063411e95ee', 'eduardo.gauthier@bot.goaliefinder.local', '$2a$11$BOT1e8b0710cb5d0b3a13d3161fc25e7f5b53e15e9d84f3d15603', 'Eduardo', 'Gauthier', '+16324261686', 1, true, true, 'bot_placeholder', NOW() - interval '44 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1c9e0927-79ed-4b90-a184-ce63a24c8130', '0e5785c5-c9f8-4a26-80e2-8063411e95ee', 20.00, 10, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 49.8446, -97.182, 20, 4.4, 12, 6, true, NOW() - interval '166 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ccc5d778-75a0-412f-8f9b-b17fe4bcd01b', 'gabriel.singh@bot.goaliefinder.local', '$2a$11$BOT937773e42016e375636a1001c63227d1a68e407fe32b3bdc23', 'Gabriel', 'Singh', '+15554418594', 1, true, true, 'bot_placeholder', NOW() - interval '90 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('226f0fe4-d619-4231-8908-38d665410b37', 'ccc5d778-75a0-412f-8f9b-b17fe4bcd01b', 40.00, 2, 'Friendly and competitive. Great at organizing the defense.', 49.8736, -97.1039, 25, 4.2, 0, 0, true, NOW() - interval '179 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4416efcf-50ae-4e8f-9e3e-4284d778b8a0', 'travis.davis@bot.goaliefinder.local', '$2a$11$BOTaf455ff807a23507393fc521e3e0e345fd094408aff6fcec43', 'Travis', 'Davis', '+16807925200', 1, true, true, 'bot_placeholder', NOW() - interval '110 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2031f608-7efb-40d9-85ef-a19c2e78b0ae', '4416efcf-50ae-4e8f-9e3e-4284d778b8a0', 50.00, 15, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 49.8497, -97.155, 15, 4.9, 64, 56, true, NOW() - interval '41 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2a1cd649-52c9-4b14-b108-d1e4fd25c78f', 'andrew.evans@bot.goaliefinder.local', '$2a$11$BOTa2d8f3ffe10eaaf94b1654695d84c23e2da4f5eaed0bec89b9', 'Andrew', 'Evans', '+18418435094', 1, true, true, 'bot_placeholder', NOW() - interval '158 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e0ab05ea-db4d-4b8c-92d1-49afc640fc3e', '2a1cd649-52c9-4b14-b108-d1e4fd25c78f', 25.00, 4, 'Retired semi-pro goalkeeper. Still got it!', 49.8708, -97.2102, 15, 4.2, 83, 68, true, NOW() - interval '55 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f3a7978c-9f18-4618-9c0d-7f05f12ce368', 'troy.miller@bot.goaliefinder.local', '$2a$11$BOTd18de0111ba54742975b5bdd5f297956aa709914cc198af87d', 'Troy', 'Miller', '+15545473227', 1, true, true, 'bot_placeholder', NOW() - interval '140 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3f165a33-9052-4401-9c35-b30505139c93', 'f3a7978c-9f18-4618-9c0d-7f05f12ce368', 25.00, 11, 'Tall keeper with a long reach. Command the box effectively.', 49.8793, -97.1274, 30, 4.0, 74, 69, true, NOW() - interval '123 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0161b4c0-8b83-4312-8223-16e790f8f9d1', 'dylan.morris@bot.goaliefinder.local', '$2a$11$BOTf29d480b7ee9fe0bbcfdf938d9121e683dd3a0de557895c99d', 'Dylan', 'Morris', '+16437166711', 1, true, true, 'bot_placeholder', NOW() - interval '6 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1647a6f4-826a-4cc5-81d5-bba588e20ef3', '0161b4c0-8b83-4312-8223-16e790f8f9d1', 35.00, 7, 'University-level goalkeeper looking for extra matches.', 49.8927, -97.1254, 15, 4.7, 2, 0, true, NOW() - interval '12 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('04a3157a-cafe-42eb-9ba9-3472ad7a61ce', 'diego.hassan@bot.goaliefinder.local', '$2a$11$BOT2dd7253b88c9af8eff94b72989a46dfffba3166f434586a3a7', 'Diego', 'Hassan', '+13966311484', 1, true, true, 'bot_placeholder', NOW() - interval '49 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('3f0f24c8-a51b-4657-841d-954ef8317a74', '04a3157a-cafe-42eb-9ba9-3472ad7a61ce', 25.00, 5, 'Strong penalty saver. Calm and focused under pressure.', 49.8409, -97.0858, 20, 3.6, 2, 0, true, NOW() - interval '69 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5809162e-cb3b-489f-a0b6-c2b69bdf4813', 'henry.cruz@bot.goaliefinder.local', '$2a$11$BOT16a9b271ac834aa99482c6d9ade42798287f5b4b759804a32e', 'Henry', 'Cruz', '+17673688737', 1, true, true, 'bot_placeholder', NOW() - interval '158 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('96822863-a987-4ff8-97cc-8a5c866fb5c0', '5809162e-cb3b-489f-a0b6-c2b69bdf4813', 30.00, 6, 'Solid keeper with a positive attitude. Always on time.', 49.9399, -97.1579, 15, 4.8, 0, 0, true, NOW() - interval '6 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0ef00050-9701-46ae-818f-8e12c87c8814', 'ivan.williams@bot.goaliefinder.local', '$2a$11$BOT45a88d92c74f1d84ae305e9776be07639833fcdb3d70503065', 'Ivan', 'Williams', '+16164104130', 1, true, true, 'bot_placeholder', NOW() - interval '178 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b6aaf2f5-86f2-4c46-8f27-0c1f6983c083', '0ef00050-9701-46ae-818f-8e12c87c8814', 15.00, 6, 'Friendly and competitive. Great at organizing the defense.', 49.9251, -97.207, 20, 4.3, 7, 0, true, NOW() - interval '79 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9c0316fb-7d70-45ab-bdd0-29608078f906', 'aiden.hassan@bot.goaliefinder.local', '$2a$11$BOT058d96ffd625ab5a7e9268a75532fc5ae9b8ace93e19943b6c', 'Aiden', 'Hassan', '+13594223628', 1, true, true, 'bot_placeholder', NOW() - interval '106 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b4311cba-41ec-47bc-8e0a-a1996f69d7d7', '9c0316fb-7d70-45ab-bdd0-29608078f906', 50.00, 8, 'Friendly and competitive. Great at organizing the defense.', 49.8539, -97.1536, 25, 4.9, 41, 22, true, NOW() - interval '97 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('03daec25-a304-43b3-b0d1-edf6452ae4af', 'thomas.torres@bot.goaliefinder.local', '$2a$11$BOT1fa3d40233afbf6878e21b42c906c1095e92ad7bdb8931e458', 'Thomas', 'Torres', '+16487041899', 1, true, true, 'bot_placeholder', NOW() - interval '97 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('96c32720-8af2-4508-a669-2d46c6cac037', '03daec25-a304-43b3-b0d1-edf6452ae4af', 25.00, 6, 'Solid keeper with a positive attitude. Always on time.', 49.8396, -97.1023, 20, 3.5, 34, 16, true, NOW() - interval '122 days', NOW());
-- === Saskatoon (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('deb4ca15-5886-4919-b9fb-80643a39241f', 'matthew.silva@bot.goaliefinder.local', '$2a$11$BOT7cbb0580f6d65c7b229dfc62082087b163483e60e58e7c41df', 'Matthew', 'Silva', '+15424545145', 1, true, true, 'bot_placeholder', NOW() - interval '53 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9f5467ad-16e2-42df-8e58-ba9fa9ee142d', 'deb4ca15-5886-4919-b9fb-80643a39241f', 25.00, 12, 'Solid keeper with a positive attitude. Always on time.', 52.0805, -106.6827, 30, 3.8, 29, 12, true, NOW() - interval '28 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('73f692c5-da5f-45f1-883a-635cb90fe276', 'simon.phillips@bot.goaliefinder.local', '$2a$11$BOT9b04dd3aa4eb3f9430255209c60aca73affda3b23162feb5a6', 'Simon', 'Phillips', '+16147065391', 1, true, true, 'bot_placeholder', NOW() - interval '27 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('49237da3-6a9e-405d-9c57-69444d0ea8bc', '73f692c5-da5f-45f1-883a-635cb90fe276', 50.00, 13, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 52.1749, -106.7383, 15, 4.6, 69, 56, true, NOW() - interval '153 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('838322d0-1439-4a59-86e1-784d36c5ca7c', 'patrick.fernandez@bot.goaliefinder.local', '$2a$11$BOT589a0b14565ff172f9bfb978178d19c63cc527a56fedfda9b0', 'Patrick', 'Fernandez', '+17151861235', 1, true, true, 'bot_placeholder', NOW() - interval '26 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9886db45-f3fd-4ba8-a47c-ec00aade67dd', '838322d0-1439-4a59-86e1-784d36c5ca7c', 45.00, 9, 'Athletic shot-stopper with years of competitive experience.', 52.143, -106.631, 25, 4.2, 66, 53, true, NOW() - interval '166 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a2494fbe-0e2e-446e-9df6-3e8f5c28f823', 'caleb.flores@bot.goaliefinder.local', '$2a$11$BOT39872c4ff317745750df00ba3039458e16704db303d31ed78a', 'Caleb', 'Flores', '+19045491828', 1, true, true, 'bot_placeholder', NOW() - interval '88 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('319499bf-d479-46ac-8e4b-0ab8b8c22df4', 'a2494fbe-0e2e-446e-9df6-3e8f5c28f823', 45.00, 8, 'Calm under pressure. Played competitive soccer for 8 years.', 52.173, -106.6119, 25, 4.6, 57, 50, true, NOW() - interval '45 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fe01be7b-136e-414d-aff4-6b5136bbdd28', 'brandon.torres@bot.goaliefinder.local', '$2a$11$BOT01e4d32f6d93a591a3fa0e0a251d682491e66ab9ca44997a87', 'Brandon', 'Torres', '+19032890121', 1, true, true, 'bot_placeholder', NOW() - interval '132 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('62f751b1-fcd9-4332-85db-6a57652f35df', 'fe01be7b-136e-414d-aff4-6b5136bbdd28', 40.00, 10, 'Versatile keeper, great with distribution and organizing the back line.', 52.1237, -106.619, 10, 3.7, 43, 24, true, NOW() - interval '86 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9c84eebc-d0ab-42b6-a7b6-3ccef1e59849', 'paolo.le@bot.goaliefinder.local', '$2a$11$BOT76a9a57d515460c5a921e53e905728275a62501c2b4486fe57', 'Paolo', 'Le', '+15621736864', 1, true, true, 'bot_placeholder', NOW() - interval '28 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('75b37bc6-7ef4-4d43-a0fc-f0dcb8767da9', '9c84eebc-d0ab-42b6-a7b6-3ccef1e59849', 25.00, 13, 'Provincial-level experience. Strong with high balls and one-on-ones.', 52.1669, -106.6693, 15, 4.0, 69, 67, true, NOW() - interval '36 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a57d8925-a7bd-4135-83b9-a402a5a73fae', 'aaron.pelletier@bot.goaliefinder.local', '$2a$11$BOT419b22a64b3c163e1808824368915e5290ba84a17902db4271', 'Aaron', 'Pelletier', '+18979730161', 1, true, true, 'bot_placeholder', NOW() - interval '105 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('df1d60b9-8fd2-4d76-8db5-6e367d621fc5', 'a57d8925-a7bd-4135-83b9-a402a5a73fae', 20.00, 8, 'Athletic shot-stopper with years of competitive experience.', 52.1028, -106.6962, 25, 4.4, 13, 0, true, NOW() - interval '108 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6d579ec2-0ee7-4062-9f6e-88964dd7679f', 'aaron.singh@bot.goaliefinder.local', '$2a$11$BOTec48e3013aebaedcf4ce85af5db19bea08b52674b27493ebfc', 'Aaron', 'Singh', '+15963899486', 1, true, true, 'bot_placeholder', NOW() - interval '170 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bdb46eff-51e2-4f7f-a5e0-bc4505e8c327', '6d579ec2-0ee7-4062-9f6e-88964dd7679f', 25.00, 10, 'Passionate about the game. Consistent and dependable between the posts.', 52.1416, -106.7327, 10, 4.3, 82, 71, true, NOW() - interval '34 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('cda92df0-c007-48b2-8ddc-1e77753b6219', 'nathan.jones@bot.goaliefinder.local', '$2a$11$BOTb1dc358139a6ee35d53cfd5490aebe8455b2f3d01f21dc0733', 'Nathan', 'Jones', '+19716281749', 1, true, true, 'bot_placeholder', NOW() - interval '140 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d4b61133-a1fb-477a-a167-1f6624d21c76', 'cda92df0-c007-48b2-8ddc-1e77753b6219', 25.00, 11, 'Provincial-level experience. Strong with high balls and one-on-ones.', 52.0999, -106.7394, 25, 3.9, 25, 15, true, NOW() - interval '131 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('534a4d62-c5b3-487e-aa44-9efaf202f002', 'hector.kim@bot.goaliefinder.local', '$2a$11$BOT0a5bf530782fe4e710aace3fb987addc92c60a64a5f9e79434', 'Hector', 'Kim', '+16312365256', 1, true, true, 'bot_placeholder', NOW() - interval '105 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7126723f-8458-4f09-8b0b-9ca862f1f95c', '534a4d62-c5b3-487e-aa44-9efaf202f002', 30.00, 5, 'Passionate about the game. Consistent and dependable between the posts.', 52.1838, -106.696, 10, 3.8, 40, 28, true, NOW() - interval '111 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6a29ece2-73c1-4f6a-a543-bcc91e6d2354', 'eric.clark@bot.goaliefinder.local', '$2a$11$BOT455b0731c5b4f88de61a4a3a6099fc1b71fcd2731190fb4662', 'Eric', 'Clark', '+19872397106', 1, true, true, 'bot_placeholder', NOW() - interval '91 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0a285f0b-5d7e-4377-afaf-557b01c37a7b', '6a29ece2-73c1-4f6a-a543-bcc91e6d2354', 20.00, 15, 'Weekend warrior goalkeeper. Love the beautiful game!', 52.084, -106.63, 10, 4.5, 60, 58, true, NOW() - interval '58 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fbc3cfb4-76fb-4db6-89cb-eb7ba0527ff7', 'alberto.silva@bot.goaliefinder.local', '$2a$11$BOTfab0d3a1cf90dadfebf0eee666893c2b58dc85ce0c05cc6d34', 'Alberto', 'Silva', '+16825369819', 1, true, true, 'bot_placeholder', NOW() - interval '17 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('352bd71d-ca56-4abe-8c60-e586f9eb5256', 'fbc3cfb4-76fb-4db6-89cb-eb7ba0527ff7', 25.00, 5, 'Fast and agile. Best on turf and indoor surfaces.', 52.1143, -106.7234, 15, 3.9, 27, 20, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6c7e02e9-c2c6-42ac-a92f-ed2645d27ced', 'vikram.wang@bot.goaliefinder.local', '$2a$11$BOTe327b27fb738f28e98809e9276b68699d274a4e7f832f32909', 'Vikram', 'Wang', '+16143186744', 1, true, true, 'bot_placeholder', NOW() - interval '93 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7bb17073-65bf-4504-bcdd-d715198e0462', '6c7e02e9-c2c6-42ac-a92f-ed2645d27ced', 20.00, 2, 'Calm under pressure. Played competitive soccer for 8 years.', 52.079, -106.5905, 30, 4.4, 58, 49, true, NOW() - interval '85 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b685033a-4e04-4402-b32e-00c851a2c635', 'théo.pelletier@bot.goaliefinder.local', '$2a$11$BOT2d58ff330c0fac6c0938d42d302e09c677488b28c86100bac5', 'Théo', 'Pelletier', '+19603742024', 1, true, true, 'bot_placeholder', NOW() - interval '164 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f3c0bd59-d33d-41b7-93f9-d84534be8ba3', 'b685033a-4e04-4402-b32e-00c851a2c635', 25.00, 7, 'Reliable shot-stopper available for weekend and weekday games.', 52.1504, -106.7196, 15, 4.9, 69, 49, true, NOW() - interval '129 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('77ce76d8-0ba0-4a27-8769-365ee04f3f4c', 'tyler.lee@bot.goaliefinder.local', '$2a$11$BOT802080bdeffb3ae9199ded659192a0512758d076ac4ed6d1a6', 'Tyler', 'Lee', '+12736601164', 1, true, true, 'bot_placeholder', NOW() - interval '85 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('414ef401-0c29-4d33-8a9d-8db6f34f9c85', '77ce76d8-0ba0-4a27-8769-365ee04f3f4c', 50.00, 1, 'University-level goalkeeper looking for extra matches.', 52.1677, -106.7109, 20, 3.6, 24, 7, true, NOW() - interval '121 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('e706fdcb-d202-447a-9f38-bcaa4e9e85b3', 'guillaume.tran@bot.goaliefinder.local', '$2a$11$BOT55181b8b35033c59a919bd086ea7f672010e215ccdf847e02d', 'Guillaume', 'Tran', '+19367362220', 1, true, true, 'bot_placeholder', NOW() - interval '177 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('08d8e924-ad07-4081-86a2-6ea4965848f4', 'e706fdcb-d202-447a-9f38-bcaa4e9e85b3', 50.00, 12, 'Strong penalty saver. Calm and focused under pressure.', 52.1759, -106.727, 15, 3.8, 9, 9, true, NOW() - interval '32 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('23ccf369-d278-4163-8a6c-be1af5dbbfa5', 'oscar.gagnon@bot.goaliefinder.local', '$2a$11$BOTb180286fe7bbc4fc24f908dfdab72ab6ed8ac04586a0e0fdfd', 'Oscar', 'Gagnon', '+18689561399', 1, true, true, 'bot_placeholder', NOW() - interval '116 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('189797cc-8233-45df-ad8a-c2f0c42e5b87', '23ccf369-d278-4163-8a6c-be1af5dbbfa5', 35.00, 8, 'Friendly and competitive. Great at organizing the defense.', 52.0802, -106.6063, 20, 4.9, 37, 29, true, NOW() - interval '54 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('4d516ed3-fa26-40c9-a532-315e9df2b88a', 'james.chen@bot.goaliefinder.local', '$2a$11$BOTb97896d97fe18f6985d435f51e7a0a8707289edf76fcd1ddf9', 'James', 'Chen', '+15487054560', 1, true, true, 'bot_placeholder', NOW() - interval '158 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f5b29b6a-21f5-4dc6-aa4a-2b9226a5d5fb', '4d516ed3-fa26-40c9-a532-315e9df2b88a', 30.00, 12, 'Played keeper since I was 12. Quick feet and safe hands.', 52.0979, -106.5931, 10, 4.2, 17, 15, true, NOW() - interval '101 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bafdd595-257f-4cf5-9d71-2d37cb7c9cc9', 'ricardo.harris@bot.goaliefinder.local', '$2a$11$BOT4975d5d4441acc2a88ca3bfebe2f76ee6133d2e153cb6445f7', 'Ricardo', 'Harris', '+14258814571', 1, true, true, 'bot_placeholder', NOW() - interval '132 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4813b806-73e2-4051-bbd7-b0943f2162b6', 'bafdd595-257f-4cf5-9d71-2d37cb7c9cc9', 25.00, 15, 'Technical goalkeeper who loves playing out from the back.', 52.0811, -106.6471, 15, 4.0, 17, 1, true, NOW() - interval '46 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('afac0d3b-29f9-4204-9777-6c4837c7f60e', 'ravi.wang@bot.goaliefinder.local', '$2a$11$BOTf26405e4ee0689f63ee89098757b2c2717da0119d5e79a1a25', 'Ravi', 'Wang', '+17879135055', 1, true, true, 'bot_placeholder', NOW() - interval '111 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b1312a24-82f1-4c83-9ccb-a282dca0e751', 'afac0d3b-29f9-4204-9777-6c4837c7f60e', 25.00, 13, 'Provincial-level experience. Strong with high balls and one-on-ones.', 52.1341, -106.6431, 25, 4.6, 29, 17, true, NOW() - interval '3 days', NOW());
-- === Halifax (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5baccc52-a7ab-45be-8cf5-900bd8a4b1c2', 'aaron.thomas@bot.goaliefinder.local', '$2a$11$BOTc630b95c271d9a461ae747c00760883f3e8164d6c1592f69f9', 'Aaron', 'Thomas', '+19989252660', 1, true, true, 'bot_placeholder', NOW() - interval '72 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6f05cd4a-58c3-4964-a57f-e875c6734f1e', '5baccc52-a7ab-45be-8cf5-900bd8a4b1c2', 35.00, 3, 'Experienced in 5-a-side, 7-a-side, and 11-a-side formats.', 44.6353, -63.6394, 15, 4.8, 43, 25, true, NOW() - interval '23 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3d49c8d5-36cc-4d9b-b70a-ecdff15d3b29', 'aiden.king@bot.goaliefinder.local', '$2a$11$BOTd85d75d967b68f19866daa3afaa878946508e9c2b21fbcc128', 'Aiden', 'King', '+14197223489', 1, true, true, 'bot_placeholder', NOW() - interval '29 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6974b564-0baf-4d0c-85a4-80a0eaff2843', '3d49c8d5-36cc-4d9b-b70a-ecdff15d3b29', 30.00, 9, 'Tall keeper with a long reach. Command the box effectively.', 44.6594, -63.6419, 15, 4.7, 45, 27, true, NOW() - interval '71 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b8b259a8-9720-423e-88a6-4387d9e637aa', 'marco.green@bot.goaliefinder.local', '$2a$11$BOT81311e4efd4a84fdcd484be0e8a7f42b64487d8634dc8e0cc7', 'Marco', 'Green', '+16603753546', 1, true, true, 'bot_placeholder', NOW() - interval '26 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6e5c395a-515b-4e61-9cdb-a0ee113e817c', 'b8b259a8-9720-423e-88a6-4387d9e637aa', 25.00, 10, 'Tall keeper with a long reach. Command the box effectively.', 44.6715, -63.5115, 25, 3.8, 56, 55, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3748d8ce-c1f4-4b0b-bbd7-f853b46c96cd', 'pierre.kofi@bot.goaliefinder.local', '$2a$11$BOT424cbdc3cba4f8cbe50d1d7eb004a1985b382bf97f21457623', 'Pierre', 'Kofi', '+19603788966', 1, true, true, 'bot_placeholder', NOW() - interval '88 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('18d50355-cfe3-4b1e-a4dd-da86b343a730', '3748d8ce-c1f4-4b0b-bbd7-f853b46c96cd', 50.00, 11, 'Experienced keeper with quick reflexes and strong communication skills.', 44.638, -63.5991, 15, 4.9, 16, 6, true, NOW() - interval '53 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c8ecac9e-c6ba-4aa5-8ce3-b0c0d510eedd', 'pierre.cruz@bot.goaliefinder.local', '$2a$11$BOT2b6f574cffdf2c44ffd999a3cd486979b7d5212f83590597d5', 'Pierre', 'Cruz', '+13117600437', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d971a9e1-8d33-4d9a-a6e5-bc7edd86de8a', 'c8ecac9e-c6ba-4aa5-8ce3-b0c0d510eedd', 25.00, 14, 'Solid keeper with a positive attitude. Always on time.', 44.6278, -63.5362, 10, 4.2, 67, 47, true, NOW() - interval '18 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f44c2de1-79bb-4cc4-9d9c-03fff1682c92', 'luis.ibrahim@bot.goaliefinder.local', '$2a$11$BOT95a3189a2bdb868641d1cbca56d1402c57800e795907a12d92', 'Luis', 'Ibrahim', '+17846591741', 1, true, true, 'bot_placeholder', NOW() - interval '32 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('ed92566d-a279-4e3c-89eb-5f84593080ba', 'f44c2de1-79bb-4cc4-9d9c-03fff1682c92', 30.00, 6, 'Strong penalty saver. Calm and focused under pressure.', 44.5948, -63.5079, 30, 3.9, 42, 41, true, NOW() - interval '104 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0212d20d-9452-4df4-9eec-00b94cc43956', 'andres.chukwu@bot.goaliefinder.local', '$2a$11$BOTf9a4633bcbc19ab6b00b0f2f0a634c7acf3802841e0b0666f7', 'Andres', 'Chukwu', '+16885557670', 1, true, true, 'bot_placeholder', NOW() - interval '20 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('83f43b6f-4024-4c8f-b6ad-8c2c02536dbb', '0212d20d-9452-4df4-9eec-00b94cc43956', 30.00, 11, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 44.614, -63.6502, 10, 4.9, 34, 31, true, NOW() - interval '29 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('c591e11f-a1bb-4391-8326-cbaeaa212927', 'carter.gauthier@bot.goaliefinder.local', '$2a$11$BOT41e5375b9f2f43cc3db01f451ddcfe448fd827462333c6b72a', 'Carter', 'Gauthier', '+13478471263', 1, true, true, 'bot_placeholder', NOW() - interval '75 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f9ca90a6-70ab-45a6-a083-9de2166d0dbe', 'c591e11f-a1bb-4391-8326-cbaeaa212927', 20.00, 8, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 44.5965, -63.5418, 30, 4.5, 16, 1, true, NOW() - interval '52 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8c5eaf51-495a-4b66-8318-ca7db9b008d7', 'julien.ali@bot.goaliefinder.local', '$2a$11$BOTa4fa87cc87876511ff671a34fef2966799092b71b3fcedbe23', 'Julien', 'Ali', '+14188451308', 1, true, true, 'bot_placeholder', NOW() - interval '52 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('a58227ea-09fd-48d5-aeeb-2556ba4f259f', '8c5eaf51-495a-4b66-8318-ca7db9b008d7', 25.00, 8, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 44.6063, -63.5712, 10, 3.7, 71, 51, true, NOW() - interval '115 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d8884ecc-5d27-45f0-a51d-1cd0451d99bc', 'troy.morales@bot.goaliefinder.local', '$2a$11$BOTa9b6259c6fed14227da0b5b99e81ffa78d4f59a6e078a385bf', 'Troy', 'Morales', '+15563650746', 1, true, true, 'bot_placeholder', NOW() - interval '65 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('fa1a7cf1-7049-4d54-b796-d73b46f90118', 'd8884ecc-5d27-45f0-a51d-1cd0451d99bc', 15.00, 5, 'Passionate about the game. Consistent and dependable between the posts.', 44.6762, -63.5929, 30, 5.0, 63, 44, true, NOW() - interval '28 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('fdc0bc4a-7ebe-4b9b-8c7f-bf18dc5f9567', 'troy.phillips@bot.goaliefinder.local', '$2a$11$BOTb92f87b32b27e2bff0e4cdb92d6c7929c671071dda5d0beeb3', 'Troy', 'Phillips', '+17185277619', 1, true, true, 'bot_placeholder', NOW() - interval '9 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('0b8fe5db-a43e-49b8-b751-6bd349bfd536', 'fdc0bc4a-7ebe-4b9b-8c7f-bf18dc5f9567', 25.00, 4, 'Played keeper since I was 12. Quick feet and safe hands.', 44.6852, -63.5802, 20, 4.5, 76, 65, true, NOW() - interval '166 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('a51afa1f-6771-4bff-81be-71842e6a3551', 'paolo.wilson@bot.goaliefinder.local', '$2a$11$BOT391cf3843d2dcd62107eab9c4c560ca1830c4fdfe0b0598f0e', 'Paolo', 'Wilson', '+15293483163', 1, true, true, 'bot_placeholder', NOW() - interval '150 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('9a8613bc-177e-4a56-a3d5-1630ca9c1e1c', 'a51afa1f-6771-4bff-81be-71842e6a3551', 50.00, 5, 'Solid keeper with a positive attitude. Always on time.', 44.6607, -63.5085, 10, 3.5, 42, 35, true, NOW() - interval '104 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0b9055b2-e5a3-4a77-a883-a18e23766801', 'kyle.silva@bot.goaliefinder.local', '$2a$11$BOT5f7a4d09e2d9ef812b7cdb6cee418a3903b4e5ddf877ba822b', 'Kyle', 'Silva', '+15492654531', 1, true, true, 'bot_placeholder', NOW() - interval '82 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('6277746b-1b5f-42c9-9d84-281ef548ef28', '0b9055b2-e5a3-4a77-a883-a18e23766801', 50.00, 3, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 44.6055, -63.4956, 20, 4.9, 18, 13, true, NOW() - interval '142 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6463d1be-b2b2-449e-ba07-6218334b824d', 'matthew.walker@bot.goaliefinder.local', '$2a$11$BOT968036115fc318dd5eab1278af479d2120cfc1cac8ff6aa79f', 'Matthew', 'Walker', '+16645037396', 1, true, true, 'bot_placeholder', NOW() - interval '150 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('29e3e252-2cd0-4a93-9889-52f1cff1a0e5', '6463d1be-b2b2-449e-ba07-6218334b824d', 25.00, 11, '10+ years in goal. Comfortable on turf, grass, or indoor surfaces.', 44.634, -63.5532, 15, 4.7, 52, 48, true, NOW() - interval '103 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('87b3761f-1382-4d17-b272-b32c2da14709', 'andrew.khan@bot.goaliefinder.local', '$2a$11$BOT50646058406eb9a1068177dbdf269601bbb74052b0d47f7152', 'Andrew', 'Khan', '+16497995741', 1, true, true, 'bot_placeholder', NOW() - interval '42 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('93f95364-fb21-4c6d-ac0c-9cd443401231', '87b3761f-1382-4d17-b272-b32c2da14709', 35.00, 8, 'Weekend warrior goalkeeper. Love the beautiful game!', 44.6709, -63.6021, 25, 4.3, 65, 46, true, NOW() - interval '7 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('7e91cf56-4346-49c3-b86d-48f3d56419d7', 'adrian.phillips@bot.goaliefinder.local', '$2a$11$BOT7a117d5c3386a27c11dd4da7422e7f4a86988ae23c2844aed4', 'Adrian', 'Phillips', '+13854494067', 1, true, true, 'bot_placeholder', NOW() - interval '119 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('4a91837a-cd3c-48bd-9e7d-2358dc9b5717', '7e91cf56-4346-49c3-b86d-48f3d56419d7', 45.00, 6, 'Technical goalkeeper who loves playing out from the back.', 44.6692, -63.6417, 30, 4.5, 35, 26, true, NOW() - interval '27 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('f709ba8c-ee63-4b13-ac77-2443c9de3230', 'owen.fortin@bot.goaliefinder.local', '$2a$11$BOT07cc5f62a916b5311af71180c8f5bde9b98f86d1230fff1040', 'Owen', 'Fortin', '+14551473021', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d8926546-a6e2-4962-a5cd-b95cad63e173', 'f709ba8c-ee63-4b13-ac77-2443c9de3230', 40.00, 8, 'Versatile keeper, great with distribution and organizing the back line.', 44.6682, -63.5663, 25, 4.0, 57, 56, true, NOW() - interval '139 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('83527745-ab3b-4a81-bd1c-70059afe311e', 'logan.clark@bot.goaliefinder.local', '$2a$11$BOT731b7de5e0325d81875b596c1d4efae45e7a116e2ce1f8b658', 'Logan', 'Clark', '+16438103823', 1, true, true, 'bot_placeholder', NOW() - interval '24 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('77496c6a-dbf4-49ed-b361-95c51a9e7032', '83527745-ab3b-4a81-bd1c-70059afe311e', 35.00, 1, 'Provincial-level experience. Strong with high balls and one-on-ones.', 44.6584, -63.6239, 30, 4.9, 12, 8, true, NOW() - interval '30 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('8f8fa3cc-fec5-4a3b-b7fc-a8447dac4f55', 'ravi.evans@bot.goaliefinder.local', '$2a$11$BOT595af4c9688b387dd02f2d4f9701d25371bcbb8592db7ac307', 'Ravi', 'Evans', '+19395196744', 1, true, true, 'bot_placeholder', NOW() - interval '102 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('b96be17d-9680-429b-9150-6d6d5c9a260d', '8f8fa3cc-fec5-4a3b-b7fc-a8447dac4f55', 25.00, 10, 'Provincial-level experience. Strong with high balls and one-on-ones.', 44.6371, -63.5828, 20, 4.5, 53, 53, true, NOW() - interval '147 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0dd3c711-edca-4853-bd9c-334070bb61cd', 'andres.hassan@bot.goaliefinder.local', '$2a$11$BOTded3d0d5905c2cfd72d9476e8f2270ecac35c6ed99f270b871', 'Andres', 'Hassan', '+15676546943', 1, true, true, 'bot_placeholder', NOW() - interval '131 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8e55da9d-e6e8-436f-bd75-87fc3cdadb5f', '0dd3c711-edca-4853-bd9c-334070bb61cd', 35.00, 13, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 44.6186, -63.5801, 10, 3.7, 64, 51, true, NOW() - interval '122 days', NOW());
-- === Moncton (20 goalkeepers) ===

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('104e8345-abe7-4c42-8e0d-8108784c4551', 'andre.williams@bot.goaliefinder.local', '$2a$11$BOT8311c47c501ce4b073552fa65bbfc8a332234d8b38221181c8', 'Andre', 'Williams', '+18198684519', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d762c5ba-e7a0-4033-ac82-e31cedc04ce4', '104e8345-abe7-4c42-8e0d-8108784c4551', 35.00, 5, 'Athletic shot-stopper with years of competitive experience.', 46.0854, -64.726, 20, 4.6, 18, 6, true, NOW() - interval '178 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ed007dd8-0bdf-453b-9430-6db0c02d9163', 'emilio.gagné@bot.goaliefinder.local', '$2a$11$BOTf07ccea551ac6f0ebe99cd35122c86ea01b14e4a611ce65a4a', 'Emilio', 'Gagné', '+13238601720', 1, true, true, 'bot_placeholder', NOW() - interval '147 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('c50a5320-b738-4632-a8de-7590cb8de826', 'ed007dd8-0bdf-453b-9430-6db0c02d9163', 50.00, 3, 'Fitness enthusiast and reliable goalkeeper. Available most evenings.', 46.0316, -64.7104, 25, 4.6, 57, 55, true, NOW() - interval '49 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('eebf12e3-0d05-4de1-9125-7793a065f018', 'carter.herrera@bot.goaliefinder.local', '$2a$11$BOTed21ff4869135383e12ef7d6413171e9e6e08a428e208f8a70', 'Carter', 'Herrera', '+14106068416', 1, true, true, 'bot_placeholder', NOW() - interval '127 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5069aafd-20f9-47e6-bc1d-2971eb74f6e0', 'eebf12e3-0d05-4de1-9125-7793a065f018', 45.00, 2, 'Provincial-level experience. Strong with high balls and one-on-ones.', 46.0722, -64.8557, 30, 4.8, 22, 4, true, NOW() - interval '63 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('6f9b53e2-9888-4f61-8ba0-5b86c6ca5300', 'amir.torres@bot.goaliefinder.local', '$2a$11$BOT47985e322e3af163cad921a0b337df4b6d7c33afc9c1f98e36', 'Amir', 'Torres', '+15337696307', 1, true, true, 'bot_placeholder', NOW() - interval '63 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('1fa06795-d986-41d6-851c-c4afca3c64e7', '6f9b53e2-9888-4f61-8ba0-5b86c6ca5300', 30.00, 8, 'Fast and agile. Best on turf and indoor surfaces.', 46.0942, -64.7392, 10, 4.4, 34, 14, true, NOW() - interval '66 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('df270ce2-8420-4356-a308-808ea58a1cf8', 'mathieu.johnson@bot.goaliefinder.local', '$2a$11$BOT6fad8312ab7cc4d862163c7b418e6861c4a40386448d77b9d2', 'Mathieu', 'Johnson', '+18599025536', 1, true, true, 'bot_placeholder', NOW() - interval '65 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bdb5b6e6-2c8a-4b3e-8621-8525d8d1cf64', 'df270ce2-8420-4356-a308-808ea58a1cf8', 30.00, 4, 'Provincial-level experience. Strong with high balls and one-on-ones.', 46.1315, -64.7989, 15, 3.9, 67, 51, true, NOW() - interval '83 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ab707950-6a1a-4eaa-af1b-c029ead0403c', 'victor.johnson@bot.goaliefinder.local', '$2a$11$BOT46a57422d82fdd7a7498fbda6c2464be0ef7b73410da0b02a6', 'Victor', 'Johnson', '+12724103064', 1, true, true, 'bot_placeholder', NOW() - interval '82 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('df5ec297-16b9-4ad5-884f-421eb3d7ed0e', 'ab707950-6a1a-4eaa-af1b-c029ead0403c', 30.00, 7, 'University-level goalkeeper looking for extra matches.', 46.0352, -64.7212, 20, 4.5, 19, 0, true, NOW() - interval '34 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('2088e95d-775f-4b25-8c58-31554cae005e', 'hugo.campbell@bot.goaliefinder.local', '$2a$11$BOTe7150f467b42e783fa02a04ab073293a5e0643812db3103cde', 'Hugo', 'Campbell', '+16951731757', 1, true, true, 'bot_placeholder', NOW() - interval '3 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('40cce273-27ce-4e52-8300-6e8cc1705b17', '2088e95d-775f-4b25-8c58-31554cae005e', 30.00, 2, 'Retired semi-pro goalkeeper. Still got it!', 46.0807, -64.8035, 15, 4.2, 75, 55, true, NOW() - interval '25 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0ef3c740-cc77-45b1-9a31-863b538aa566', 'carter.morales@bot.goaliefinder.local', '$2a$11$BOT1faaf12a039d2671ac6373b95a2f7d5411a46019fd36530efe', 'Carter', 'Morales', '+14519466595', 1, true, true, 'bot_placeholder', NOW() - interval '26 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('f296e1ae-6525-49c2-a4ba-bb28bc1aa072', '0ef3c740-cc77-45b1-9a31-863b538aa566', 25.00, 3, 'Solid keeper with a positive attitude. Always on time.', 46.0378, -64.7788, 20, 4.5, 3, 3, true, NOW() - interval '107 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('ad0dcbf9-5ab2-4938-bda9-f9e9e3fdfda8', 'owen.evans@bot.goaliefinder.local', '$2a$11$BOT5d41cdbdec3ca6fe16d5a73248063ec8950d5393775d470654', 'Owen', 'Evans', '+17767289184', 1, true, true, 'bot_placeholder', NOW() - interval '178 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('36a189d3-0f77-4411-82b1-695591fdd888', 'ad0dcbf9-5ab2-4938-bda9-f9e9e3fdfda8', 25.00, 10, 'Solid keeper with a positive attitude. Always on time.', 46.0704, -64.7618, 25, 4.6, 80, 72, true, NOW() - interval '82 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('9ee2e9a2-42ea-4e0d-a349-cfe29c2f61f1', 'arjun.oliveira@bot.goaliefinder.local', '$2a$11$BOTfdc3e1ec2c91850b2380d15c627b0a34f9c002ba3d69d5ae9a', 'Arjun', 'Oliveira', '+17718525650', 1, true, true, 'bot_placeholder', NOW() - interval '48 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('bc907041-7b75-45ea-8423-184fca2ad1f6', '9ee2e9a2-42ea-4e0d-a349-cfe29c2f61f1', 30.00, 1, 'Calm under pressure. Played competitive soccer for 8 years.', 46.0369, -64.7402, 20, 3.7, 71, 65, true, NOW() - interval '104 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('3c866fac-8679-4cc9-9894-94cfb604b74d', 'matthew.singh@bot.goaliefinder.local', '$2a$11$BOT14e0a0c96172173b2f8878c46638e3684f6751e5509230219f', 'Matthew', 'Singh', '+16907254810', 1, true, true, 'bot_placeholder', NOW() - interval '165 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('e6fca1d3-bf18-4f82-bfe5-256270aa43fd', '3c866fac-8679-4cc9-9894-94cfb604b74d', 25.00, 15, 'Goalkeeper coach by day, match keeper by night. Let''s play!', 46.1101, -64.771, 30, 5.0, 51, 39, true, NOW() - interval '150 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bd796733-fd6b-4a1b-aa87-63a5a964864c', 'yousef.lavoie@bot.goaliefinder.local', '$2a$11$BOT2f564d6a3a08e364d20da6aad1bc987c68a1e371b116259811', 'Yousef', 'Lavoie', '+15421389935', 1, true, true, 'bot_placeholder', NOW() - interval '77 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('526d9e4d-dbb6-4f58-b2c5-4ed13e826ba9', 'bd796733-fd6b-4a1b-aa87-63a5a964864c', 50.00, 2, 'Former academy goalkeeper, now playing recreational leagues.', 46.058, -64.7626, 30, 4.5, 18, 11, true, NOW() - interval '164 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('245c4805-cca0-4deb-a7bb-0bcf4c718fde', 'amir.garcia@bot.goaliefinder.local', '$2a$11$BOT14c0b1cbb9543e9914f4eeafe79559ec051544165919c20241', 'Amir', 'Garcia', '+14566214375', 1, true, true, 'bot_placeholder', NOW() - interval '78 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('2461d82b-46ce-45c7-8956-3f15b8125df4', '245c4805-cca0-4deb-a7bb-0bcf4c718fde', 40.00, 4, 'New to the city and looking to play as much as possible.', 46.0917, -64.7765, 20, 4.6, 81, 70, true, NOW() - interval '76 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('929db0c0-2d87-4b80-ad9b-0589ae195998', 'pierre.mohamed@bot.goaliefinder.local', '$2a$11$BOT847a9de4315c51e1cadb817f7dbc11dd35bc53de7ae0fcf808', 'Pierre', 'Mohamed', '+19969274703', 1, true, true, 'bot_placeholder', NOW() - interval '179 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7ae429ac-a65c-4cc7-93b8-727313d389ce', '929db0c0-2d87-4b80-ad9b-0589ae195998', 25.00, 11, 'Strong penalty saver. Calm and focused under pressure.', 46.0482, -64.7465, 10, 4.4, 66, 62, true, NOW() - interval '54 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('b5cd9095-e8d5-49b2-9a08-3bfa96a9534f', 'antonio.flores@bot.goaliefinder.local', '$2a$11$BOTd93dec93455e14b8bdd7d8cebbcfb042d7a432caa8ce879538', 'Antonio', 'Flores', '+19671444226', 1, true, true, 'bot_placeholder', NOW() - interval '68 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('7092cf03-624c-4375-8fa6-104d5d28105d', 'b5cd9095-e8d5-49b2-9a08-3bfa96a9534f', 30.00, 14, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 46.0778, -64.7173, 20, 3.8, 7, 0, true, NOW() - interval '171 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('55d6d143-9bd9-489f-a412-fe941b345218', 'noah.oliveira@bot.goaliefinder.local', '$2a$11$BOT15fda2aa5cced9b6698e987e888885526f6f6e153c9a2d28d3', 'Noah', 'Oliveira', '+18463806870', 1, true, true, 'bot_placeholder', NOW() - interval '98 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('8de8db51-366c-4080-adc8-bb081a913e31', '55d6d143-9bd9-489f-a412-fe941b345218', 40.00, 14, 'University-level goalkeeper looking for extra matches.', 46.0811, -64.7578, 20, 3.7, 2, 1, true, NOW() - interval '87 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('d2f3694a-4b42-444b-8058-7c02ccb1b102', 'jean.young@bot.goaliefinder.local', '$2a$11$BOTe2a048aff3726e081adf0bb7be5a2656b7130987c84ebe1b76', 'Jean', 'Young', '+17403148111', 1, true, true, 'bot_placeholder', NOW() - interval '125 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('aa2242ce-b0f6-45f0-bdc9-e0a9ce7cabdd', 'd2f3694a-4b42-444b-8058-7c02ccb1b102', 25.00, 2, 'Versatile keeper, great with distribution and organizing the back line.', 46.1227, -64.7656, 15, 4.9, 66, 46, true, NOW() - interval '72 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('5497e6aa-fbb6-4ea6-88c0-01d1bb3d716e', 'isaac.santos@bot.goaliefinder.local', '$2a$11$BOT4f70c74400a3b772df1a3cdd2263b165afcf74369021c1068b', 'Isaac', 'Santos', '+15193593797', 1, true, true, 'bot_placeholder', NOW() - interval '145 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('d78a8356-ba78-4c1d-8494-14d6b20d0371', '5497e6aa-fbb6-4ea6-88c0-01d1bb3d716e', 40.00, 7, 'Weekend warrior goalkeeper. Love the beautiful game!', 46.136, -64.7658, 10, 4.9, 20, 13, true, NOW() - interval '160 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('0abe02cd-c010-4511-b27b-d941b8c2d66c', 'alexander.morin@bot.goaliefinder.local', '$2a$11$BOT36fa6776087505538fecf35f6b701a8142750e0002292496ea', 'Alexander', 'Morin', '+18989934603', 1, true, true, 'bot_placeholder', NOW() - interval '50 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('92d4a279-e62d-462e-871f-ee1cf782998c', '0abe02cd-c010-4511-b27b-d941b8c2d66c', 30.00, 11, 'Played keeper since I was 12. Quick feet and safe hands.', 46.1275, -64.7093, 10, 4.2, 23, 17, true, NOW() - interval '80 days', NOW());

INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('bf73696a-8a9a-4677-af55-365c3f3bf80b', 'owen.martin@bot.goaliefinder.local', '$2a$11$BOT93ad79f7d6b75d05ec8efc7235f8fa22e1f205528921438895', 'Owen', 'Martin', '+15975463298', 1, true, true, 'bot_placeholder', NOW() - interval '134 days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('5b237dce-ffad-4777-b585-cb3bf3dc4ccd', 'bf73696a-8a9a-4677-af55-365c3f3bf80b', 25.00, 12, 'Former indoor league MVP. Excellent reflexes in tight spaces.', 46.0518, -64.7052, 30, 4.2, 15, 0, true, NOW() - interval '130 days', NOW());

COMMIT;
-- Total bot goalkeepers: 450
