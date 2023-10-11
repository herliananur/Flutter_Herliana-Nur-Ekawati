import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas2/model/api/dice_bear/dice_bear_screen.dart';
import 'package:soal_prioritas2/model/api/dice_bear/dice_bear_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DiceBearViewModel>(
          create: (context) => DiceBearViewModel(),
        )
      ],
      child: const MaterialApp(
        title: 'Soal Prioritas 2',
        home: DiceBearScreen(),
      ),
    );
  }
}
