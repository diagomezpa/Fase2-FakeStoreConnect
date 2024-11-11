import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class BaseService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Either<String, List<T>>> fetchList<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<T> items = data.map((item) => fromJson(item)).toList();
        return Right(items);
      } else {
        return Left('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load data: $e');
    }
  }

  Future<Either<String, T>> fetchItem<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T item = fromJson(data);
        return Right(item);
      } else {
        return Left('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load data: $e');
    }
  }

  Future<Either<String, T>> createItem<T>(
      String endpoint,
      Map<String, dynamic> item,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T newItem = fromJson(data);
        return Right(newItem);
      } else {
        return Left('Failed to create item: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to create item: $e');
    }
  }

  Future<Either<String, T>> deleteItem<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T item = fromJson(data);
        return Right(item);
      } else {
        return Left('Failed to delete item: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to delete item: $e');
    }
  }

  Future<Either<String, T>> updateItem<T>(
      String endpoint,
      Map<String, dynamic> item,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T updatedItem = fromJson(data);
        return Right(updatedItem);
      } else {
        return Left('Failed to update item: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to update item: $e');
    }
  }
}
