import 'package:flutter/material.dart';
import 'package:project/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Competence KM Flutter 1',
      routes:  {'/': (context) => const WelcomePage()},
    );
  }
}
