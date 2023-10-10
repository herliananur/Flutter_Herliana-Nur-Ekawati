import 'package:flutter/material.dart';
import 'package:tugas_bloc/screen/contact_screen.dart';
import 'package:tugas_bloc/screen/detail_image_screen.dart';
import 'package:tugas_bloc/screen/gallery_screen.dart';

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
        '/gallery': (context) => GalleryScreen(),
        '/detail': (context) => DetailPageScreen(
              selectedImageIndex:
                  ModalRoute.of(context)!.settings.arguments as int,
              imageUrls: [],
            ),
      },
    );
  }
}
