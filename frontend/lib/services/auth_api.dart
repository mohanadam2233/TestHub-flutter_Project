// lib/services/auth_api.dart 
import '../core/api_config.dart';
import 'api_client.dart';
import '../state/session_store.dart';

class AuthApi {
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? username,
  }) async {
    final data = await ApiClient.post(
      ApiEndpoints.authRegister,
      body: {
        'email': email,
        'password': password,
        'name': username?.trim(),
        if (username != null && username.trim().isNotEmpty)
          'username': username.trim(),
      },
    );

    return Map<String, dynamic>.from(data as Map);
  }

  // ✅ returns session + saves it into SessionStore
  static Future<void> login({
    required String email,
    required String password,
    required SessionStore session, // pass your session instance
  }) async {
    final data = await ApiClient.post(
      ApiEndpoints.authLogin,
      body: {'email': email, 'password': password},
    );

    final map = Map<String, dynamic>.from(data as Map);

    // supports: { token, user: { _id/id, email, username/name } }
    final token = (map['token'] ?? map['accessToken'] ?? '').toString();

    final user = map['user'];
    String? userId;
    String? userEmail;
    String? username;

    if (user is Map) {
      final u = Map<String, dynamic>.from(user);
      userId = (u['_id'] ?? u['id'])?.toString();
      userEmail = (u['email'])?.toString();
      username = (u['username'] ?? u['name'] ?? u['fullName'])?.toString();
    } else {
      // fallback if backend returns { token, userId, email, username }
      userId = map['userId']?.toString();
      userEmail = map['email']?.toString();
      username = map['username']?.toString();
    }

    if (token.isEmpty) {
      throw Exception('Login failed: token not returned by server');
    }

    session.setSession(
      token: token,
      userId: userId,
      email: userEmail ?? email,
      username: username,
    );
  }
}
