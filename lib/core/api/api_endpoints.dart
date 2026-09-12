import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:karobarone/core/models/address_model.dart';
import 'package:karobarone/core/models/category_mode.dart';
import 'package:karobarone/core/models/product_model.dart';

class ApiService {
  static const String apiUrl = "https://karobarone-backend.onrender.com/api/v1";

//AUTHENTICATION

Future<Map<String, dynamic>> register(
    String firstNm,
    String lastNm,
    String email,
    String mobile,
    String whatsappNo,
    String password,
  ) async {
    final body = {
      'firstName': firstNm,
      'lastName': lastNm,
      'email': email,
      'mobile': '+91$mobile',
      'whatsappMobile': '+91$whatsappNo',
      'password': password,
    };
    
    final response = await http.post(
      Uri.parse('$apiUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
   
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body));
    }
  }

Future<Map<String,dynamic>> registerVerify(String otpId,
  String code) async {
    final body = {
      'otpId':otpId,
      'code':code,
    };
  final response = await http.post(
      Uri.parse('$apiUrl/auth/register/verify'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
     if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body));
    }
}

Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('login Failed');
    }
  }

// PRODUCT

  Future<List<Product>> getProducts(int limit, int skip) async {
    final response = await http.get(
      Uri.parse("$apiUrl/products?limit=$limit&skip=$skip"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception('failed to load the products');
    }
  }

  Future<Map<String, dynamic>> getProductDetail(String slug) async {
    final response = await http.get(Uri.parse("$apiUrl/products/$slug"));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (data);
    }
    throw Exception('Category load Failed');
  }

  Future<List<Category>> getCateogry() async {
    final response = await http.get(Uri.parse("$apiUrl/categories"));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (data['data'] as List).map((e) => Category.fromJson((e))).toList();
    }
    throw Exception('Category load Failed');
  }

  Future<Map<String, dynamic>> getProductByCateogry(String slug) async {
    final response = await http.get(Uri.parse("$apiUrl/categories/$slug"));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (data);
    }
    throw Exception('Category load Failed');
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

  Future<void> addAddress(Address address, String token) async {
    final response = await http.post(
      Uri.parse('$apiUrl/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'fullName': address.fullName,
        'phone': address.phone,
        'addressLine': address.addressLine,
        'city': address.city,
        'state': address.state,
        'pincode': address.pincode,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save address');
    }
  }

  Future<List<Address>> getAddresses(String token) async {
    final response = await http.get(
      Uri.parse('$apiUrl/addresses'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['data'] as List).map((e) => Address.fromJson(e)).toList();
    }

    throw Exception('Failed to load addresses');
  }


}
