import 'package:bloc/bloc.dart';

import 'package:news_application/features/home/home_model/top_headlines_body.dart';
import 'package:news_application/features/home/home_model/top_headlines_response.dart';
import 'package:news_application/features/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServices();

  Future<void> getHomeCarusel() async {
    emit(HomeCarouselLoading());
    try {
      final body = TopHeadlinesBody(
          q: 'bitcoin',
          //country: 'us',
          //category: 'technology',
          pageSize: 6);
      final topHeadLines = await homeServices.getTopheadlines(body);
      emit(
        HomeCarouselLoaded(topHeadLines.articles ?? []),
      );
    } catch (e) {
      emit(
        HomeCarouselError(
          e.toString(),
        ),
      );
    }
  }

  Future<void> getHomeList() async {
    emit(HomeListLoading());
    try {
      final body = TopHeadlinesBody(
          //country: 'us',
          q: 'bitcoin',
          pageSize: 10);
      final topHeadLines = await homeServices.getTopheadlines(body);
      emit(
        HomeListLoaded(topHeadLines.articles ?? []),
      );
    } catch (e) {
      emit(
        HomeListError(
          e.toString(),
        ),
      );
    }
  }
}
