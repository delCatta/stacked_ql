import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

const String API = "https://api.ment.cl";
void main() async {
  await setupLocator();
  runApp(MentApp());
}

class MentApp extends StatelessWidget {
  const MentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      // TODO: THEMES
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
