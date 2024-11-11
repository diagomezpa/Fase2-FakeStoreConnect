// To parse this JSON data, do
//
//     final carts = cartsFromJson(jsonString);

import 'dart:convert';

List<Carts> cartsFromJson(String str) =>
    List<Carts>.from(json.decode(str).map((x) => Carts.fromJson(x)));

String cartsToJson(List<Carts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String cartToJson(Carts data) => json.encode(data.toJson());

class Carts {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<Product>? products;

  Carts({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": products != null
            ? List<dynamic>.from(products!.map((x) => x.toJson()))
            : null,
      };
}

class Product {
  int productId;
  int quantity;

  Product({
    required this.productId,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
