class AuthDemo {
  static final Map<String, String> _users = {
    'demo@tastehub.app': '123456',
  };

  static bool register({required String email, required String password}) {
    if (_users.containsKey(email)) return false;
    _users[email] = password;
    return true;
  }

  static bool login({required String email, required String password}) {
    return _users[email] == password;
  }
}
