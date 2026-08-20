import 'package:http/http.dart';

class Category {
  final String id;
  final String categoryName;
  final String categorySlug;
  final String categoryType;

  Category({
    required this.id,
    required this.categoryName,
    required this.categorySlug,
    required this.categoryType,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['categoryName'],
      categorySlug: json['categorySlug'],
      categoryType: json['categoryType'],
    );
  }
}
