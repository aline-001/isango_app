import 'package:flutter/material.dart';
import 'package:isango_app/screens/shared/placeholder_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IsangoPlaceholderScreen(
      title: "Settings",
      message: "To be implemented later",
      currentIndex: 3,
      showBottomNavigation: true
    );
  }
}
