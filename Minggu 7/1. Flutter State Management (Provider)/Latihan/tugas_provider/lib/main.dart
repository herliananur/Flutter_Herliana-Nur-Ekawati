import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_provider/screens/gallery_screen.dart';
import 'package:tugas_provider/screens/contact_screen.dart';
import 'package:tugas_provider/models/contact_manager.dart' as contact_store;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<contact_store.ContactManager>(
          create: (_) => contact_store.ContactManager(),
        ),
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
