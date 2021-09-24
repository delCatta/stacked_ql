import 'package:flutter/material.dart';
import 'package:stackedql_app/ui/views/terms/terms_view_model.dart';
import 'package:stacked/stacked.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body:
              Center(child: Text("Terms and Conditions and Privacy policy."))),
      viewModelBuilder: () => TermsViewModel(),
    );
  }
}
