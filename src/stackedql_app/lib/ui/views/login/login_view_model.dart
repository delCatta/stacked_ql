import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stackedql_app/ui/base/authentication_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dio/dio.dart' as dio;

import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  LoginViewModel() : super(successRoute: Routes.homeView);

  @override
  Future<dio.Response> runAuthentication() => Auth.service.login(
      username: emailValue ?? "a@a.a", password: passwordValue ?? "123456");

  void navigateToRegister() =>
      navigationService.navigateTo(Routes.registerView);
  @override
  bool validateFields() {
    // TODO: REMOVE NEXT LINE
    return true;
    // ? setErrorForObject("email","Can't be empty") to have in TextFieldVerification
    if (emailValue == null || emailValue!.isEmpty)
      setValidationMessage("Email Can't be empty.");
    else if (passwordValue == null || passwordValue!.isEmpty)
      setValidationMessage("Password Can't be empty.");
    else
      return true;
    return false;
  }
}
