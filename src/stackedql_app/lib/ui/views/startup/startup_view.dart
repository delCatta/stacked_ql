import 'package:flutter/material.dart';
import 'package:stackedql_ui/stackedql_ui.dart';

import 'package:stackedql_app/ui/views/initial/initial_view.dart';
import 'package:stackedql_app/ui/views/startup/startup_view_model.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) => model.runInitialLogic(),
      fireOnModelReadyOnce: true,
      builder: (context, model, child) => model.isBusy
          ? Scaffold(body: Center(child: CircularProgressIndicator()))
          : InitialView(),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
