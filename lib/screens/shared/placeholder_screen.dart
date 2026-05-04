import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class IsangoPlaceholderScreen extends StatelessWidget {
  const IsangoPlaceholderScreen({
    super.key,
    required this.title,
    required this.message,
    this.currentIndex,
    this.showBottomNavigation = false,
  });

  final String title;
  final String message;
  final int? currentIndex;
  final bool showBottomNavigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      bottomNavigationBar: showBottomNavigation && currentIndex != null
          ? IsangoBottomNavigation(currentIndex: currentIndex!)
          : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(AppSpacing.page),
          child: Container(
            width: 420,
            padding: const EdgeInsetsGeometry.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.softBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.headline),
                const SizedBox(height: AppSpacing.sm),
                Text(message, style: AppTextStyles.bodyMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
