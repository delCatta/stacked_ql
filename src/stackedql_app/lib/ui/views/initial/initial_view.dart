import 'package:flutter/material.dart';
import 'package:stackedql_ui/stackedql_ui.dart';

import 'package:stacked/stacked.dart';

import 'initial_view_model.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitialViewModel>.reactive(
        createNewModelOnInsert: true,
        viewModelBuilder: () => InitialViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(children: [
                header(),
                Expanded(
                  child: Column(children: [
                    Expanded(
                        child: Container(
                            // Can be an image
                            )),
                    Expanded(
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  letUsHandleText(context,
                                      Theme.of(context).textTheme.headline1),
                                  smallText(context)
                                ])),
                      ),
                    )
                  ]),
                ),
                // DoubleButton(
                //   leftText: "Register",
                //   onLeftPressed: model.onRegisterButtonPressed,
                //   rightText: "Sign In",
                //   onRightPressed: model.onSignInButtonPressed,
                // ),
              ]),
            ),
          ));
        });
  }

  Widget smallText(BuildContext context) {
    double fontSize = 17;
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: fontSize),
            text: "",
            children: [
              TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: fontSize),
                  text: "ment"),
              TextSpan(
                  text:
                      " enables you to make appointments online, sends reminders and automatically generates reciepts for you!"),
            ]));
  }

  Widget letUsHandleText(BuildContext context, TextStyle? style) =>
      MergeSemantics(
        child: Column(
          children: [
            Text("Let us handle your ", style: style),
            Text("Business")
          ],
        ),
      );

  Widget header() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Text("TITLE")]),
          ],
        ),
      );
}
