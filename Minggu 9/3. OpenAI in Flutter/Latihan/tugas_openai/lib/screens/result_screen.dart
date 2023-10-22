import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic>? responseData;
  const ResultScreen({super.key, this.responseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Recommendations: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            if (responseData != null && responseData!['choices'] != null)
              ListView.builder(
                shrinkWrap: true,
                itemCount: responseData!['choices'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      responseData!['choices'][index]['text'] ??
                          'No Recommendation Available',
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              )
            else
              const Text('No Recommendation Available'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
