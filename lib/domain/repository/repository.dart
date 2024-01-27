import '../../utils/constants.dart';

abstract class Repository {
  Future<ResponseData> getWeather(
      {required String appId,required String unit,required String city});
}
