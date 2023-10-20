import 'package:flutter/material.dart';
import 'package:form_input_test_count/theme/theme_color.dart';
import 'package:form_input_test_count/theme/theme_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText;
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.hintText,
      required this.onChanged,
      this.controller,
      this.textInputType,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 7.5,
        top: 7.5,
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          fillColor: ThemeColor().m3SysLightSurfaceVariant,
          labelStyle: ThemeTextStyle().m3BodySmall,
          label: Text(
            label,
          ),
          hintStyle: ThemeTextStyle().m3BodyLarge,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
