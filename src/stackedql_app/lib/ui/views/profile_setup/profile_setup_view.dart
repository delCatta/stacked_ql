import 'package:flutter/material.dart';
import 'package:stackedql_app/ui/layouts/profile_setup_layout.dart';
import 'package:stackedql_app/ui/views/profile_setup/profile_setup_view.form.dart';
import 'package:stackedql_app/ui/views/profile_setup/profile_setup_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'phone'),
  FormTextField(name: 'country'),
])
class ProfileSetupView extends StatelessWidget with $ProfileSetupView {
  ProfileSetupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileSetupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: ProfileSetupLayout(
          busy: model.isBusy,
          title: "Profile Setup",
          subtitle: "Let's build your profile.",
          validationMessage: model.validationMessage,
          onMainButtonTapped: () {
            model.saveData(context);
          },
          form: Column(children: [
            TextField(
              enabled: model.user.name?.isEmpty,
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            TextField(
              enabled: model.user.lastName?.isEmpty,
              decoration: InputDecoration(labelText: 'Last Name(s)'),
              controller: lastNameController,
            ),
            TextField(
              enabled: model.user.phone?.isEmpty,
              decoration: InputDecoration(labelText: 'Phone'),
              controller: phoneController,
            ),
            TextField(
              enabled: model.user.country?.isEmpty,
              decoration: InputDecoration(labelText: 'Country'),
              controller: countryController,
            ),
          ]),
        ),
      ),
      viewModelBuilder: () => ProfileSetupViewModel(),
    );
  }
}
