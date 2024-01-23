import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class CacheHelper {
  Future<File> put(String key, dynamic value);

  Future<FileInfo?> get(String key);

  Future remove(String key);

  Future emptyCache(String key);
}

class CacheImplementation extends CacheHelper {
  final DefaultCacheManager _cacheManager;

  CacheImplementation(this._cacheManager);

  @override
  Future emptyCache(String key) async {
    await _basicErrorHandling(() async {
      await _cacheManager.emptyCache();
    });
  }

  @override
  Future remove(String key) async {
    _basicErrorHandling(() async {
      return await _cacheManager.removeFile(key);
    });
  }

  @override
  Future<FileInfo?> get(String key) async {
    final FileInfo? f = await _basicErrorHandling(() async {
      return await _cacheManager.getFileFromCache(key);
    });
    return f;
  }

  @override
  Future<File> put(String key, dynamic value) async {
    final File f = await _basicErrorHandling(() async {
      return await _cacheManager.putFile(key, value);
    });
    return f;
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
