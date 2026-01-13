# TasteHub Backend (Node.js + Express + MongoDB)

## Requirements
- Node.js 18+
- MongoDB (local or Atlas)

## Setup
1. Copy env
```bash
cp .env.example .env
```
2. Edit `.env`
- `MONGO_URI` (local or Atlas)
- `JWT_SECRET` (any long random string)

3. Install & run
```bash
npm install
npm run dev
```

## Seed demo products (optional)
```bash
npm run seed
```

## Base URL
- Local: `http://localhost:4000`

> If you test from an Android emulator, use `http://10.0.2.2:4000`

## API Endpoints

### Auth
- `POST /api/auth/register`
  ```json
  {"name":"Mohan","email":"mohan@gmail.com","password":"123456"}
  ```
- `POST /api/auth/login`
  ```json
  {"email":"mohan@gmail.com","password":"123456"}
  ```
- `GET /api/auth/me` (Bearer token)

### Products
- `GET /api/products`
- `GET /api/products?q=burger`
- `GET /api/products?category=Food`
- `GET /api/products/:id`

### Orders (Bearer token)
- `POST /api/orders`
  ```json
  {
    "phone": "+252...",
    "address": "Mogadishu",
    "items": [
      {"productId":"<mongo_id>","qty":2}
    ]
  }
  ```
- `GET /api/orders`
- `GET /api/orders/:id`

## Flutter: what to change

1) Add `http` package in Flutter:
```yaml
dependencies:
  http: ^1.2.2
```

2) Create a base URL constant (example):
- `lib/core/api_config.dart`
```dart
class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:4000'; // Android emulator
  // static const String baseUrl = 'http://localhost:4000'; // iOS simulator
}
```

3) Replace demo login/register (`AuthDemo`) with API calls:
- Replace inside `_submit()`:
  - Register -> `POST /api/auth/register`
  - Login -> `POST /api/auth/login`
  - Save `token` (use `shared_preferences`)

4) Replace `DemoData.products` with API:
- Call `GET /api/products` in `HomeScreen` using a `FutureBuilder` or `StatefulWidget`.

5) Send order from cart:
- On checkout button -> `POST /api/orders` with Bearer token.

