import 'package:flutter/material.dart';
import 'package:task_management/models/task_manager.dart';
import 'package:task_management/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 4: add Provider package
    // TODO 6: adding TaskManager sebagai provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskManager(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management',
        home: TaskScreen(),
      ),
    );
  }
}
