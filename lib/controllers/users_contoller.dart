import 'dart:io';
import '../services/user_services.dart';
import '../models/users.dart';

Future<void> processUpdateUser(int id) async {
  final userServices = UserServices();

  Map<String, dynamic> user = await getUserDataFromConsole();

  userServices.updateUser(id, user).then((user) {
    user.fold(
      (error) => print('Error: $error'),
      (user) {
        String jsonString = userToJson(user);
        print(jsonString);
      },
    );
  });
}

Future<void> processDeleteUser(int id) async {
  final userServices = UserServices();

  userServices.deleteUser(id).then((user) {
    user.fold(
      (error) => print('Error: $error'),
      (user) {
        String jsonString = userToJson(user);
        print(jsonString);
      },
    );
  });
}

Future<void> processCreateUser() async {
  final userServices = UserServices();

  Map<String, dynamic> user = await getUserDataFromConsole();

  userServices.createUser(user).then((user) {
    user.fold(
      (error) => print('Error: $error'),
      (user) {
        String jsonString = userToJson(user);
        print(jsonString);
      },
    );
  });
}

Future<void> processUserById(int id) async {
  final userServices = UserServices();

  userServices.fetchUserById(id).then((user) {
    user.fold(
      (error) => print('Error: $error'),
      (user) {
        String jsonString = userToJson(user);
        print(jsonString);
      },
    );
  });
}

Future<void> processUsers() async {
  final userServices = UserServices();

  userServices.fetchUsers().then((users) {
    users.fold(
      (error) => print('Error: $error'),
      (users) {
        String jsonString = usersToJson(users);
        print(jsonString);
      },
    );
  });
}

Future<Map<String, dynamic>> getUserDataFromConsole() async {
  print('Ingrese el primer nombre del usuario:');
  String? firstname = stdin.readLineSync();

  print('Ingrese el apellido del usuario:');
  String? lastname = stdin.readLineSync();

  print('Ingrese el correo electrónico del usuario:');
  String? email = stdin.readLineSync();

  print('Ingrese el nombre de usuario:');
  String? username = stdin.readLineSync();

  print('Ingrese la contraseña:');
  String? password = stdin.readLineSync();

  print('Ingrese el número de teléfono:');
  String? phone = stdin.readLineSync();

  if (firstname != null &&
      lastname != null &&
      email != null &&
      username != null &&
      password != null &&
      phone != null) {
    return {
      "name": {"firstname": firstname, "lastname": lastname},
      "email": email,
      "username": username,
      "password": password,
      "phone": phone,
    };
  } else {
    throw Exception('Todos los campos son obligatorios.');
  }
}
