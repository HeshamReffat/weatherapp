import 'package:dio/dio.dart';

abstract class Repository {
  Future<Response?> getWeather(
      {required String lon,
        required String lat,
        required String appId});
}
