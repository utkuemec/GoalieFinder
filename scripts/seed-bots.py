#!/usr/bin/env python3
"""Generate SQL to seed bot goalkeeper accounts across all Canadian cities."""

import uuid
import random
import hashlib
import json

CITIES = [
    {"name": "Toronto", "lat": 43.6532, "lng": -79.3832, "count": 25},
    {"name": "Mississauga", "lat": 43.5890, "lng": -79.6441, "count": 22},
    {"name": "Brampton", "lat": 43.7315, "lng": -79.7624, "count": 20},
    {"name": "Hamilton", "lat": 43.2557, "lng": -79.8711, "count": 20},
    {"name": "Ottawa", "lat": 45.4215, "lng": -75.6972, "count": 22},
    {"name": "Markham", "lat": 43.8561, "lng": -79.3370, "count": 20},
    {"name": "Vaughan", "lat": 43.8361, "lng": -79.4983, "count": 20},
    {"name": "Kitchener-Waterloo", "lat": 43.4516, "lng": -80.4925, "count": 20},
    {"name": "London", "lat": 42.9849, "lng": -81.2453, "count": 20},
    {"name": "Milton", "lat": 43.5183, "lng": -79.8774, "count": 20},
    {"name": "Vancouver", "lat": 49.2827, "lng": -123.1207, "count": 25},
    {"name": "Surrey", "lat": 49.1913, "lng": -122.8490, "count": 22},
    {"name": "Richmond", "lat": 49.1666, "lng": -123.1336, "count": 20},
    {"name": "Montreal", "lat": 45.5017, "lng": -73.5673, "count": 25},
    {"name": "Quebec City", "lat": 46.8139, "lng": -71.2080, "count": 20},
    {"name": "Calgary", "lat": 51.0447, "lng": -114.0719, "count": 25},
    {"name": "Edmonton", "lat": 53.5461, "lng": -113.4938, "count": 22},
    {"name": "Winnipeg", "lat": 49.8951, "lng": -97.1384, "count": 22},
    {"name": "Saskatoon", "lat": 52.1332, "lng": -106.6700, "count": 20},
    {"name": "Halifax", "lat": 44.6488, "lng": -63.5752, "count": 20},
    {"name": "Moncton", "lat": 46.0878, "lng": -64.7782, "count": 20},
]

FIRST_NAMES = [
    "Liam", "Noah", "Oliver", "James", "Ethan", "Lucas", "Mason", "Logan",
    "Alexander", "Benjamin", "Henry", "Sebastian", "Jack", "Daniel", "Owen",
    "Samuel", "Ryan", "Nathan", "Adrian", "Dylan", "Leo", "Mateo", "Isaac",
    "Jayden", "Caleb", "Max", "Marcus", "Aiden", "Connor", "Carter",
    "Michael", "David", "Andrew", "Matthew", "Tyler", "Brandon", "Justin",
    "Jordan", "Kevin", "Jason", "Kyle", "Aaron", "Eric", "Brian", "Scott",
    "Patrick", "Derek", "Travis", "Troy", "Shane", "Sergio", "Diego",
    "Carlos", "Marco", "Andre", "Rafael", "Hugo", "Gabriel", "Felipe",
    "Santiago", "Alejandro", "Andres", "Paolo", "Luis", "Eduardo", "Victor",
    "Roberto", "Antonio", "Cristian", "Josue", "Emilio", "Alberto", "Oscar",
    "Ricardo", "Fernando", "Hector", "Miguel", "Jorge", "Raul", "Ivan",
    "Arjun", "Ravi", "Vikram", "Rohan", "Amir", "Tariq", "Khalil", "Yousef",
    "Hiroshi", "Kenji", "Takumi", "Wei", "Jun", "Min", "Sung", "Jae",
    "Pierre", "Jean", "François", "Guillaume", "Mathieu", "Antoine", "Rémi",
    "Théo", "Maxime", "Alexandre", "Nicolas", "Thomas", "Julien", "Simon",
]

LAST_NAMES = [
    "Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller",
    "Davis", "Rodriguez", "Martinez", "Wilson", "Anderson", "Taylor", "Thomas",
    "Moore", "Jackson", "Martin", "Lee", "Thompson", "White", "Harris",
    "Clark", "Lewis", "Robinson", "Walker", "Young", "King", "Wright",
    "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Campbell",
    "Mitchell", "Roberts", "Carter", "Phillips", "Evans", "Turner", "Torres",
    "Parker", "Collins", "Edwards", "Stewart", "Flores", "Morris", "Murphy",
    "Silva", "Santos", "Oliveira", "Fernandez", "Morales", "Reyes", "Cruz",
    "Perez", "Ramirez", "Gonzalez", "Herrera", "Mendez", "Castillo", "Vargas",
    "Kim", "Park", "Chen", "Wang", "Li", "Singh", "Patel", "Khan",
    "Ahmed", "Ali", "Hassan", "Ibrahim", "Mohamed", "Nguyen", "Tran", "Le",
    "Tanaka", "Suzuki", "Sato", "Tremblay", "Gagnon", "Roy", "Côté",
    "Bouchard", "Gauthier", "Morin", "Lavoie", "Fortin", "Gagné", "Pelletier",
    "Okafor", "Adebayo", "Chukwu", "Osei", "Mensah", "Kofi", "Diallo",
]

