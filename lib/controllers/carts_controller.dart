import 'package:fase2lecturadedatosapi/services/cart_services.dart';
import '../models/carts.dart';
import 'dart:io';

Future<void> processCreateCart() async {
  final cartsServices = CartsServices();

  Map<String, dynamic> cart = await getCartDataFromConsole();

  cartsServices.createCart(cart).then((cart) {
    cart.fold(
      (error) => print('Error: $error'),
      (cart) {
        String jsonString = cartToJson(cart);
        print(jsonString);
      },
    );
  });
}

Future<void> processDeleteCart(int id) async {
  final cartsServices = CartsServices();

  cartsServices.deleteCart(id).then((cart) {
    cart.fold(
      (error) => print('Error: $error'),
      (cart) {
        String jsonString = cartToJson(cart);
        print(jsonString);
      },
    );
  });
}

Future<void> processUpdateCart(int id) async {
  final cartsServices = CartsServices();

  Map<String, dynamic> cart = await getCartDataFromConsole();

  cartsServices.updateCart(id, cart).then((cart) {
    cart.fold(
      (error) => print('Error: $error'),
      (cart) {
        String jsonString = cartToJson(cart);
        print(jsonString);
      },
    );
  });
}

Future<void> processCartById(int id) async {
  final cartsServices = CartsServices();

  cartsServices.fetchCartById(id).then((cart) {
    cart.fold(
      (error) => print('Error: $error'),
      (cart) {
        String jsonString = cartToJson(cart);
        print(jsonString);
      },
    );
  });
}

Future<void> processCarts() async {
  final cartsServices = CartsServices();

  cartsServices.fetchCarts().then((carts) {
    carts.fold(
      (error) => print('Error: $error'),
      (carts) {
        String jsonString = cartsToJson(carts);
        print(jsonString);
      },
    );
  });
}

Future<Map<String, dynamic>> getCartDataFromConsole() async {
  print('Ingrese el ID del usuario:');
  String? userIdInput = stdin.readLineSync();
  int? userId = userIdInput != null ? int.tryParse(userIdInput) : null;

  print('Ingrese la fecha (YYYY-MM-DD):');
  String? date = stdin.readLineSync();

  List<Map<String, dynamic>> products = [];
  while (true) {
    print('Ingrese el ID del producto (o presione Enter para finalizar):');
    String? productIdInput = stdin.readLineSync();
    if (productIdInput == null || productIdInput.isEmpty) {
      break;
    }
    int? productId = int.tryParse(productIdInput);

    print('Ingrese la cantidad del producto:');
    String? quantityInput = stdin.readLineSync();
    int? quantity = quantityInput != null ? int.tryParse(quantityInput) : null;

    if (productId != null && quantity != null) {
      products.add({"productId": productId, "quantity": quantity});
    } else {
      print('ID del producto y cantidad son obligatorios.');
    }
  }

  if (userId != null && date != null && products.isNotEmpty) {
    return {
      "userId": userId,
      "date": date,
      "products": products,
    };
  } else {
    throw Exception('Todos los campos son obligatorios.');
  }
}
