import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stackedql_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _title = "Home View";
  String get title => _title;

  NavigationService navigationService = locator<NavigationService>();

  void logOut() {
    Auth.service.logOut();
    navigationService.clearStackAndShow(Routes.initialView);
  }
}
