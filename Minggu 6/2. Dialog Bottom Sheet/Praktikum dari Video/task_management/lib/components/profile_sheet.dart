// TODO 21: membuat content [ada bottom sheet]
import 'package:flutter/material.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Andre')
        ],
      ),
    );
  }
}
