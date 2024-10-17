import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/features/home/home_model/top_headlines_response.dart';
import 'package:news_application/features/search/search_model/everything_body.dart';
import 'package:news_application/features/search/search_service/search_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final searchService = SearchService();

  Future<void> getSearchResult(String query) async {
    emit(SearchLoading());
    try {
      final result = await searchService.getSearchResult(
        EverythingBody(
          q: query,
          pageSize: 10,
          searchIn: 'title',
        ),
      );
      emit(SearchLoaded(result));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
