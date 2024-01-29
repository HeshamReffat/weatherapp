import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherapp/data/data_source/remote/errors.dart';
import 'package:weatherapp/domain/repository/repository.dart';
import 'package:weatherapp/utils/constants.dart';

import 'unit_test.mocks.dart';
class RepositoryTest extends Mock implements Repository{}
@GenerateNiceMocks(
  [MockSpec<RepositoryTest>()],
)
void main() {
  late MockRepositoryTest repoImplementation;
  setUpAll(() {
    repoImplementation = MockRepositoryTest();
    provideDummy<Result<Map<String, dynamic>?, Exception>>(const Success({}));
    provideDummy<Result<Map<String, dynamic>?, Exception>>(
        Failure({}, Exception("error")));
  });
  // Helper method for verification
  void verifyExecute(
      String city, ResponseData result, ResponseData expectedResult) {
    expect(result, expectedResult);
    verify(repoImplementation.getWeather(appId: Constants.apiKey, city: city,unit: "metric"));
    verifyNoMoreInteractions(repoImplementation);
  }

  test("Get Api Error", () async {
    //arrange
    const city = "Mountain View,US";
    final ResponseData error = Failure({}, Exception("Error"));
    when(repoImplementation.getWeather(appId: Constants.apiKey, city: "Mountain View,US",unit: "metric"))
        .thenAnswer((realInvocation) async {
      return error;
    });
    //act
    final result = await repoImplementation.getWeather(
        appId: Constants.apiKey, city: city,unit: "metric");
    //assert
    verifyExecute(city, result, error);
  });

  test("Get Api Success", () async {
    //arrange
    const city = "Mountain View,US";
    final ResponseData done = const Success({});
    when(repoImplementation.getWeather(
            appId: Constants.apiKey, city: "Mountain View,US",unit: "metric"))
        .thenAnswer((realInvocation) async {
      return done;
    });
    //act
    final result = await repoImplementation.getWeather(
        appId: Constants.apiKey, city: city,unit: "metric");
    //assert
    verifyExecute(city, result, done);
  });
}
