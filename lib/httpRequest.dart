import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      {queryParameters, Options? options, CancelToken? cancelToken}) async {
    // todo flutter web 有跨域问题
    // options?.headers["Access-Control-Allow-Origin"] = "*";
    // options?.headers["Access-Control-Allow-Headers"] =
    //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token";
    // options?.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS";
    return await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }
}

HttpRequest httpRequest = HttpRequest();
