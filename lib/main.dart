import 'package:flutter/material.dart';
import 'package:news_application/core/utils/app_constant.dart';
import 'package:news_application/core/utils/app_theme.dart';
import 'package:news_application/core/utils/routes/app_route.dart';
import 'package:news_application/core/utils/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,
      theme: AppTheme.mainTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoute.home,
    );
  }
}
