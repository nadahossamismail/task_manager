import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 216, 203, 28);
}

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
