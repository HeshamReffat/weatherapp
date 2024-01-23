import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/domain/repository/repository.dart';

import '../../data/data_source/remote/errors.dart';
import '../../utils/constants.dart';

class WeatherProvider extends ChangeNotifier {
  final Repository repository;

  WeatherProvider(this.repository);

  Future getWeatherData() async {
    await basicExceptionHandling(onSuccess: () async {
      Response? response = await repository.getWeather(
          lon: "-0.091998", lat: "51.5156177", appId: Constants.apiKey);
      print(response);
    }, onServerError: (ServerException exception) async {
      return exception.error.toString();
    }, onCacheError: (CacheException exception) async {
      return exception.toString();
    }, onOtherError: (Exception exception) async {
      return exception.toString();
    });
    notifyListeners();
  }
}
