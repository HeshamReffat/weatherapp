import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weatherapp/domain/repository/repository.dart';

import '../../data/data_source/local/cache_helper.dart';
import '../../data/data_source/remote/dio_helper.dart';
import '../../data/data_source/remote/errors.dart';
import '../../data/data_source/remote/exceptions.dart';
import '../../utils/constants.dart';
import 'end_point.dart';

class RepoImplementation extends Repository {
  final DioHelper? dioHelper;
  final CacheHelper? cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<ResponseData> getWeather(
      {required String appId, required String city}) async {
    Response? response;
    Map<String, dynamic>? data;
    try {
      response =
          await dioHelper?.getData(url: "$weatherEndPoint/$city", queries: {
        "key": appId,
      });
      if (response != null) {
        data = await cacheHelper?.put("weatherData", response.data)
            as Map<String, dynamic>?;
        return Success(data);
      } else {
        data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
        return Success(data);
      }
    } on SocketException catch (e) {
      data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
      Constants.showToast(
          message: "Please check Internet Connection", type: ApiResult.error);
      return Failure(data, e);
    } on RequestTimeOut catch (e) {
      data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
      Constants.showToast(message: "Please Try Again", type: ApiResult.error);
      return Failure(data, e);
    }on FormatException catch (e) {
      data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
      Constants.showToast(message: "Please Try Again", type: ApiResult.error);
      return Failure(data, e);
    } on DioException catch (e) {
      data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
      Constants.showToast(
          message: "Please check Internet Connection", type: ApiResult.error);
      return Failure(data, e);
    } on Exception catch (e) {
      data = await cacheHelper?.get("weatherData") as Map<String, dynamic>?;
      Constants.showToast(
          message: "Something Went Wrong", type: ApiResult.error);
      return Failure(data, e);
    }
  }
}
