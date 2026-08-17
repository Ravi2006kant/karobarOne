import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:karobarone/core/models/product_model.dart';

class ApiService {
  static const String apiUrl = "https://dummyjson.com";
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse("$apiUrl/products"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception('failed to load the products');
    }
  }

  Future<List<dynamic>> getCateogry() async {
    final response = await http.get(Uri.parse("$apiUrl/products/categories"));
    final data = jsonDecode(response.body);

    return data;
  }

  Future<List<dynamic>> getProductByCateogry(String slug) async {
    final response = await http.get(
      Uri.parse("$apiUrl/products/category/$slug"),
    );
    final data = jsonDecode(response.body);

    return data['products'];
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('login Failed');
    }
  }

  Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/auth/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Failed');
  }

  Future<Map<String, dynamic>> deleteProduct(int id) async {
    final response = await http.delete(
      Uri.parse('https://dummyjson.com/products/$id'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Delete Failed');
  }

  Future<void> uploadImage(String path) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://httpbin.org.post'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', path));

    var response = await request.send();
    print(response.statusCode);
  }
}
