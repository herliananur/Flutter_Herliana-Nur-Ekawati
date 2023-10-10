import 'package:flutter/material.dart';
import 'package:tugas_bloc/theme/theme_color.dart';
import 'package:tugas_bloc/theme/theme_text_style.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColor().m3SysLightPrimary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)))),
        onPressed: onPressed,
        child: Text(
          title,
          style: ThemeTextStyle().m3LabelLarge,
        ));
  }
}
