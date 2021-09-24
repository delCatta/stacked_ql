import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stackedql_app/ui/base/authentication_view_model.dart';
import 'package:stackedql_app/ui/views/terms/terms_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:dio/dio.dart' as dio;

import 'register_view.form.dart';

class RegisterViewModel extends AuthenticationViewModel {
  RegisterViewModel() : super(successRoute: Routes.homeView);

  @override
  Future<dio.Response> runAuthentication() async {
    return Auth.service.register(
      username: emailValue ?? "a@a.a",
      password: passwordValue ?? "123456",
    );
  }

  void navigateBack() => navigationService.back();
  void toTermsAndConditions() => navigationService.navigateTo(Routes.termsView);

  @override
  bool validateFields() {
    // ? setErrorForObject("email","Can't be empty") to have in TextFieldVerification
    if (emailValue == null || emailValue!.isEmpty)
      setValidationMessage("Email can't be empty.");
    else if (passwordValue == null || passwordValue!.isEmpty)
      setValidationMessage("Password can't be empty.");
    else if (passwordValue == null || passwordValue!.isEmpty)
      setValidationMessage("Password can't be empty.");
    else if (passwordValue != confirmPasswordValue) {
      setValidationMessage("Passwords Don't Match.");
    } else {
      clearErrors();
      setValidationMessage(null);
      return true;
    }
    notifyListeners();
    return false;
  }
}
