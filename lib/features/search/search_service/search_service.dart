import 'package:dio/dio.dart';
import 'package:news_application/core/utils/app_constant.dart';
import 'package:news_application/features/home/home_model/top_headlines_response.dart';
import 'package:news_application/features/search/search_model/everything_body.dart';

class SearchService {
  final dio = Dio();
  Future<List<Article>> getSearchResult(EverythingBody query) async {
    try {
      final header = {
        "Authorization": "Bearer ${AppConstant.appKey}",
      };
      final response = await dio.get(
        '${AppConstant.baseUrl}${AppConstant.everything}',
        options: Options(headers: header),
        queryParameters: query.toMap(),
      );
      if (response.statusCode == 200) {
        final result = TopHeadlinesResponse.fromMap(response.data);
        return result.articles ?? [];
      } else {
        throw Exception('Failed to load search data from the server');
      }
    } catch (e) {
      rethrow;
    }
  }
}
