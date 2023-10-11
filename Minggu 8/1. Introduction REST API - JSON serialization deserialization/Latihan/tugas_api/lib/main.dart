import 'package:flutter/material.dart';
import 'package:tugas_api/screen/screen_dua.dart';
import 'package:tugas_api/screen/screen_satu.dart';
import 'package:tugas_api/screen/screen_tiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ScreenSatu(),
      // initialRoute: '/',
      // routes: {
      //   '/':(context)=>const ScreenSatu(),
      //   '/nomor2':(context)=>ScreenDua(),
      //   '/nomor3':(context)=>ScreenTiga()
      // },
    );
  }
}
