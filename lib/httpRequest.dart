import 'package:dio/dio.dart';

class HttpRequest {
  BaseOptions options = BaseOptions(
      baseUrl: "http:172.16.1.7:3000",
      connectTimeout: 5000,
      receiveTimeout: 3000);
  static Dio dio = Dio();
  HttpRequest() {
    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      print("发生异常=============$e");
      return e;
    }));
  }

  // GET
  Future get(String path,
      {queryParameters,
      required Options options,
      required CancelToken cancelToken}) async {
    return await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }
}

HttpRequest httpRequest = HttpRequest();
