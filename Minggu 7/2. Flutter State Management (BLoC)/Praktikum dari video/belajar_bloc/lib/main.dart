import 'package:belajar_bloc/bloc/counter_bloc.dart';
import 'package:belajar_bloc/bloc/counter_event.dart';
import 'package:belajar_bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoc'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${state.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment());
                  },
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement());
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
