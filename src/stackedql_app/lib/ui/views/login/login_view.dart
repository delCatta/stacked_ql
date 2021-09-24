import 'package:flutter/material.dart';
import 'package:stackedql_app/ui/layouts/authentication_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_view_model.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          busy: model.isBusy,
          onBackPressed: model.navigationService.back,
          onCreateAccountTapped: model.navigateToRegister,
          validationMessage: model.validationMessage,
          title: 'Welcome',
          subtitle: 'Enter your email address to sign in.',
          mainButtonTitle: 'SIGN IN',
          form: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: emailController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: passwordController,
                obscureText: true,
              ),
            ],
          ),
          //TODO: onForgetPasswordTapped: () {},
          onMainButtonTapped: () => model.saveData(context),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
