import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json; charset=utf-8';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      // log(response.toString());
      return response;
    });
  }
}
