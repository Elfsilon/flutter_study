import 'package:dio/dio.dart';
import 'package:studyapp6_handling_jsons/data/network/dio_exceptions.dart';
import 'package:studyapp6_handling_jsons/data/network/net_config.dart';

class DioClient {
  DioClient() : _dio = Dio(BaseOptions(
    baseUrl: Endpoints.baseUrl,
    receiveTimeout: HttpClientConfig.receiveTimeout,
    connectTimeout: HttpClientConfig.connectionTimeout,
    responseType: ResponseType.json,
  ));

  final Dio _dio;

  Future<Response> get(String endpoint, {
      Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint, 
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }
}