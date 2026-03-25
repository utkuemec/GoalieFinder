import axios from 'axios';
import type { AuthResponse, LoginRequest, RegisterRequest, Match, GoalkeeperProfile, PagedResult, CreateMatchRequest } from '@/types';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5001/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: { 'Content-Type': 'application/json' },
});

api.interceptors.request.use((config) => {
  if (typeof window !== 'undefined') {
    const token = localStorage.getItem('accessToken');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
  }
  return config;
});

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401 && typeof window !== 'undefined') {
      localStorage.removeItem('accessToken');
      localStorage.removeItem('user');
      window.location.href = '/auth/login';
    }
    return Promise.reject(error);
  }
);

export const authApi = {
  register: (data: RegisterRequest) =>
    api.post<AuthResponse>('/auth/register', data).then((res) => res.data),
  login: (data: LoginRequest) =>
    api.post<AuthResponse>('/auth/login', data).then((res) => res.data),
  google: (accessToken: string) =>
    api.post<AuthResponse & { isNewUser?: boolean; googleUser?: { email: string; firstName: string; lastName: string; profilePhotoUrl: string; emailVerified: boolean } }>('/auth/google', { accessToken }).then((res) => res.data),
  googleCompleteRegistration: (data: {
    googleAccessToken: string;
    firstName?: string;
    lastName?: string;
    phoneNumber?: string;
    pricePerMatch: number;
    experienceYears: number;
    bio?: string;
    latitude: number;
    longitude: number;
    maxTravelDistanceKm: number;
  }) =>
    api.post<AuthResponse>('/auth/google/complete-registration', data).then((res) => res.data),
};

export const matchesApi = {
  create: (data: CreateMatchRequest) =>
    api.post<Match>('/matches', data).then((res) => res.data),
  getNearby: (lat: number, lng: number, radius = 15, page = 1, pageSize = 20) =>
    api.get<PagedResult<Match>>('/matches/nearby', {
      params: { lat, lng, radius, page, pageSize },
    }).then((res) => res.data),
  accept: (matchId: string) =>
    api.post<Match>(`/matches/${matchId}/accept`).then((res) => res.data),
};

export const goalkeepersApi = {
  getAll: (page = 1, pageSize = 50) =>
    api.get<PagedResult<GoalkeeperProfile>>('/goalkeepers', {
      params: { page, pageSize },
    }).then((res) => res.data),
  getNearby: (lat: number, lng: number, radius = 15, page = 1, pageSize = 20, matchDate?: string) =>
    api.get<PagedResult<GoalkeeperProfile>>('/goalkeepers/nearby', {
      params: { lat, lng, radius, page, pageSize, matchDate },
    }).then((res) => res.data),
  getById: (id: string) =>
    api.get<GoalkeeperProfile>(`/goalkeepers/${id}`).then((res) => res.data),
  connectOnboard: (data: {
    dobDay: number; dobMonth: number; dobYear: number;
    addressLine1: string; city: string; province: string; postalCode: string;
    transitNumber: string; institutionNumber: string; accountNumber: string;
  }) => api.post<{ message: string; accountId: string }>('/goalkeepers/connect/onboard', data).then((res) => res.data),
  connectStatus: () =>
    api.get<{ connected: boolean; payoutsEnabled: boolean; chargesEnabled?: boolean; accountId?: string; detailsSubmitted?: boolean }>('/goalkeepers/connect/status').then((res) => res.data),
  updateProfile: (data: {
    pricePerMatch: number;
    experienceYears: number;
    bio?: string;
    latitude: number;
    longitude: number;
    maxTravelDistanceKm: number;
    isAvailable: boolean;
  }) => api.put('/goalkeepers/profile', data).then((res) => res.data),
};

export interface BookingRequest {
  goalkeeperProfileId: string;
  fieldName: string;
  fieldAddress: string;
  fieldLatitude: number;
  fieldLongitude: number;
  matchDateTime: string;
  durationMinutes: number;
  captainName: string;
  captainEmail: string;
  captainPhone: string;
  notes?: string;
}

export interface BookingResponse {
  bookingId: string;
  clientSecret: string;
  amount: number;
  goalkeeperName: string;
  goalkeeperPrice: number;
}

export interface BookingListItem {
  id: string;
  captainName: string;
  captainPhone: string;
  fieldName: string;
  fieldAddress: string;
  matchDateTime: string;
  durationMinutes: number;
  paymentAmount: number;
  notes: string;
  status: string;
  createdAt: string;
}

export const bookingsApi = {
  create: (data: BookingRequest) =>
    api.post<BookingResponse>('/bookings', data).then((res) => res.data),
  paymentComplete: (id: string) =>
    api.post(`/bookings/${id}/payment-complete`).then((res) => res.data),
  accept: (id: string) =>
    api.put(`/bookings/${id}/accept`).then((res) => res.data),
  decline: (id: string) =>
    api.put(`/bookings/${id}/decline`).then((res) => res.data),
  goalkeeperCancel: (id: string) =>
    api.put(`/bookings/${id}/goalkeeper-cancel`).then((res) => res.data),
  myRequests: () =>
    api.get<BookingListItem[]>('/bookings/my-requests').then((res) => res.data),
};

export const profileApi = {
  get: () => api.get('/profile').then((res) => res.data),
  updatePersonal: (data: { firstName?: string; lastName?: string; phoneNumber?: string }) =>
    api.put('/profile/personal', data).then((res) => res.data),
  changePassword: (data: { currentPassword: string; newPassword: string }) =>
    api.put('/profile/password', data).then((res) => res.data),
  updateGoalkeeper: (data: { pricePerMatch?: number; experienceYears?: number; bio?: string; latitude?: number; longitude?: number; maxTravelDistanceKm?: number; isAvailable?: boolean }) =>
    api.put('/profile/goalkeeper', data).then((res) => res.data),
  deleteAccount: (password?: string) =>
    api.delete('/profile', { data: { password } }).then((res) => res.data),
};

export const reviewsApi = {
  create: (data: { matchId: string; revieweeId: string; rating: number; comment?: string }) =>
    api.post('/reviews', data).then((res) => res.data),
};

export default api;
