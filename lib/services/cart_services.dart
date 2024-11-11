import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../models/carts.dart';
import 'package:http/http.dart' as http;
import 'base_service.dart';

class CartsServices extends BaseService {
  Future<Either<String, List<Carts>>> fetchCarts() async {
    return fetchList('carts', (json) => Carts.fromJson(json));
  }

  Future<Either<String, Carts>> fetchCartById(int id) async {
    return fetchItem('carts/$id', (json) => Carts.fromJson(json));
  }

  Future<Either<String, Carts>> createCart(Map<String, dynamic> cart) async {
    return createItem('carts', cart, (json) => Carts.fromJson(json));
  }

  Future<Either<String, Carts>> deleteCart(int id) async {
    return deleteItem('carts/$id', (json) => Carts.fromJson(json));
  }

  Future<Either<String, Carts>> updateCart(
      int id, Map<String, dynamic> cart) async {
    return updateItem('carts/$id', cart, (json) => Carts.fromJson(json));
  }
}
