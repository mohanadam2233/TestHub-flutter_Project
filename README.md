# TasteHub (Flutter UI + Node/Express + MongoDB)

This bundle contains:
- `backend/` Node.js (Express) API with MongoDB (products + auth + orders)
- `frontend/` Flutter UI source (the `lib/` folder + assets)

## Screenshots

![design 1](frontend/assets/images/desing1.jpeg)
![design 2](frontend/assets/images/desing2.jpeg)



## 1) Backend setup (MongoDB)

### Option A: MongoDB Atlas (recommended)
1. Create a free cluster in MongoDB Atlas.
2. Create a database user + password.
3. Copy the connection string.

### Option B: Local MongoDB
Install MongoDB Community Server and run the service.

## 2) Run backend

```bash
cd backend
cp .env.example .env
```

Edit `.env`:
- `MONGODB_URI=...`
- `JWT_SECRET=...`
- `PORT=5000`

Install + run:
```bash
npm install
npm run seed
npm run dev
```

API:
- GET  `/api/products`
- POST `/api/auth/register`
- POST `/api/auth/login`
- POST `/api/orders`  (requires `Authorization: Bearer <token>`)

## 3) Flutter setup

This `frontend/` folder contains the UI code. If your Flutter project already exists, copy:
- `frontend/lib/*` into your project's `lib/`
- `frontend/assets/*` into your project's `assets/`

Add to your `pubspec.yaml`:
- dependencies: `http`, `cached_network_image`, `google_fonts`, `font_awesome_flutter`
- assets:
  - `assets/images/`

## 4) IMPORTANT: Change API Base URL

Edit: `frontend/lib/core/api_config.dart`

```dart
static const String baseUrl = 'http://10.0.2.2:5000';
```

- Android Emulator: `10.0.2.2`
- Real phone: use your PC IP on the same Wi‑Fi (example: `http://192.168.1.10:5000`)

## 5) Why your earlier errors happened (quick)

- `Future<dynamic>` and `List<dynamic>` errors: `ProductsApi.fetchProducts()` must return `Future<List<Product>>` and convert JSON -> `Product`.
- `DemoData.products` / `DemoData.offerImg` errors: those were demo-only constants; now the UI reads from the backend.
- `Product.description` missing: your `Product` model didn’t include `description` / didn’t parse it; now it does.
- Orders endpoint error: `ApiEndpoints.orders` is now defined as `/api/orders` in `api_config.dart`.
## Screenshots

