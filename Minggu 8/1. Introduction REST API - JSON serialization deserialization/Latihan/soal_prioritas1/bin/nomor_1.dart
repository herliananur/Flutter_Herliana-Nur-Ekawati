import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final url = 'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  Map<String, dynamic> contactData = {
    'name': 'Herliana',
    'phone': '122211',
  };

  try {
    final response = await dio.post(
      url,
      data: contactData,
    );

    if (response.statusCode == 201) {
      print('Data berhasil dikirim.');
      print('Response:');
      print(response.data);
    } else {
      print('Gagal mengirim data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
