# Tienda Online API

## Descripción

Este proyecto tiene como objetivo proporcionar una API para la gestión de datos en una tienda en línea. Permite la gestión de carritos de compra, productos y usuarios mediante diferentes controladores y servicios. Es una herramienta útil para aprender y practicar el desarrollo de aplicaciones en Dart, así como para comprender la estructura y organización de un proyecto de software.

---

## Modelo de Datos

### **`users.dart`**
Define el modelo de datos para los usuarios. Contiene las siguientes clases:

- **User**: Representa un usuario con las propiedades: 
  - `id`, `email`, `username`, `password`, `name`, `phone`, `address`.
  
- **Address**: Representa la dirección del usuario, con las propiedades:
  - `geolocation`, `city`, `street`, `number`, `zipcode`.
  
- **Geolocation**: Representa la geolocalización con las propiedades:
  - `lat`, `long`.

- **Name**: Representa el nombre del usuario con las propiedades:
  - `firstname`, `lastname`.

---

### **`products.dart`**
Define el modelo de datos para los productos. Contiene las siguientes clases:

- **Product**: Representa un producto con las propiedades:
  - `id`, `title`, `price`, `description`, `category`, `image`, `rating`.
  
- **Rating**: Representa la calificación de un producto con las propiedades:
  - `rate`, `count`.

- **EnumValues**: Clase auxiliar para manejar la conversión de valores de enumeración.

---

### **`carts.dart`**
Define el modelo de datos para los carritos de compra. Contiene las siguientes clases:

- **Cart**: Representa un carrito de compra con las propiedades:
  - `id`, `userId`, `date`, `products`.
  
- **Product**: Representa un producto dentro del carrito con las propiedades:
  - `productId`, `quantity`.

---

## Solicitudes a la API

Las solicitudes HTTP se realizan utilizando el paquete `http` de Dart. La URL base de la API es `'https://fakestoreapi.com'`, y las solicitudes se envían a rutas como `/carts` o `/carts/{id}`.

### Flujo de solicitudes:
1. **Solicitud Exitosa (Código 200)**:
   Si el `statusCode` es 200, los datos de la respuesta se procesan y se convierten a objetos Dart utilizando el modelo correspondiente (`Carts.fromJson()`).

2. **Solicitud Fallida (Otro Código de Estado)**:
   Si el `statusCode` no es 200, se devuelve un mensaje de error que describe la falla.

---

## Control de Errores con `Either`

La clase `Either` de la librería `dartz` se usa para manejar resultados exitosos o fallidos de manera funcional. Tiene dos tipos:

- **Right**: Representa un resultado exitoso.
- **Left**: Representa un error o fallo.

En este proyecto, se usa `Right` para devolver los datos de los carritos (`Carts`) y `Left` para devolver un mensaje de error en caso de fallo.

### Métodos Implementados:
1. **`fetchCarts`**: Solicita una lista de carritos.
   - **Éxito**: Devuelve un `Right` con la lista de carritos.
   - **Error**: Devuelve un `Left` con el mensaje de error.

2. **`fetchCartById`**: Solicita un carrito específico por su ID.
   - **Éxito**: Devuelve un `Right` con el carrito.
   - **Error**: Devuelve un `Left` con el mensaje de error.

3. **`createCart`**: Crea un nuevo carrito.
   - **Éxito**: Devuelve un `Right` con el carrito creado.
   - **Error**: Devuelve un `Left` con el mensaje de error.

4. **`deleteCart`**: Elimina un carrito.
   - **Éxito**: Devuelve un `Right` con el carrito eliminado.
   - **Error**: Devuelve un `Left` con el mensaje de error.

5. **`updateCart`**: Actualiza un carrito.
   - **Éxito**: Devuelve un `Right` con el carrito actualizado.
   - **Error**: Devuelve un `Left` con el mensaje de error.

---

## Manejo de Excepciones

Cada uno de los métodos utiliza un bloque `try-catch` para capturar excepciones que puedan ocurrir durante las solicitudes (por ejemplo, problemas de conexión). Si ocurre una excepción, se devuelve un `Left` con el mensaje de error correspondiente.

---

## Resumen del Flujo de Solicitudes y Errores

1. **Solicitud HTTP**: Se envía la solicitud a la API utilizando métodos como `http.get()`, `http.post()`, , `http.update()`, etc.
2. **Procesamiento de la Respuesta**: Si la respuesta es exitosa (código 200), se decodifica y se convierte a objetos Dart. Si la respuesta no es exitosa, se maneja el error y se devuelve un mensaje descriptivo.
3. **Control de Errores con `Either`**: Se utiliza `Either<String, T>` para manejar los resultados de manera funcional. Si la solicitud es exitosa, se retorna un `Right` con los datos. Si hay un error, se retorna un `Left` con el mensaje de error.

Este enfoque asegura que se manejen tanto los casos de éxito como de error de manera clara y eficiente, sin depender de excepciones tradicionales.

---

¡Gracias por revisar este proyecto! Si tienes alguna duda o sugerencia, no dudes en contactarme.
