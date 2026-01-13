import '../core/api_config.dart';
import '../models/order.dart';
import 'api_client.dart';

class OrderApi {
  static Future<Map<String, dynamic>> createOrder({required Order order, required String token}) async {
    final data = await ApiClient.post(
      ApiEndpoints.orders,
      token: token,
      body: order.toJson(),
    );
    return Map<String, dynamic>.from(data as Map);
  }

  static Future<List<dynamic>> myOrders({required String token}) async {
    final data = await ApiClient.get(ApiEndpoints.orders, token: token);
    if (data is Map && data['items'] is List) return data['items'];
    return const [];
  }
}
