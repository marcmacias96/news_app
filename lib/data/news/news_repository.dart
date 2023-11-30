import 'package:injectable/injectable.dart';
import 'package:new_app/data/core/api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:new_app/data/core/models/core_failure/core_failure.dart';
import 'package:new_app/data/news/models/news.dart';

@LazySingleton()
class NewsRepository {
  final ApiClient _apiClient;

  NewsRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<Either<CoreFailure, List<News>>> getNews() async {
    try {
      final response = await _apiClient.getNews({
        'country': 'us',
      });
      return right(response.articles);
    } catch (e) {
      return left(const CoreFailure.unexpected());
    }
  }
}
