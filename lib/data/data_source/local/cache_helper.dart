import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

abstract class CacheHelper {
  Future<Object?> put(String key, dynamic value);

  Future<Object?> get(String key);

  Future<Object?> remove(String key);

  Future<Object?> emptyCache(String key);
}

class CacheImplementation extends CacheHelper {
  final Database db;

  CacheImplementation(this.db);
  var store = StoreRef.main();
  @override
  Future<Object?> emptyCache(String key) async {
    return await _basicErrorHandling(() async {
      return await store.delete(db);
    });
  }

  @override
  Future<Object?> remove(String key) async {
    return await _basicErrorHandling(() async {
      return await store.record(key).delete(db);
    });
  }

  @override
  Future<Object?> get(String key) async {
    return await _basicErrorHandling(() async {
      return await store.record(key).get(db);
    });
  }

  @override
  Future<Object?> put(String key, dynamic value) async {
    return await _basicErrorHandling(() async {
      return await store.record(key).put(db, value);
    });
  }
}

extension on CacheHelper {
  Future<T> _basicErrorHandling<T>(Future<T> Function() onSuccess) async {
    try {
      final f = await onSuccess();
      return f;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return await onSuccess();
    }
  }
}
