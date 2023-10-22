import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_openai/providers/smartphone_recomm_provider.dart';
import 'package:tugas_openai/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SmartphoneRecommProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas OpenAI in Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
