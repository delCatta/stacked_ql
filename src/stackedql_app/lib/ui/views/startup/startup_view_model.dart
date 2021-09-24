import 'package:ferry_exec/src/operation_response.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.logger.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/models/app_models.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stackedql_app/services/ment_client.dart';
import 'package:stackedql_app/services/user.dart';
import 'package:stackedql_ferry/client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger("StartUpViewModel");
  StartUpViewModel() {
    setBusy(true);
  }
  NavigationService navigationService = locator<NavigationService>();

  Future<void> runInitialLogic() async {
    // final query = GInitialCurrentUserQueryReq();
    if (!(await Auth.service.isAuth)) return handleNoUser();
    // FerryClient.client.request(query).listen(initialQueryResponse);
  }

  // void initialQueryResponse(
  //     OperationResponse<GInitialCurrentUserQueryData,
  //             GInitialCurrentUserQueryVars>
  //         response) {
  //   if (response.hasErrors) return handleNoUser(response: response);
  //   try {
  //     User responseUser = User.fromJson(response.data!.currentUser!.toJson());
  //     UserService.service.updateCurrentUser(responseUser);
  //     handleUserSetup(responseUser);
  //   } catch (e) {
  //     log.wtf("User should be available.", e);
  //     handleNoUser(response: response);
  //   }
  //   Future.delayed(Duration(seconds: 5), () {
  //     setBusy(false);
  //   });
  // }

  // void handleNoUser(
  //     {OperationResponse<GInitialCurrentUserQueryData,
  //             GInitialCurrentUserQueryVars>?
  //         response}) async {
  //   if (response != null) {
  //     log.wtf("User shouldn't be null", response.graphqlErrors);
  //   }
  //   navigationService.clearStackAndShow(Routes.initialView);
  // }

  // void handleUserSetup(User user) {
  //   if (user.setup!) {
  //     log.i("Navigating to Home View.");
  //     navigationService.navigateTo(Routes.homeView);
  //   } else {
  //     log.i("Navigating to Setup View.");
  //     navigationService.navigateTo(Routes.profileSetupView);
  //   }
  // }
}
