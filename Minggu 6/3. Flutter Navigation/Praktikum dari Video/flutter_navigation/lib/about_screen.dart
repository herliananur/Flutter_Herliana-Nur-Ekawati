import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  // final String parameter;
  const AboutScreen({
    super.key,
    // required this.parameter,
  });

  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
      ),
      body: Column(
        children: [
          Text(parameter),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'))
        ],
      ),
    );
  }
}
