import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServerException implements Exception {
  final dynamic error;

  ServerException(this.error);
}

class CacheException implements Exception {}

Future<Either<String, T>> basicExceptionHandling<T>({
  required Future<T> Function() onSuccess,
  required Future<String> Function(ServerException exception) onServerError,
  required Future<String> Function(CacheException exception) onCacheError,
  required Future<String> Function(Exception exception) onOtherError,
}) async {
  try {
    final f = await onSuccess();
    return Right(f);
  } on ServerException catch (e, s) {
    if (kDebugMode) {
      print(s);
    }
    final f = await onServerError(e);
    return Left(f);
    // return const Left('Server Error');
  } on CacheException catch (e) {
    if (kDebugMode) {
      print(e);
    }
    final f = await onCacheError(e);
    return Left(f);
    // return const Left('Cache Error');
  } on Exception catch (e, s) {
    if (kDebugMode) {
      print(s);
    }
    final f = await onOtherError(e);
    return Left(f);
    // return Left(e.toString());
  }
}
enum ApiStatus {
  success,
  error,
}

void showErrorToast({required String message, required ApiStatus type}) {
  switch (type) {
    case ApiStatus.success:
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      break;
    case ApiStatus.error:
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      break;
  }
}
