import 'package:flutter/material.dart';
import 'package:stackedql_app/ui/layouts/authentication_layout.dart';
import 'package:stackedql_app/ui/views/register/register_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'register_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
              busy: model.isBusy,
              onBackPressed: model.navigateBack,
              validationMessage: model.validationMessage,
              title: 'Create Account',
              subtitle: 'Enter your name email and password for sign up',
              mainButtonTitle: 'SIGN UP',
              form: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: emailController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: passwordController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                ],
              ),
              onTermsAndConditionsPressed: model.toTermsAndConditions,
              onMainButtonTapped: () {
                model.saveData(context);
              })),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
