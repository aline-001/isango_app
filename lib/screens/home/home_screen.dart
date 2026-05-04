import 'package:flutter/material.dart';
import 'package:isango_app/screens/shared/placeholder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IsangoPlaceholderScreen(
        title: "Isango Home",
        message: "This will be implemented in our next recording",
        currentIndex: 0,
        showBottomNavigation: true
    );
  }
}
