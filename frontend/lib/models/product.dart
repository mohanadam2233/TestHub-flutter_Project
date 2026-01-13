class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;

  /// For UI only (optional, may be empty if backend doesn't provide a readable name)
  final String subtitle;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.subtitle,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> j) {
    final rawCategory = j['category'];
    String categoryLabel = '';
    if (rawCategory is Map) {
      categoryLabel = (rawCategory['name'] ?? rawCategory['title'] ?? '').toString();
    } else if (rawCategory != null) {
      categoryLabel = rawCategory.toString();
    }

    return Product(
      id: (j['_id'] ?? j['id'] ?? '').toString(),
      name: (j['name'] ?? '').toString(),
      description: (j['description'] ?? '').toString(),
      price: (j['price'] is num) ? (j['price'] as num).toDouble() : double.tryParse('${j['price']}') ?? 0,
      rating: (j['rating'] is num) ? (j['rating'] as num).toDouble() : double.tryParse('${j['rating']}') ?? 0,
      imageUrl: (j['imageUrl'] ?? j['image'] ?? '').toString(),
      subtitle: (j['subtitle'] ?? '').toString(),
      category: categoryLabel,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'rating': rating,
        'imageUrl': imageUrl,
        'subtitle': subtitle,
        'category': category,
      };
}
