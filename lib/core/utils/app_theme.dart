import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    );
  }
}
