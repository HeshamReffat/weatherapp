import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/data_source/remote/errors.dart';

class Constants{
  static String apiKey = "FF5K5D2543QAWGVXFQHKTAW8Q";
  static Future<String> getCitiesFile() async {
    return await rootBundle.loadString('assets/city_list.json');
  }
  static void showToast({required String message, required ApiResult type}) {
    switch (type) {
      case ApiResult.success:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        break;
      case ApiResult.error:
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        break;
    }
  }
}
enum ApiResult {
  success,
  error,
}

enum ApiStatus {
  loading,
  done,
  error,
}
typedef ResponseData = Result<Map<String,dynamic>?, Exception>;