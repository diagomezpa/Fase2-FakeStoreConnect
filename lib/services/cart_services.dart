import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../models/carts.dart';
import 'package:http/http.dart' as http;

class CartsServices {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Either<String, List<Carts>>> fetchCarts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/carts'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Carts> carts = data.map((item) => Carts.fromJson(item)).toList();
        return Right(carts);
      } else {
        return Left('Failed to load carts: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load carts: $e');
    }
  }

  Future<Either<String, Carts>> fetchCartById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/carts/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Carts cart = Carts.fromJson(data);
        return Right(cart);
      } else {
        return Left('Failed to load cart: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load cart: $e');
    }
  }

  Future<Either<String, Carts>> createCart(Map<String, dynamic> cart) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/carts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cart),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Carts cart = Carts.fromJson(data);
        return Right(cart);
      } else {
        return Left('Failed to create cart: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to create cart: $e');
    }
  }

  Future<Either<String, Carts>> deleteCart(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/carts/$id'));

      if (response.statusCode == 200) {
        Carts cart = Carts.fromJson(json.decode(response.body));
        return Right(cart);
      } else {
        return Left('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to delete cart: $e');
    }
  }

  Future<Either<String, Carts>> updateCart(
      int id, Map<String, dynamic> cart) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/carts/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cart),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Carts cart = Carts.fromJson(data);
        return Right(cart);
      } else {
        return Left('Failed to update cart: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to update cart: $e');
    }
  }
}
