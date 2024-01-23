import '../../utils/constants.dart';

abstract class Repository {
  Future<ResponseData> getWeather(
      {required String lon,
        required String lat,
        required String appId});
}
