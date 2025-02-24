import 'package:dio/dio.dart';
import 'package:news_application/core/utils/app_constant.dart';
import 'package:news_application/features/home/home_model/top_headlines_body.dart';
import 'package:news_application/features/home/home_model/top_headlines_response.dart';

class HomeServices {
  final dio = Dio();

  Future<TopHeadlinesResponse> getTopheadlines(
      TopHeadlinesBody queryParams) async {
    try {
      final header = {
        "Authorization": "Bearer ${AppConstant.appKey}",
      };
      final result = await dio.get(
          '${AppConstant.baseUrl}${AppConstant.topHeadlines}',
          options: Options(headers: header),
          queryParameters: queryParams.toMap());
      if (result.statusCode == 200) {
        return TopHeadlinesResponse.fromMap(result.data);
      } else {
        throw Exception('Failed to load top headlines data from the server');
      }
    } catch (e) {
      rethrow;
    }
  }
}
