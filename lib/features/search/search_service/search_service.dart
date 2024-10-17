import 'package:dio/dio.dart';
import 'package:news_application/core/utils/app_constant.dart';
import 'package:news_application/features/home/home_model/top_headlines_response.dart';
import 'package:news_application/features/search/search_cubit/search_model/everything_body.dart';

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
    } catch (e) {
      rethrow;
    }
  }
}
