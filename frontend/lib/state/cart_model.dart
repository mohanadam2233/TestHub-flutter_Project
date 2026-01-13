import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();
  int get totalQty => _items.values.fold(0, (a, b) => a + b.qty);

  double get subtotal => _items.values.fold(0.0, (a, b) => a + b.lineTotal);
  double get delivery => items.isEmpty ? 0.0 : 7.99;
  double get tax => items.isEmpty ? 0.0 : 5.00;
  double get total => subtotal + delivery + tax;

  void add(Product p) {
    _items.update(
      p.id,
      (it) => (it..qty += 1),
      ifAbsent: () => CartItem(product: p, qty: 1),
    );
    notifyListeners();
  }

  void inc(String productId) {
    final it = _items[productId];
    if (it == null) return;
    it.qty += 1;
    notifyListeners();
  }

  void dec(String productId) {
    final it = _items[productId];
    if (it == null) return;
    it.qty -= 1;
    if (it.qty <= 0) _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
