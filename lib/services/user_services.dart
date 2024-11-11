import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../models/users.dart';
import 'package:http/http.dart' as http;

class UserServices {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Either<String, List<Users>>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Users> users = data.map((item) => Users.fromJson(item)).toList();
        return Right(users);
      } else {
        return Left('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load users: $e');
    }
  }

  Future<Either<String, Users>> fetchUserById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Users user = Users.fromJson(data);
        return Right(user);
      } else {
        return Left('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to load user: $e');
    }
  }

  Future<Either<String, Users>> createUser(Map<String, dynamic> user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Users user = Users.fromJson(data);
        return Right(user);
      } else {
        return Left('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to create user: $e');
    }
  }

  Future<Either<String, Users>> deleteUser(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/users/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Users user = Users.fromJson(data);
        return Right(user);
      } else {
        return Left('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to delete user: $e');
    }
  }

  Future<Either<String, Users>> updateUser(
      int id, Map<String, dynamic> user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        Users user = Users.fromJson(data);
        return Right(user);
      } else {
        return Left('Failed to update user: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Failed to update user: $e');
    }
  }
}
