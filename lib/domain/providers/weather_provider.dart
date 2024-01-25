import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/data/data_source/local/cache_helper.dart';
import 'package:weatherapp/domain/models/cities/cities_model.dart';
import 'package:weatherapp/domain/repository/repository.dart';
import 'package:weatherapp/presentation/screens/home/home_screen.dart';

import '../../data/data_source/remote/errors.dart';
import '../../theme/theme.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import '../../utils/utils.dart';
import '../models/weather/weather_data_model.dart';

class WeatherProvider extends ChangeNotifier {
  final Repository repository;
  final CacheHelper cacheHelper;

  WeatherProvider(this.repository, this.cacheHelper);

  WeatherDataModel? weatherDataModel;
  Hours? hours = Hours();
  int currentIndex = 0;
  bool animator = false;
  int currentDay = 0;
  Days? day;
  Position? myLocationPosition;
  String? location;
  CitiesModel? citiesModel;
  bool loadingWeather = false;
  bool citiesLoading = false;
  ThemeData _themeDataStyle = ThemeDataStyle.light;

  ThemeData get themeDataStyle => _themeDataStyle;

  set themeDataStyle(ThemeData themeData) {
    _themeDataStyle = themeData;

    notifyListeners();
  }

  void changeTheme() {
    if (_themeDataStyle == ThemeDataStyle.light) {
      themeDataStyle = ThemeDataStyle.dark;
    } else {
      themeDataStyle = ThemeDataStyle.light;
    }
  }

  Future getCities() async {
    citiesLoading = true;
    //var cities = await cacheHelper.get("Cities") as String?;
    //if (cities != null) {
    var cities = await Constants.getCitiesFile();
    citiesModel = await Isolate.run<CitiesModel>(() {
      final data = CitiesModel.fromJson(jsonDecode(cities));
      // citiesLoading = false;
      //notifyListeners();
      return data;
    });
    //cacheHelper.put("Cities", cities);
    // } else {
    //   citiesModel = await Isolate.run<CitiesModel>(() {
    //     final data = CitiesModel.fromJson(jsonDecode(cities!));
    //     //citiesLoading = false;
    //    // notifyListeners();
    //     return data;
    //   });
    // }
    citiesLoading = false;
    notifyListeners();
  }

  Future getWeatherData(BuildContext context, bool fromSearch) async {
    loadingWeather = true;
    notifyListeners();
    final data =
        await repository.getWeather(city: location!, appId: Constants.apiKey);
    switch (data) {
      case Success<Map<String, dynamic>?, Exception>():
        if (data.value != null) {
          weatherDataModel = WeatherDataModel.fromJson(data.value!);
          day = weatherDataModel!.days![0];
          for (int i = 0; i < weatherDataModel!.days![0].hours!.length; i++) {
            if (Utils.checkTime(
                weatherDataModel!.days![0].hours![i].datetime)) {
              hours = weatherDataModel!.days![0].hours![i];
              currentIndex = i;
              break;
            }
          }
          if (!fromSearch) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          }
        }

        if (kDebugMode) {
          print(data.value);
        }
        loadingWeather = false;
        break;
      case Failure<Map<String, dynamic>?, Exception>():
        if (data.value != null) {
          weatherDataModel = WeatherDataModel.fromJson(data.value!);
          day = weatherDataModel!.days![0];
          for (int i = 0; i < weatherDataModel!.days![0].hours!.length; i++) {
            if (Utils.checkTime(
                weatherDataModel!.days![0].hours![i].datetime)) {
              hours = weatherDataModel!.days![0].hours![i];
              currentIndex = i;
              break;
            }
          }
          if (!fromSearch) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          }
        }
        if (kDebugMode) {
          print("something went wrong: ${data.exception}");
          print("data: ${data.value}");
        }
        loadingWeather = false;
        break;
    }
    notifyListeners();
  }

  setHour(int index) {
    Timer(
      const Duration(milliseconds: 100),
      () => animator = true,
    );
    currentIndex = index;
    hours = weatherDataModel!.days![0].hours![index];
    Timer(
      const Duration(milliseconds: 100),
      () => animator = false,
    );
  }

  int getCurrentIndex() => currentIndex;

  bool compareIndex(int index) => index == currentIndex;

  String getHour(int index) => Utils.formateTimeWithout(
      weatherDataModel!.days![0].hours![index].datetime);

  String getImage(int index) => Utils.imageMap[
              weatherDataModel!.days![0].hours![index].conditions.toString()] ==
          null
      ? ImageAssets.nightStarRain
      : Utils.imageMap[
          weatherDataModel!.days![0].hours![index].conditions.toString()]!;

  String getAddress() =>
      '${weatherDataModel!.address.toString()},\n${weatherDataModel!.timezone.toString()}';

  String getCondition() => hours!.conditions.toString();

  String getCurrentTemp() => hours!.temp.toInt().toString();

  String getFeelLike() => hours!.feelslike.toString();

  String getCloudOver() => hours!.cloudcover.toInt().toString();

  String getWindSpeed() => hours!.windspeed.toInt().toString();

  String getHumidity() => hours!.humidity.toInt().toString();

  setDay(int index) {
    day = weatherDataModel!.days![index];
    currentDay = index;
    notifyListeners();
  }

  String getDayImage(int index) {
    return Utils.imageMap[weatherDataModel!.days![index].conditions] == null
        ? ImageAssets.nightStarRain
        : Utils.imageMap[weatherDataModel!.days![index].conditions]!;
  }

  String getMonth(int index) {
    return Utils.extractDate(weatherDataModel!.days![index].datetime);
  }

  String getMonthDay(int index) {
    return Utils.extractDay(weatherDataModel!.days![index].datetime);
  }

  String getDate(int index) {
    return Utils.formateDate(
        DateTime.parse(weatherDataModel!.days![index].datetime));
  }

  String getMinTemp(int index) {
    return '${weatherDataModel!.days![index].tempmin.toInt()}\u00B0';
  }

  String getMaxTemp(int index) {
    return '${weatherDataModel!.days![index].tempmax.toInt()}\u00B0';
  }

  void getSavedLocation(context) async {
    location = await cacheHelper.get('location') as String?;
    if (location == null) {
      getLocation(context);
    } else {
      if (kDebugMode) {
        print(location);
      }
      getWeatherData(context, false);
    }
  }

  Future<Position> getLocation(context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            Exception('Location permissions are permanently denied.'));
      }
    }
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      if (status == ServiceStatus.enabled) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.deniedForever) {
            // Permissions are denied forever, handle appropriately.
            return Future.error(
                Exception('Location permissions are permanently denied.'));
          }

          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            return Future.error(Exception('Location permissions are denied.'));
          }
        }

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        myLocationPosition = await Geolocator.getCurrentPosition();
      }
      //print('Location: $status');
    });
    myLocationPosition = await Geolocator.getCurrentPosition();
    List<Placemark> address = await placemarkFromCoordinates(
      myLocationPosition!.latitude,
      myLocationPosition!.longitude,
    );
    // print(address[0]);
    location = "${address[0].administrativeArea},${address[0].isoCountryCode}";
    cacheHelper.put("location", location);
    if (kDebugMode) {
      print(location);
    }
    getWeatherData(context, false);
    notifyListeners();
    return myLocationPosition!;
  }
}
