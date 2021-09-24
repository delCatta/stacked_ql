import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InitialViewModel extends BaseViewModel {
  NavigationService navigationService = locator<NavigationService>();

  void onRegisterButtonPressed() =>
      navigationService.navigateTo(Routes.registerView);

  void onSignInButtonPressed() =>
      navigationService.navigateTo(Routes.loginView);
}
