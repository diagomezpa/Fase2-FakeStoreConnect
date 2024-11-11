import 'dart:io';
import 'controllers/carts_controller.dart';
import 'controllers/products.darts.dart';
import 'controllers/users_contoller.dart';

void main() {
  print('Seleccione una opción:');
  print('1: Procesar productos');
  print('2: Procesar producto por ID');
  print('3: Crear producto');
  print('4: Eliminar producto');
  print('5: Actualizar producto');
  print('6: Procesar carritos');
  print('7: Procesar carrito por ID');
  print('8: Crear carrito');
  print('9: Eliminar carrito');
  print('10: Actualizar carrito');
  print('11: Procesar usuarios');
  print('12: Procesar usuario por ID');
  print('13: Crear usuario');
  print('14: Eliminar usuario');
  print('15: Actualizar usuario');
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      processProducts();
      break;
    case '2':
      print('Ingrese el ID del producto:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processProductById(int.parse(id));
      }
      break;
    case '3':
      processCreateProduct();
      break;
    case '4':
      print('Ingrese el ID del producto a eliminar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processDeleteProduct(int.parse(id));
      }
      break;
    case '5':
      print('Ingrese el ID del producto a actualizar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processUpdateProduct(int.parse(id));
      }
      break;
    case '6':
      processCarts();
      break;
    case '7':
      print('Ingrese el ID del carrito:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processCartById(int.parse(id));
      }
      break;
    case '8':
      processCreateCart();
      break;
    case '9':
      print('Ingrese el ID del carrito a eliminar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processDeleteCart(int.parse(id));
      }
      break;
    case '10':
      print('Ingrese el ID del carrito a actualizar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processUpdateCart(int.parse(id));
      }
      break;
    case '11':
      processUsers();
      break;
    case '12':
      print('Ingrese el ID del usuario:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processUserById(int.parse(id));
      }
      break;
    case '13':
      processCreateUser();
      break;
    case '14':
      print('Ingrese el ID del usuario a eliminar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processDeleteUser(int.parse(id));
      }
      break;
    case '15':
      print('Ingrese el ID del usuario a actualizar:');
      String? id = stdin.readLineSync();
      if (id != null) {
        processUpdateUser(int.parse(id));
      }
      break;
    default:
      print('Opción no válida');
  }
}
