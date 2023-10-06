import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_provider/provider/button_provider.dart';
import 'package:tugas_provider/provider/number_provider.dart';
import 'package:tugas_provider/provider/username_provider.dart';
import 'package:tugas_provider/screens/gallery_screen.dart';
import 'package:tugas_provider/screens/contact_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsernameProvider()),
        ChangeNotifierProvider(create: (_) => NumberProvider()),
        ChangeNotifierProvider(create: (_) => ButtonProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Provider',
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactPage(),
        '/gallery': (context) => GalleryScreen(),
      },
    );
  }
}
