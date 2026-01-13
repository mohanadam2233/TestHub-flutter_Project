import '../core/api_config.dart';
import '../models/product.dart';
import 'api_client.dart';

class ProductsApi {
  /// supports response shapes:
  /// { items: [...] } OR { data: [...] } OR [...]
  static Future<List<Product>> fetchProducts() async {
    final data = await ApiClient.get(ApiEndpoints.products);

    final dynamic rawItems = (data is Map<String, dynamic>)
        ? (data['items'] ?? data['data'] ?? data['products'])
        : data;

    final List list = rawItems is List ? rawItems : const [];

    return list
        .whereType<Map>()
        .map((m) => Product.fromJson(Map<String, dynamic>.from(m)))
        .toList();
  }
}
