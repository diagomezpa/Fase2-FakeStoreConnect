import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../models/products.dart';

class StoreServices {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Either<String, List<Product>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Product> products =
            data.map((item) => Product.fromJson(item)).toList();
        return Right(products);
      } else {
        return Left('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load products: $e');
    }
  }

  Future<Either<String, Product>> fetchProductById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Product product = Product.fromJson(data);
        return Right(product);
      } else {
        return Left('Failed to load product: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load product: $e');
    }
  }

  Future<Either<String, Product>> createProduct(
      Map<String, dynamic> product) async {
    try {
      print(product);
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Product product = Product.fromJson(data);
        return Right(product);
      } else {
        return Left('Failed to create product: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to create product: $e');
    }
  }

  Future<Either<String, Product>> deleteProduct(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/products/$id'));

      if (response.statusCode == 200) {
        Product product = Product.fromJson(json.decode(response.body));
        return Right(product);
      } else {
        return Left('Failed to delete product: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to delete product: $e');
    }
  }

  Future<Either<String, Product>> updateProduct(
      int id, Map<String, dynamic> product) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );

      if (response.statusCode == 200) {
        Product product = Product.fromJson(json.decode(response.body));
        return Right(product);
      } else {
        return Left('Failed to update product: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to update product: $e');
    }
  }
}
