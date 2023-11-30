import 'package:dio/dio.dart';
import 'package:new_app/data/core/endpoinds.dart';
import 'package:new_app/data/core/models/response/news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.getNews)
  Future<NewsResponse> getNews(
    @Queries() Map<String, dynamic> queries,
  );
}
