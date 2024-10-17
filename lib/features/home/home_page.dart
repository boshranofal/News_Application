import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/core/utils/routes/app_route.dart';

import 'package:news_application/features/home/home_cubit/home_cubit.dart';
import 'package:news_application/features/home/widget/home_carousel.dart';
import 'package:news_application/features/home/widget/home_list_news.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.home,
          ),
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'App',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.search);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top in Technology',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  buildWhen: (previous, current) =>
                      current is HomeCarouselLoaded ||
                      current is HomeCarouselLoading ||
                      current is HomeCarouselError,
                  builder: (context, state) {
                    if (state is HomeCarouselLoaded) {
                      final topHeadlines = state.articles;
                      return HomeCarousel(
                        topHeadlines: topHeadlines,
                      );
                    } else if (state is HomeCarouselLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeCarouselError) {
                      return Text(state.message);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Top News',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: homeCubit,
                  buildWhen: (previous, current) =>
                      current is HomeListLoaded ||
                      current is HomeListLoading ||
                      current is HomeListError,
                  builder: (context, state) {
                    if (state is HomeListLoaded) {
                      final topHeadlines = state.articles;
                      return HomeListNews(
                        topHeadlines: topHeadlines,
                      );
                    } else if (state is HomeListLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeListError) {
                      return Text(state.message);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
