import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weatherapp/domain/repository/repository.dart';

import '../../data/data_source/local/cache_helper.dart';
import '../../data/data_source/remote/dio_helper.dart';
import '../../data/data_source/remote/errors.dart';
import 'end_point.dart';

class RepoImplementation extends Repository {
  final DioHelper? dioHelper;
  final CacheHelper? cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<Response?> getWeather(
      {required String lon, required String lat, required String appId}) async {
    Response? response;
    await dioHelper?.getData(url: weatherEndPoint, queries: {
      'lat': lat,
      'lon': lon,
      "appid": appId,
    });
    final d =
    (await cacheHelper?.put("weatherData", response))?.readAsStringSync();
    response = jsonDecode(d!);
    return response;
  }
}
