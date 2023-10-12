import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_bloc/bloc/contact_bloc.dart';
import 'package:tugas_bloc/screen/contact_screen.dart';
import 'package:tugas_bloc/screen/detail_image_screen.dart';
import 'package:tugas_bloc/screen/gallery_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [BlocProvider<ContactBloc>(create: (_) => ContactBloc())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas BLoC',
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactScreen(),
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
