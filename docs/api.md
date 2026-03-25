# GoalieFinder Toronto — API Documentation

Base URL: `http://localhost:5000/api` (development) | `https://api.goaliefinders.com/api` (production)

## Authentication

All authenticated endpoints require a Bearer token in the `Authorization` header:

```
Authorization: Bearer <access_token>
```

---

## Endpoints

### Auth

#### POST /auth/register

Register a new user.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "securepass123",
  "firstName": "John",
  "lastName": "Smith",
  "phoneNumber": "+14165550123",
  "role": "TeamCaptain"
}
```

Role must be `TeamCaptain` or `Goalkeeper`.

**Response (201):**
```json
{
  "accessToken": "eyJhbG...",
  "refreshToken": "base64...",
  "user": {
    "id": "uuid",
    "email": "john@example.com",
    "firstName": "John",
    "lastName": "Smith",
    "phoneNumber": "+14165550123",
    "profilePhotoUrl": null,
    "role": "TeamCaptain",
    "isVerified": false
  }
}
```

#### POST /auth/login

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "securepass123"
}
```

**Response (200):** Same as register response.

**Error (401):**
```json
{
  "error": "Invalid email or password"
}
```

---

### Matches

#### POST /matches

Create a new match. **Requires auth: TeamCaptain role.**

**Request Body:**
```json
{
  "fieldName": "Lamport Stadium",
  "fieldAddress": "1155 King St W, Toronto, ON",
  "fieldLatitude": 43.6383,
  "fieldLongitude": -79.4213,
  "matchDateTime": "2024-03-20T19:00:00Z",
  "durationMinutes": 60,
  "paymentAmount": 50.00,
  "notes": "Indoor 5v5, bring dark jersey"
}
```

**Response (201):**
```json
{
  "id": "uuid",
  "teamProfileId": "uuid",
  "teamName": "John's Team",
  "teamRating": 4.5,
  "fieldName": "Lamport Stadium",
  "fieldAddress": "1155 King St W, Toronto, ON",
  "fieldLatitude": 43.6383,
  "fieldLongitude": -79.4213,
  "matchDateTime": "2024-03-20T19:00:00Z",
  "durationMinutes": 60,
  "paymentAmount": 50.00,
  "platformFee": 5.00,
  "totalAmount": 55.00,
  "notes": "Indoor 5v5, bring dark jersey",
  "status": "Open",
  "acceptedGoalkeeperId": null,
  "acceptedGoalkeeperName": null,
  "distanceKm": null,
  "createdAt": "2024-03-19T12:00:00Z"
}
```

#### GET /matches/nearby

Get matches near a location. **Public endpoint.**

**Query Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| lat | double | required | Latitude |
| lng | double | required | Longitude |
| radius | double | 15 | Search radius in km |
| page | int | 1 | Page number |
| pageSize | int | 20 | Items per page |

**Response (200):**
```json
{
  "items": [ ... ],
  "totalCount": 15,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1,
  "hasNextPage": false,
  "hasPreviousPage": false
}
```

#### POST /matches/{id}/accept

Accept a match. **Requires auth: Goalkeeper role.**

**Response (200):** Match object with status "Accepted".

---

### Goalkeepers

#### GET /goalkeepers/nearby

Get nearby available goalkeepers. **Public endpoint.**

**Query Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| lat | double | required | Latitude |
| lng | double | required | Longitude |
| radius | double | 15 | Search radius in km |
| page | int | 1 | Page number |
| pageSize | int | 20 | Items per page |

**Response (200):**
```json
{
  "items": [
    {
      "id": "uuid",
      "userId": "uuid",
      "fullName": "Marcus Silva",
      "profilePhotoUrl": null,
      "pricePerMatch": 60.00,
      "experienceYears": 8,
      "bio": "Former semi-pro goalkeeper",
      "latitude": 43.6532,
      "longitude": -79.3832,
      "maxTravelDistanceKm": 15,
      "rating": 4.8,
      "totalMatches": 124,
      "totalReviews": 98,
      "isAvailable": true,
      "distanceKm": 2.3
    }
  ],
  "totalCount": 5,
  "page": 1,
  "pageSize": 20,
  "totalPages": 1,
  "hasNextPage": false,
  "hasPreviousPage": false
}
```

---

### Reviews

#### POST /reviews

Submit a review after a match. **Requires auth.**

**Request Body:**
```json
{
  "matchId": "uuid",
  "revieweeId": "uuid",
  "rating": 5,
  "comment": "Great goalkeeper, made incredible saves!"
}
```

Rating must be between 1-5.

**Response (201):**
```json
{
  "id": "uuid",
  "matchId": "uuid",
  "reviewerName": "John Smith",
  "reviewerPhotoUrl": null,
  "rating": 5,
  "comment": "Great goalkeeper, made incredible saves!",
  "createdAt": "2024-03-20T21:00:00Z"
}
```

---

## Error Responses

All errors follow this format:

```json
{
  "error": "Description of the error"
}
```

Common HTTP status codes:
- `400` — Bad request / validation error
- `401` — Unauthorized (missing or invalid token)
- `403` — Forbidden (insufficient permissions)
- `404` — Resource not found
- `500` — Internal server error

---

## Rate Limiting

- Public endpoints: 100 requests/minute per IP
- Authenticated endpoints: 300 requests/minute per user

---

## RBAC Permissions Matrix

| Endpoint | TeamCaptain | Goalkeeper | Admin |
|----------|-------------|------------|-------|
| POST /auth/register | - | - | - |
| POST /auth/login | - | - | - |
| POST /matches | Yes | No | Yes |
| GET /matches/nearby | Yes | Yes | Yes |
| POST /matches/{id}/accept | No | Yes | Yes |
| GET /goalkeepers/nearby | Yes | Yes | Yes |
| POST /reviews | Yes | Yes | Yes |
