import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:weatherapp/data/data_source/local/cache_helper.dart';
import 'package:weatherapp/data/data_source/remote/dio_helper.dart';
import 'package:weatherapp/data/data_source/remote/errors.dart';
import 'package:weatherapp/domain/repository/repository_impl.dart';
import 'package:weatherapp/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test("Get Api Data", () async {
    bool fetchData = false;
    String dbPath = 'test.db';
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);

    var data = await RepoImplementation(
            dioHelper: DioImplementation(),
            cacheHelper: CacheImplementation(db))
        .getWeather(appId: Constants.apiKey, city: "Mountain View,US");
    switch (data) {
      case Success<Map<String, dynamic>?, Exception>():
        fetchData = true;
        break;
      case Failure<Map<String, dynamic>?, Exception>():
        fetchData = false;
        break;
    }
    expect(true, fetchData);
  });
}
