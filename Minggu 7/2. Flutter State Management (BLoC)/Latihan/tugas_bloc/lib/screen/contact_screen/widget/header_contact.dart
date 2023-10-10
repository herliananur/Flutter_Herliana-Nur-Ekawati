import 'package:flutter/material.dart';
import 'package:tugas_bloc/theme/theme_color.dart';
import 'package:tugas_bloc/theme/theme_text_style.dart';

class HeaderContactPage extends StatelessWidget {
  const HeaderContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(
              Icons.mobile_friendly,
              color: ThemeColor().m3SysLightSecondary,
            ),
          ),
          Text(
            'Create New Contacts',
            style: ThemeTextStyle().m3HeadlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
              style: ThemeTextStyle().m3BodyMedium,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: ThemeColor().m3SysLightOutlineVariant,
            ),
          )
        ],
      ),
    );
  }
}