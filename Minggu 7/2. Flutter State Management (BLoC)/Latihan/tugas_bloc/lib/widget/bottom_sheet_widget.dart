import 'package:flutter/material.dart';
import 'package:tugas_bloc/screen/detail_image_screen.dart';

class BottomSheetWidget extends StatelessWidget {
  final String imageUrl;
  final int imageIndex;

  const BottomSheetWidget({
    Key? key,
    required this.imageUrl,
    required this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(imageUrl),
              const SizedBox(height: 16),
              Text('Gambar $imageIndex'),
              const SizedBox(height: 16),
              const Text('Apakah Anda ingin melihat lebih detail?'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPageScreen(
                              selectedImageIndex: imageIndex,
                              imageUrls: [imageUrl])));

                  Navigator.pop(context);
                },
                child: const Text('Ya'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tidak'),
              ),
            ],
          ),
        );
      },
    );
  }
}