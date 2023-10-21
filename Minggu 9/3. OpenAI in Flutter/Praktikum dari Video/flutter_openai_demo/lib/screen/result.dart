import 'package:flutter/material.dart';
import 'package:flutter_openai_demo/models/open_ai.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.gptResponseData});

  final GptData gptResponseData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Recommendations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              gptResponseData.choices.isNotEmpty
                  ? gptResponseData.choices[0].text
                  : 'No recommendations available',
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
