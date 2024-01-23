import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/data_source/remote/errors.dart';

class Constants{
  static String apiKey = "090d79944198bf629b1da9c10bf8ce8d";

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