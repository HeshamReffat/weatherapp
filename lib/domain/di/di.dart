import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';


import '../../data/data_source/local/cache_helper.dart';
import '../../data/data_source/remote/dio_helper.dart';


import '../../domain/repository/repository.dart';
import '../../domain/repository/repository_impl.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async {
  final cm = DefaultCacheManager();
    di.registerSingleton<DefaultCacheManager>(
      cm,
  );

  di.registerSingleton<CacheHelper>(
    CacheImplementation(
      di<DefaultCacheManager>(),
    ),
  );

  di.registerSingleton<DioHelper>(
    DioImplementation(),
  );


  di.registerSingleton<Repository>(
    RepoImplementation(
      dioHelper: di<DioHelper>(),
      cacheHelper: di<CacheHelper>(),
    ),
  );
  di.registerSingleton<WeatherProvider>(
    WeatherProvider(di<Repository>()),
  );
}
