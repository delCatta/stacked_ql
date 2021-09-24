import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stackedql_app/ui/ui_helpers.dart';
import 'package:stackedql_ui/stackedql_ui.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final Function()? onTermsAndConditionsPressed;
  final Function()? onMainButtonTapped;
  final Function()? onCreateAccountTapped;
  final Function()? onForgetPasswordTapped;
  final Function()? onBackPressed;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    required this.title,
    required this.subtitle,
    required this.form,
    this.onMainButtonTapped,
    this.onTermsAndConditionsPressed,
    this.validationMessage,
    this.onCreateAccountTapped,
    this.onForgetPasswordTapped,
    this.onBackPressed,
    this.mainButtonTitle = 'CONTINUE',
    this.busy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header(onBackPressed: onBackPressed),
          verticalSpaceRegular,
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 34),
                    ),
                    verticalSpaceSmall,
                    SizedBox(
                      width: screenWidthPercentage(context, percentage: 0.7),
                      child: Text(subtitle),
                    ),
                    verticalSpaceRegular,
                    form,
                    verticalSpaceRegular,
                    if (onForgetPasswordTapped != null)
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: onForgetPasswordTapped,
                          child: Text('Forget Password'),
                        ),
                      ),
                    verticalSpaceRegular,
                    if (validationMessage != null)
                      Text(
                        validationMessage ?? "",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    if (validationMessage != null) verticalSpaceRegular,
                  ],
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          child: busy
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  child: Text(mainButtonTitle),
                                  onPressed: onMainButtonTapped,
                                )),
                    ),
                  ],
                ),
                verticalSpaceRegular,
                if (onCreateAccountTapped != null)
                  GestureDetector(
                    onTap: () {
                      onCreateAccountTapped!();
                    },
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        horizontalSpaceTiny,
                        Text('Create an account',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.blue, // Primary Color
                                    fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                if (onTermsAndConditionsPressed != null)
                  GestureDetector(
                    onTap: onTermsAndConditionsPressed,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text('By signing up you agree to our'),
                        horizontalSpaceTiny,
                        Text('Terms, conditions and privacy Policy.',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.blue, // Primary Color
                                    fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
