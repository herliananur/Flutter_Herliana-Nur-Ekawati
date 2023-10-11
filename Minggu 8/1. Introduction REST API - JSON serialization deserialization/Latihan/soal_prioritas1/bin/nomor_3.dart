import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/posts/1';

  Map<String, dynamic> requestBody = {
    'id': 1,
    'title': 'foo',
    'body': 'bar',
    'userid': 1,
  };

  try {
    final response = await dio.put(url, data: requestBody);

    if (response.statusCode == 200) {
      print('PUT request berhasil!');
      print('Response:');
      print(response.data);
    } else {
      print('Gagal melakukan PUT request. Status code:${response.statusCode}');
    }
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
