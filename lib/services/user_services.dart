import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../models/users.dart';
import 'package:http/http.dart' as http;
import 'base_service.dart';

class UserServices extends BaseService {
  Future<Either<String, List<Users>>> fetchUsers() async {
    return fetchList('users', (json) => Users.fromJson(json));
  }

  Future<Either<String, Users>> fetchUserById(int id) async {
    return fetchItem('users/$id', (json) => Users.fromJson(json));
  }

  Future<Either<String, Users>> createUser(Map<String, dynamic> user) async {
    return createItem('users', user, (json) => Users.fromJson(json));
  }

  Future<Either<String, Users>> deleteUser(int id) async {
    return deleteItem('users/$id', (json) => Users.fromJson(json));
  }

  Future<Either<String, Users>> updateUser(
      int id, Map<String, dynamic> user) async {
    return updateItem('users/$id', user, (json) => Users.fromJson(json));
  }
}
