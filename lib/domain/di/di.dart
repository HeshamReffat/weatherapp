import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';

import '../../data/data_source/local/cache_helper.dart';
import '../../data/data_source/remote/dio_helper.dart';

import '../../domain/repository/repository.dart';
import '../../domain/repository/repository_impl.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async {
  // File path to a file in the current directory
  Directory root = await getTemporaryDirectory();
  // use the database factory to open the database
  String dbPath = 'weather.db';
  DatabaseFactory dbFactory = databaseFactoryIo;

// We use the database factory to open the database
  Database db = await dbFactory.openDatabase(root.path + dbPath);
  di.registerSingleton<Database>(
    db,
  );

  di.registerSingleton<CacheHelper>(
    CacheImplementation(
      di<Database>(),
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
    WeatherProvider(di<Repository>(), di<CacheHelper>()),
  );
}
