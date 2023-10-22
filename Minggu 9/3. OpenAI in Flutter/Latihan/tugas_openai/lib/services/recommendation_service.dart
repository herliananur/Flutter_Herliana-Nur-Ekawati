import 'package:dio/dio.dart';

class RecommendationService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> getRecommendations({
    required String harga,
    required String kamera,
    required String storage,
  }) async {
    try {
      _dio.options = BaseOptions(
        baseUrl: 'https://api.openai.com/v1/',
        headers: {
          'Authorization':
              'Bearer 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'
        },
      );
      String promptData =
          "Kamu adalah seorang smartphone expert. Berikan saya rekomendasi smartphone dengan kisaran harga $harga rupiah, kamera $kamera MP, dan kapasitas penyimpanan internal $storage GB.";

      final response = await _dio.post('completions', data: {
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 800,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('Failed to make API request: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
