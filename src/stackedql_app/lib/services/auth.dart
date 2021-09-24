import 'package:stackedql_ferry/graphql/api.req.gql.dart';
import 'package:stackedql_app/app/app.logger.dart';

import 'http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stackedql_app/app/app.locator.dart';

class Auth with ChangeNotifier {
  final log = getLogger("Auth");
  static const String refreshTokenKey = "refresh_token";
  static const String clientID = "u2OAye84qt4PQXcngUTRIaLyVJYr0hVt0KSU3WHBfmY";
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  String? token;
  DateTime? createdAt;
  DateTime? expiration;

  Future<bool> get isAuth async {
    String? current_token = await getToken();
    log.d(current_token);
    return (current_token) != null;
  }

  static Future<String?> getToken() async {
    Auth auth = Auth.service;
    String? refreshToken = await auth.getRefreshToken();
    if (refreshToken == null) return null;
    if (auth.tokenExpired()) await auth.silentLogin(refreshToken);
    return auth.token;
  }

  bool tokenExpired() {
    return token == null ||
        expiration == null ||
        DateTime.now().compareTo(expiration!) > 0;
  }

  void logOut(
      {bool auto = false, String? refreshToken, bool notify = false}) async {
    Response r = await HTTP.dio.post("/oauth/revoke", data: {
      "token": token,
      "client_id": clientID,
    });
    if (r.statusCode == 200) {
      clearVariables();
      refreshToken ??= await getRefreshToken();
      if (refreshToken != null) deleteRefreshToken();
      if (notify) notifyListeners();
      log.i("Logged Out!");
    } else {
      // TODO: Display CONNECTION Message.
      log.e("Couldn't log out... ${r.data}");
    }
  }

  void clearVariables() {
    token = null;
    expiration = null;
  }

  Future<void> silentLogin(String refreshToken) async {
    Response r = await HTTP.dio.post("/oauth/token", data: {
      "refresh_token": refreshToken,
      "client_id": clientID,
      "grant_type": "refresh_token",
    });
    if (r.statusCode != 200) return;
    return handleTokenResponse(r);
  }

  Future<void> saveRefreshToken(String refreshToken) {
    log.i("Saving Refresh Token: $refreshToken");
    return storage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    String? refreshToken = await storage.read(key: refreshTokenKey);
    log.i("Getting Refresh Token: $refreshToken");
    return refreshToken;
  }

  Future<void> deleteRefreshToken() {
    log.i("Deleting Refresh Token.");
    return storage.delete(key: refreshTokenKey);
  }

  static Auth get service => locator<Auth>();

  Future<void> checkAuth() async {
    log.v("Auth Initialization.");
    String? refreshToken = await getRefreshToken();
    if (refreshToken == null) return;
    if (token == null || tokenExpired()) await silentLogin(refreshToken);
    notifyListeners();
  }

  Future<Response> login(
      {required String? username, required String? password}) async {
    Response r = await HTTP.dio.post("/oauth/token", data: {
      "email": username,
      "password": password,
      "client_id": clientID,
      "grant_type": "password",
    });
    if (r.statusCode == 200)
      log.i("Login successfull", r.data);
    else {
      log.e("Loggin In error:", r.data);
    }
    handleTokenResponse(r);
    await isAuth;
    notifyListeners();
    return r;
  }

  void handleTokenResponse(Response r) {
    try {
      Map<String, dynamic> responseData = r.data;
      token = responseData['access_token'];
      String? refreshToken = responseData['refresh_token'];
      createdAt = DateTime.fromMillisecondsSinceEpoch(
          responseData['created_at'] * 1000);
      expiration = createdAt?.add(const Duration(seconds: 7000));

      saveRefreshToken(refreshToken!);
    } catch (e) {
      return;
    }
  }

  Future<Response> register({
    required String? username,
    required String? password,
  }) async {
    final createUserReq = GCreateUserMutationReq((b) => b
      ..vars.createUserInput.attributes.email = "a@a.a"
      ..vars.createUserInput.attributes.password = "123456");
    // FerryClient.client.request(createUserReq).listen((event) {
    //   log.wtf(event.data);
    // });
    return Response(
        data: {"error_description": "Unhandled"},
        statusCode: 400,
        requestOptions: RequestOptions(path: ""));
    //   Response r = await HTTP.dio.post("/oauth/register", data: {
    //     "email": username,
    //     "fullName": fullName,
    //     "password": password,
    //     "client_id": clientID,
    //     "grant_type": "password",
    //   });
    //   if (r.statusCode == 200)
    //     log.i("Sign Up successful", r.data);
    //   else {
    //     log.e("Sign Up error:", r.data);
    //   }
    //   handleTokenResponse(r);
    //   notifyListeners();
    //   return r;
  }
}
