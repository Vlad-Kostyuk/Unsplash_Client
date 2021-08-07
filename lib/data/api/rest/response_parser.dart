import 'package:dio/dio.dart';

class ResponseParser<T> {
  static bool checkStatusCode(int statusCode) => statusCode ~/ 100 == 2;

  Future<List<T>> parseItems(Response response, Function jsonMap) async {
    if (checkStatusCode(response.statusCode)) {
      final responseJson = response.data;
      final List<dynamic> dataList = responseJson['data'];
      return List.from(dataList.map((m) => jsonMap(m) as T));
    } else {
      return Future.error(
        "Error while fetching.",
        StackTrace.fromString(response.statusMessage),
      );
    }
  }

  Future<T> parseItem(Response response, Function jsonMap) async {
    if (checkStatusCode(response.statusCode)) {
      final responseJson = response.data;
      return jsonMap(responseJson) as T;
    } else {
      return Future.error(
        "Error while fetching.",
        StackTrace.fromString(response.statusMessage),
      );
    }
  }
}
