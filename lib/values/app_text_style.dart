import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle headline1 = const TextStyle(
    fontSize: 90,
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.5,
  );

  static const TextStyle questionTextStyle = TextStyle(
    fontSize: 24,
    color: AppColors.color626371,
    fontWeight: FontWeight.w700,
  );

  static TextStyle buttonStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
