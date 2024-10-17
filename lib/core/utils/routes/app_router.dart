import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/features/home/home_cubit/home_cubit.dart';
import 'package:news_application/features/home/home_page.dart';
import 'package:news_application/core/utils/routes/app_route.dart';
import 'package:news_application/features/search/search_cubit/search_cubit.dart';
import 'package:news_application/features/search/search_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchPage(),
          ),
        );
      case AppRoute.home:
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = HomeCubit();
              cubit.getHomeCarusel();
              cubit.getHomeList();
              return cubit;
            },
            child: const HomePage(),
          ),
        );
    }
  }
}
