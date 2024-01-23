import 'dart:async';

import 'package:dio/dio.dart';

abstract class DioHelper {
  Future<Response> postData(
      {required String url,
      dynamic data,
      String token,
      Map<String, dynamic>? queries});

  Future<Response> putData(
      {required String url,
      required dynamic data,
      String token,
      Map<String, dynamic>? queries});

  Future<Response> getData(
      {String? url,
      dynamic data,
      String? appId,
      Map<String, dynamic>? queries});

  Future<Response> delete(
      {required String url, String token, Map<String, dynamic>? queries});
}

class DioImplementation extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      receiveDataWhenStatusError: true,
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode <= 300;
        }
      },
    ),
  );

  @override
  Future<Response> postData(
      {String? url,
      String? token,
      dynamic data,
      Map<String, dynamic>? queries}) async {
    dio.options.headers = {
      'Accept': 'application/json'
    };
    return await dio.post(
      url!,
      data: data,
      queryParameters: queries,
    );
  }

  @override
  Future<Response> putData(
      {String? url,
      dynamic data,
      String? token,
      Map<String, dynamic>? queries}) async {
    dio.options.headers = {
      'Accept': 'application/json'
    };

    return await dio.put(
      url!,
      data: data,
      queryParameters: queries,
    );
  }

  @override
  Future<Response> getData(
      {String? url,
      dynamic data,
      String? appId,
      Map<String, dynamic>? queries}) async {
    dio.options.headers = {'Accept': 'application/json'};
    return await dio.get(
      url!,
      queryParameters: queries,
    );
  }

  @override
  Future<Response> delete({
    String? url,
    String? token,
    Map<String, dynamic>? queries,
  }) async {
    dio.options.headers = {'Accept': 'application/json'};

    return await dio.delete(
      url!,
      queryParameters: queries,
    );
  }
}
