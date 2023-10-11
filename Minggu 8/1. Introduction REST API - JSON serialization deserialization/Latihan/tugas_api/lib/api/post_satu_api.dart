import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio dio = Dio();

class UserModel {
  int id;
  String name;
  String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

Future postSatuAPI({
  required int id,
  required String name,
  required String phone,
}) async {
  try {
    final Response response = await dio.post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        'id': id,
        'name': name,
        'phone': phone,
      },
    );

    debugPrint(response.data.toString());

    if (response.statusCode == 201) {
      return {
        'success': true,
        'message': 'Data contact berhasil dikirim',
      };
    } else {
      return {
        'success': false,
        'message': 'Gagal mengirim data contact',
      };
    }
  } catch (e) {
    rethrow;
  }
}
