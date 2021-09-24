import 'package:dio/dio.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/main.dart';

class HTTP {
  late Dio client = setUpClient();

  Dio setUpClient() {
    var options = BaseOptions(
        contentType: "application/json",
        baseUrl: API,
        followRedirects: false,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        validateStatus: (status) {
          return status! <= 500;
        });
    return Dio(options);
  }

  static Dio get dio => locator<HTTP>().client;
}
