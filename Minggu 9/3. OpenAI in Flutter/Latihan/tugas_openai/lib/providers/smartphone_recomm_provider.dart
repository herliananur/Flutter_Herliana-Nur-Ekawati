import 'package:flutter/material.dart';
import 'package:tugas_openai/services/recommendation_service.dart';

class SmartphoneRecommProvider extends ChangeNotifier {
  final RecommendationService _service = RecommendationService();
  Map<String, dynamic>? recommendation;

  Future<void> getRecommendations({
    required String harga,
    required String kamera,
    required String storage,
  }) async {
    recommendation = await _service.getRecommendations(
      harga: harga,
      kamera: kamera,
      storage: storage,
    );
    notifyListeners();
  }
}
