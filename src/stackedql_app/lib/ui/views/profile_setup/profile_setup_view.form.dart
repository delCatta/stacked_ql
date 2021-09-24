// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String LastNameValueKey = 'lastName';
const String PhoneValueKey = 'phone';
const String CountryValueKey = 'country';

mixin $ProfileSetupView on StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode countryFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    countryController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            NameValueKey: nameController.text,
            LastNameValueKey: lastNameController.text,
            PhoneValueKey: phoneController.text,
            CountryValueKey: countryController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    nameController.dispose();
    nameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    phoneController.dispose();
    phoneFocusNode.dispose();
    countryController.dispose();
    countryFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get nameValue => this.formValueMap[NameValueKey];
  String? get lastNameValue => this.formValueMap[LastNameValueKey];
  String? get phoneValue => this.formValueMap[PhoneValueKey];
  String? get countryValue => this.formValueMap[CountryValueKey];

  bool get hasName => this.formValueMap.containsKey(NameValueKey);
  bool get hasLastName => this.formValueMap.containsKey(LastNameValueKey);
  bool get hasPhone => this.formValueMap.containsKey(PhoneValueKey);
  bool get hasCountry => this.formValueMap.containsKey(CountryValueKey);
}

extension Methods on FormViewModel {}
