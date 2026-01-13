import 'cart_item.dart';

class Order {
  final List<CartItem> items;
  final String phone;
  final String address;

  const Order({required this.items, required this.phone, required this.address});

  Map<String, dynamic> toJson() => {
        'items': items
            .map((it) => {
                  'product': it.product.id,
                  'qty': it.qty,
                })
            .toList(),
        'phone': phone,
        'address': address,
      };
}
