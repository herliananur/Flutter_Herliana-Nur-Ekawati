import 'package:flutter/material.dart';
import 'material_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final darkTheme = ThemeData.dark().copyWith();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}