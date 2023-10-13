import 'package:flutter/material.dart';
import 'package:project/screen/about_us_screen.dart';
import 'package:project/screen/login_screen.dart';
import 'package:project/screen/contact_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Competence KM Flutter 2',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ContactUsScreen(),
        '/about-us': (context) => const AboutUsScreen(),
        '/login': (context) => const LoginScreen()
      },
    );
  }
}
