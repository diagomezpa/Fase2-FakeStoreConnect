import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../models/products.dart';
import 'base_service.dart';

class StoreServices extends BaseService {
  Future<Either<String, List<Product>>> fetchProducts() async {
    return fetchList('products', (json) => Product.fromJson(json));
  }

  Future<Either<String, Product>> fetchProductById(int id) async {
    return fetchItem('products/$id', (json) => Product.fromJson(json));
  }

  Future<Either<String, Product>> createProduct(
      Map<String, dynamic> product) async {
    return createItem('products', product, (json) => Product.fromJson(json));
  }

  Future<Either<String, Product>> deleteProduct(int id) async {
    return deleteItem('products/$id', (json) => Product.fromJson(json));
  }

  Future<Either<String, Product>> updateProduct(
      int id, Map<String, dynamic> product) async {
    return updateItem(
        'products/$id', product, (json) => Product.fromJson(json));
  }
}
