import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:soal_prioritas2/model/api/dice_bear/dice_bear_view_model.dart';

class DiceBearScreen extends StatelessWidget {
  const DiceBearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Image'),
        centerTitle: true,
      ),
      body: Consumer<DiceBearViewModel>(
        builder: (context, diceBearProvider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                diceBearProvider.isLoading
                    ? const CircularProgressIndicator()
                    : diceBearProvider.imageData.isEmpty
                        ? const Icon(
                            Icons.image,
                            size: 68,
                          )
                        : SvgPicture.string(
                            diceBearProvider.imageData,
                            height: 100,
                            width: 100,
                          ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: diceBearProvider.diceBearController,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      diceBearProvider.getImageDiceBear();
                    },
                    child: const Text(
                      'Generate Image',
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
