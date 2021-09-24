import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.logger.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/models/app_models.dart';
import 'package:stackedql_app/services/ment_client.dart';
import 'package:stackedql_ferry/client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserService extends BaseViewModel {
  final log = getLogger("UserService");
  final navigationService = locator<NavigationService>();
  static Client client = MentClient.client;
  User? _currentUser;

  Future<void> updateCurrentUser(User user) async {
    _currentUser = user;
    notifyListeners();
  }

  static UserService get service => locator<UserService>();
  static User get currentUser => service._currentUser!;
}
