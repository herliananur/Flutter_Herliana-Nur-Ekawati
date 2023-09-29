import 'package:flutter/material.dart';

class DetailPageScreen extends StatelessWidget {
  final int selectedImageIndex;
  final List<String> imageUrls;

  const DetailPageScreen({
    super.key,
    required this.selectedImageIndex,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Gambar'),
      ),
      body: Center(
        child: Image.network(imageUrls[selectedImageIndex]),
      ),
    );
  }
}
