import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const display = TextStyle(
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: AppColors.logisticsNavy,
  );

  static const headline = TextStyle(
      fontSize: 24,
      height: 1.33,
      fontWeight: FontWeight.w700,
      color: AppColors.logisticsNavy,
  );

  static const title = TextStyle(
      fontSize: 18,
      height: 1.33,
      fontWeight: FontWeight.w600,
      color: AppColors.nearBlackInk,
  );

  static const body = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: AppColors.nearBlackInk,
  );

  static const bodyMuted = TextStyle(
    fontSize: 14,
    height: 1.43,
    color: AppColors.mutedOperationalInk,
  );
  static const label = TextStyle(
    fontSize: 12,
    height: 1.33,
    color: AppColors.mutedOperationalInk,
  );


}