import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weatherapp/domain/repository/repository.dart';

import '../../data/data_source/remote/errors.dart';
import '../../utils/constants.dart';
import '../models/weather/weather_data_model.dart';

class WeatherProvider extends ChangeNotifier {
  final Repository repository;

  WeatherProvider(this.repository);

  WeatherDataModel? weatherDataModel;

  Future getWeatherData() async {
    final data = await repository.getWeather(
        lon: "-0.091998", lat: "51.5156177", appId: Constants.apiKey);
     switch (data) {
       case Success<Map<String, dynamic>?, Exception>():
         if(data.value!=null) {
           weatherDataModel = WeatherDataModel.fromJson(data.value!);
         }
         if (kDebugMode) {
           print(data.value);
         }
         break;
       case Failure<Map<String, dynamic>?, Exception>():
         if(data.value!=null) {
           weatherDataModel = WeatherDataModel.fromJson(data.value!);
         }
         if (kDebugMode) {
           print("something went wrong: ${data.exception}");
           print("data: ${data.value}");
         }
         break;
    }
    notifyListeners();
  }

}
