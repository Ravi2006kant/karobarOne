class Product {
  final int id;
  final String title;
  final double price;
  final String thumbnail;
  final double discount;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.discount,
    required this.category,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      discount: (json['discount'] as num).toDouble(),
      category: json['category'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'price': price, 'thumbnail': thumbnail};
  }
}
