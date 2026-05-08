import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/screens/shared/placeholder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Isango Home'),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Main'),
              Tab(text: 'Auth Forms'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Main Home Tab
            const IsangoPlaceholderScreen(
              title: "Isango Home",
              message: "This will be implemented in our next recording",
              currentIndex: 0,
              showBottomNavigation: false,
            ),
            // Auth Forms Test Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.page),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 480),
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.softBorder),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Test Authentication Forms', style: AppTextStyles.headline),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        'Click the buttons below to navigate to Login or Signup screens',
                        style: AppTextStyles.bodyMuted,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.login);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.logisticsNavy,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Go to Login Form',
                            style: AppTextStyles.title.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      
                      // Signup Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.signUp);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.commandBlue,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Go to Signup Form',
                            style: AppTextStyles.title.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
