import 'dart:convert';
import 'dart:io';
import '../services/store_services.dart';

Future<void> processUpdateProduct(int id) async {
  final storeServices = StoreServices();

  Map<String, dynamic> product = await getProductDataFromConsole();

  storeServices.updateProduct(id, product).then((product) {
    product.fold(
      (error) => print('Error: $error'),
      (product) {
        String jsonString = const JsonEncoder.withIndent('').convert(product);
        print(jsonString);
      },
    );
  });
}

Future<void> processProducts() async {
  final storeServices = StoreServices();

  storeServices.fetchProducts().then((products) {
    products.fold(
      (error) => print('Error: $error'),
      (products) {
        String jsonString = const JsonEncoder.withIndent('').convert(products);
        print(jsonString);
      },
    );
  });
}

Future<void> processProductById(int id) async {
  final storeServices = StoreServices();

  storeServices.fetchProductById(id).then((product) {
    product.fold(
      (error) => print('Error: $error'),
      (product) {
        String jsonString = const JsonEncoder.withIndent('').convert(product);
        print(jsonString);
      },
    );
  });
}

Future<void> processCreateProduct() async {
  final storeServices = StoreServices();

  Map<String, dynamic> product = await getProductDataFromConsole();

  storeServices.createProduct(product).then((product) {
    product.fold(
      (error) => print('Error: $error'),
      (product) {
        String jsonString = const JsonEncoder.withIndent('').convert(product);
        print(jsonString);
      },
    );
  });
}

Future<void> processDeleteProduct(int id) async {
  final storeServices = StoreServices();

  storeServices.deleteProduct(id).then((product) {
    product.fold(
      (error) => print('Error: $error'),
      (product) {
        String jsonString = const JsonEncoder.withIndent('').convert(product);
        print(jsonString);
      },
    );
  });
}

Future<Map<String, dynamic>> getProductDataFromConsole() async {
  print('Ingrese el título del producto:');
  String? title = stdin.readLineSync();

  print('Ingrese el precio del producto:');
  String? priceInput = stdin.readLineSync();
  double? price = priceInput != null ? double.tryParse(priceInput) : null;

  print('Ingrese la descripción del producto:');
  String? description = stdin.readLineSync();

  print('Ingrese la categoría del producto:');
  String? category = stdin.readLineSync();

  if (title != null &&
      price != null &&
      description != null &&
      category != null) {
    return {
      "title": title,
      "price": price,
      "description": description,
      "category": category,
    };
  } else {
    throw Exception('Todos los campos son obligatorios.');
  }
}
