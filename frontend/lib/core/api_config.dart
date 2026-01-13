class ApiConfig {
  /// Change this to your machine IP when testing on a real phone.
  /// - Android emulator: http://10.0.2.2:5000
  /// - Real device:     http://<YOUR_PC_IP>:5000
  static const String baseUrl = 'http://192.168.100.12:4000';
}

class ApiEndpoints {
  static const String authLogin = '/api/auth/login';
  static const String authRegister = '/api/auth/register';
  static const String products = '/api/products';
  static const String orders = '/api/orders';
}
