import 'dart:convert';

import 'package:dio/dio.dart';

// void main() {
//   Dio()
//       .get(
//           "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts")
//       .then((response) {
//     print(response);
//   });
// }

/// CONTOH SERIALISASI JSON
// void main() {
//   var dataMap = {
//     "name": "John Thor",
//     "phone": 6285712334123,
//   };
//   var dataJSON = jsonEncode(dataMap);
//   print(dataJSON);
// }

/// CONTOH DESERIALISASI JSON
void main() {
  var dataJSON = '{"name": "John Thor", "phone":6285712334123}';
  var dataMap = jsonDecode(dataJSON);
  print(dataMap);
}
