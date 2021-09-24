import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.logger.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:dio/dio.dart' as dio;

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger("AuthenticationViewModel");
  final navigationService = locator<NavigationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (!validateFields()) return;
    final result = await runBusyFuture<dio.Response>(runAuthentication());
    if (result.statusCode == 200) {
      navigationService.clearStackAndShow(Routes.startUpView);
    } else {
      try {
        log.w(result.data);
        setValidationMessage(json.decode(result.data)['error_description']);
      } catch (e) {
        log.w(result.data);
        setValidationMessage("Unhandled Error (${result.statusCode})");
      }
    }
  }

  bool validateFields();
  Future<dio.Response> runAuthentication();
}
