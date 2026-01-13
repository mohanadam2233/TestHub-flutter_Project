import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/products_api.dart';

class ProductsModel extends ChangeNotifier {
  List<Product> _items = [];
  bool _loading = false;
  String? _error;

  List<Product> get items => _items;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> load() async {
    if (_loading) return;
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _items = await ProductsApi.fetchProducts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
