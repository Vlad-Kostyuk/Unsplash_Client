import 'package:dio/dio.dart';

const headerAuthToken = "Authorization";

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    try {
      options.headers[headerAuthToken] = "Client-ID k3vjTbfxxFvhjRwAMmFaklOv6djgFjrqaTblS0S2BlQ";
    } catch (e) {
      print(e);
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}
