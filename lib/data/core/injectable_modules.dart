import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:new_app/data/core/api_client/api_client.dart';
import 'package:new_app/data/core/endpoinds.dart';
import 'package:new_app/injection.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get httpClient {
    final dio = Dio();
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': dotenv.env['X-Api-Key']!,
    };
    dio.options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      headers: headers,
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
    return dio;
  }



  @lazySingleton
  ApiClient get client =>
      ApiClient(getIt<Dio>());
}