BIOS = [
    "Experienced keeper with quick reflexes and strong communication skills.",
    "Former academy goalkeeper, now playing recreational leagues.",
    "Reliable shot-stopper available for weekend and weekday games.",
    "10+ years in goal. Comfortable on turf, grass, or indoor surfaces.",
    "University-level goalkeeper looking for extra matches.",
    "Versatile keeper, great with distribution and organizing the back line.",
    "Calm under pressure. Played competitive soccer for 8 years.",
    "Available for last-minute bookings. Always match-ready.",
    "Passionate about the game. Consistent and dependable between the posts.",
    "Provincial-level experience. Strong with high balls and one-on-ones.",
    "Weekend warrior goalkeeper. Love the beautiful game!",
    "Played keeper since I was 12. Quick feet and safe hands.",
    "Former indoor league MVP. Excellent reflexes in tight spaces.",
    "Friendly and competitive. Great at organizing the defense.",
    "Tall keeper with a long reach. Command the box effectively.",
    "Technical goalkeeper who loves playing out from the back.",
    "Athletic shot-stopper with years of competitive experience.",
    "Solid keeper with a positive attitude. Always on time.",
    "Fast and agile. Best on turf and indoor surfaces.",
    "Experienced in 5-a-side, 7-a-side, and 11-a-side formats.",
    "Goalkeeper coach by day, match keeper by night. Let's play!",
    "Strong penalty saver. Calm and focused under pressure.",
    "New to the city and looking to play as much as possible.",
    "Retired semi-pro goalkeeper. Still got it!",
    "Fitness enthusiast and reliable goalkeeper. Available most evenings.",
]

def escape_sql(s):
    return s.replace("'", "''")

def gen_password_hash():
    return "$2a$11$BOT" + hashlib.sha256(uuid.uuid4().bytes).hexdigest()[:50]

sql_lines = []
sql_lines.append("-- Bot goalkeeper seed data")
sql_lines.append("-- Generated for GoalieFinder Canada")
sql_lines.append("-- Bot accounts are identified by email domain @bot.goaliefinder.local")
sql_lines.append("-- and password_hash starting with '$2a$11$BOT'")
sql_lines.append("")
sql_lines.append("BEGIN;")
sql_lines.append("")

used_names = set()
total = 0

for city in CITIES:
    sql_lines.append(f"-- === {city['name']} ({city['count']} goalkeepers) ===")
    
    for i in range(city["count"]):
        while True:
            first = random.choice(FIRST_NAMES)
            last = random.choice(LAST_NAMES)
            full = f"{first} {last}"
            if full not in used_names:
                used_names.add(full)
                break
        
        user_id = str(uuid.uuid4())
        gk_id = str(uuid.uuid4())
        city_slug = city["name"].lower().replace(" ", "").replace("-", "")
        email = f"{first.lower()}.{last.lower()}@bot.goaliefinder.local"
        phone = f"+1{random.randint(200,999)}{random.randint(1000000,9999999)}"
        pw_hash = gen_password_hash()
        
        price = random.choice([15, 20, 20, 25, 25, 25, 30, 30, 35, 40, 45, 50])
        experience = random.randint(1, 15)
        bio = escape_sql(random.choice(BIOS))
        
        # Scatter positions around city center (within ~8km radius)
        lat_offset = random.uniform(-0.06, 0.06)
        lng_offset = random.uniform(-0.08, 0.08)
        lat = round(city["lat"] + lat_offset, 4)
        lng = round(city["lng"] + lng_offset, 4)
        
        travel = random.choice([10, 15, 15, 20, 20, 25, 30])
        rating = round(random.uniform(3.5, 5.0), 1)
        matches_played = random.randint(0, 85)
        reviews = max(0, matches_played - random.randint(0, 20))
        
        sql_lines.append(f"""
INSERT INTO users (id, email, password_hash, first_name, last_name, phone_number, role, is_verified, is_active, stripe_connect_account_id, created_at, updated_at)
VALUES ('{user_id}', '{email}', '{pw_hash}', '{escape_sql(first)}', '{escape_sql(last)}', '{phone}', 1, true, true, 'bot_placeholder', NOW() - interval '{random.randint(1,180)} days', NOW());

INSERT INTO goalkeeper_profiles (id, user_id, price_per_match, experience_years, bio, latitude, longitude, max_travel_distance_km, rating, total_matches, total_reviews, is_available, created_at, updated_at)
VALUES ('{gk_id}', '{user_id}', {price}.00, {experience}, '{bio}', {lat}, {lng}, {travel}, {rating}, {matches_played}, {reviews}, true, NOW() - interval '{random.randint(1,180)} days', NOW());""")
        
        total += 1

sql_lines.append("")
sql_lines.append("COMMIT;")
sql_lines.append(f"-- Total bot goalkeepers: {total}")

print("\n".join(sql_lines))
