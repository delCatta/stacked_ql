// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/initial/initial_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/profile_setup/profile_setup_view.dart';
import '../ui/views/register/register_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/terms/terms_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String initialView = '/initial-view';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String profileSetupView = '/profile-setup-view';
  static const String homeView = '/home-view';
  static const String termsView = '/terms-view';
  static const all = <String>{
    startUpView,
    initialView,
    loginView,
    registerView,
    profileSetupView,
    homeView,
    termsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.initialView, page: InitialView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.profileSetupView, page: ProfileSetupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.termsView, page: TermsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    InitialView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const InitialView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    RegisterView: (data) {
      var args = data.getArgs<RegisterViewArguments>(
        orElse: () => RegisterViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => RegisterView(key: args.key),
        settings: data,
      );
    },
    ProfileSetupView: (data) {
      var args = data.getArgs<ProfileSetupViewArguments>(
        orElse: () => ProfileSetupViewArguments(),
      );
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ProfileSetupView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    TermsView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const TermsView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// RegisterView arguments holder class
class RegisterViewArguments {
  final Key? key;
  RegisterViewArguments({this.key});
}

/// ProfileSetupView arguments holder class
class ProfileSetupViewArguments {
  final Key? key;
  ProfileSetupViewArguments({this.key});
}
