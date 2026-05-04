import 'package:flutter/material.dart';
import 'package:isango_app/screens/shared/placeholder_screen.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IsangoPlaceholderScreen(
        title: "Creating a new event",
        message: "This will be implemented later",
      currentIndex: 2,
      showBottomNavigation: true,
    );
  }
}
