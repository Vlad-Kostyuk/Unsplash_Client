import 'package:dio/dio.dart';

abstract class BaseApi {
  Dio dio;

  BaseRestApi(String baseApiEndPoint) {
    final options = BaseOptions(
      baseUrl: baseApiEndPoint,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    this.dio = Dio(options);
    this.dio.interceptors.add(AuthInterceptor());
  }

  String errorMessageFrom(DioError e, String fallbackMessage) {
    String message;
    if (e.response != null) {
      message = e.response.data;
    } else {
      message = e.message;
    }
    return fallbackMessage + ' ' + message;
  }
}