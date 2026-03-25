export enum UserRole {
  TeamCaptain = 'TeamCaptain',
  Goalkeeper = 'Goalkeeper',
  Admin = 'Admin',
}

export enum MatchStatus {
  Open = 'Open',
  Accepted = 'Accepted',
  InProgress = 'InProgress',
  Completed = 'Completed',
  Cancelled = 'Cancelled',
  Disputed = 'Disputed',
}

export interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  phoneNumber: string;
  profilePhotoUrl?: string;
  role: UserRole;
  isVerified: boolean;
}

export interface AuthResponse {
  accessToken: string;
  refreshToken: string;
  user: User;
}

export interface GoalkeeperProfile {
  id: string;
  userId: string;
  fullName: string;
  profilePhotoUrl?: string;
  pricePerMatch: number;
  experienceYears: number;
  bio?: string;
  latitude: number;
  longitude: number;
  maxTravelDistanceKm: number;
  rating: number;
  totalMatches: number;
  totalReviews: number;
  isAvailable: boolean;
  distanceKm?: number;
}

export interface Match {
  id: string;
  teamProfileId: string;
  teamName: string;
  teamRating: number;
  fieldName: string;
  fieldAddress: string;
  fieldLatitude: number;
  fieldLongitude: number;
  matchDateTime: string;
  durationMinutes: number;
  paymentAmount: number;
  platformFee: number;
  totalAmount: number;
  notes?: string;
  status: MatchStatus;
  acceptedGoalkeeperId?: string;
  acceptedGoalkeeperName?: string;
  distanceKm?: number;
  createdAt: string;
}

export interface Review {
  id: string;
  matchId: string;
  reviewerName: string;
  reviewerPhotoUrl?: string;
  rating: number;
  comment?: string;
  createdAt: string;
}

export interface CreateMatchRequest {
  fieldName: string;
  fieldAddress: string;
  fieldLatitude: number;
  fieldLongitude: number;
  matchDateTime: string;
  durationMinutes: number;
  paymentAmount: number;
  notes?: string;
}

export interface PagedResult<T> {
  items: T[];
  totalCount: number;
  page: number;
  pageSize: number;
  totalPages: number;
  hasNextPage: boolean;
  hasPreviousPage: boolean;
}

export interface RegisterRequest {
  email: string;
  password: string;
  firstName: string;
  lastName: string;
  phoneNumber: string;
  role: string;
}

export interface LoginRequest {
  email: string;
  password: string;
}
