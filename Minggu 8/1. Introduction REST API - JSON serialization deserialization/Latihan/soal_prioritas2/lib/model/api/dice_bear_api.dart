import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DiceBearApi {
  Future<String> getImageDiceBear({
    required String avatarImage,
  }) async {
    try {
      final response =
          await Dio().get('https://api.dicebear.com/7.x/pixel-art/svg?seed=$avatarImage');

      debugPrint(response.data);

      return response.data as String;
    } catch (e) {
      throw Exception(e);
    }
  }
}
