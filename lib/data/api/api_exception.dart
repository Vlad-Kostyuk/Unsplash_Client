import 'package:dio/dio.dart';

class APIException {
  String message;

  APIException(this.message);

  factory APIException.errorMessageFrom(DioError e, String fallbackMessage) {
    String message = e.message;
    return APIException(fallbackMessage + ' ' + message);
  }
}
