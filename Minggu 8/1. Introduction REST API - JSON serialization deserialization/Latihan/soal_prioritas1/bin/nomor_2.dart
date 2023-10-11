import 'dart:convert';
import 'package:http/http.dart' as http;

class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }
}

Future<void> fetchContact() async {
  final url = 'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final contact = Contact.fromJson(data);

    print('Data JSON yang diubah menjadi objek:');
    print('ID: ${contact.id}');
    print('Name: ${contact.name}');
    print('Phone: ${contact.phone}');
  } else {
    print('Gagal mengambil data JSON. Status code: ${response.statusCode}');
  }
}

void main() {
  fetchContact();
}
