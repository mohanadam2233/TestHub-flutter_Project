// lib/state/session_store.dart ✅ UPDATED
import 'package:flutter/foundation.dart';

class SessionStore extends ChangeNotifier {
  String? _token;
  String? _userId;
  String? _email;
  String? _username; // ✅ add

  String? get token => _token;
  String? get userId => _userId;
  String? get email => _email;
  String? get username => _username; // ✅ add
  bool get isAuthed => _token != null;

  void setSession({
    required String token,
    String? userId,
    String? email,
    String? username, // ✅ add
  }) {
    _token = token;
    _userId = userId;
    _email = email;
    _username = username;
    notifyListeners();
  }

  void clear() {
    _token = null;
    _userId = null;
    _email = null;
    _username = null;
    notifyListeners();
  }
}
