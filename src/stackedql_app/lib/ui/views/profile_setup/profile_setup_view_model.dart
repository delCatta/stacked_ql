import 'package:ferry_exec/src/operation_response.dart';
import 'package:flutter/material.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.logger.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/models/app_models.dart';
import 'package:stackedql_app/services/ment_client.dart';
import 'package:stackedql_app/services/user.dart';
import 'package:stackedql_ferry/client.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'profile_setup_view.form.dart';

class ProfileSetupViewModel extends FormViewModel {
  User get user => UserService.currentUser;

  final log = getLogger("ProfileSetupViewModel");
  final navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {}

  Future saveData(BuildContext context) async {
    FocusScope.of(context).unfocus();
    setBusy(true);
    if (!validateFields()) return;
    GUpdateUserMutationReq query = GUpdateUserMutationReq(
      (b) {
        b.vars.updateUserInput.id = user.id;
        b.vars.updateUserInput.attributes.setup = nameValue != null &&
            lastNameValue != null &&
            phoneValue != null &&
            countryValue != null;
        b.vars.updateUserInput.attributes.name = nameValue;
        b.vars.updateUserInput.attributes.lastName = lastNameValue;
        b.vars.updateUserInput.attributes.phone = phoneValue;
        b.vars.updateUserInput.attributes.country = countryValue;
        return b;
      },
    );
    MentClient.client.request(query).listen(handleUserUpdate);
  }

  bool validateFields() {
    // TODO: INCREASE VALIDATION HERE TO REMOVE SERVER USAGE.
    if (nameValue == null)
      setValidationMessage("Name can't be null.");
    else if (lastNameValue == null)
      setValidationMessage("Last Name(s) can't be null.");
    else if (phoneValue == null)
      setValidationMessage("Phone can't be null.");
    else if (countryValue == null)
      setValidationMessage("Country can't be null.");
    else
      return true;
    setBusy(false);
    return false;
  }

  @override
  void setValidationMessage(String? value) {
    super.setValidationMessage(value);
    notifyListeners();
  }

  void handleUserUpdate(
      OperationResponse<GUpdateUserMutationData, GUpdateUserMutationVars>
          response) {
    if (response.hasErrors) return handleUpdateError(response: response);

    try {
      User responseUser =
          User.fromJson(response.data!.updateUser!.user!.toJson());
      UserService.service.updateCurrentUser(responseUser);
      // ? Display Success Message
      navigationService.clearStackAndShow(Routes.startUpView);
    } catch (e) {
      handleUpdateError();
    }
    Future.delayed(Duration(seconds: 5), () {
      setBusy(false);
    });
  }

  void handleUpdateError(
      {OperationResponse<GUpdateUserMutationData, GUpdateUserMutationVars>?
          response}) {
    if (response != null) {
      log.e(response.graphqlErrors);
      setValidationMessage(response.graphqlErrors.toString());
    }
    navigationService.navigateTo(Routes.initialView);
    setBusy(false);
  }
}
