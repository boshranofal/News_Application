import 'package:flutter/material.dart';
import 'package:news_application/features/home_page.dart';
import 'package:news_application/utils/routes/app_route.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
