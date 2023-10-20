import 'package:flutter/material.dart';
import 'package:form_input_test_count/page/contact_page/contact_page.dart';
import 'package:form_input_test_count/page/count_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactPage(),
        '/count': (context) => const CountPage(),
      },
    );
  }
}
