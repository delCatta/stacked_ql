import 'package:stackedql_app/services/auth.dart';
import 'package:stackedql_app/services/http.dart';
import 'package:stackedql_app/services/ment_client.dart';
import 'package:stackedql_app/services/user.dart';
import 'package:stackedql_app/ui/views/home/home_view.dart';
import 'package:stackedql_app/ui/views/initial/initial_view.dart';
import 'package:stackedql_app/ui/views/login/login_view.dart';
import 'package:stackedql_app/ui/views/profile_setup/profile_setup_view.dart';
import 'package:stackedql_app/ui/views/register/register_view.dart';
import 'package:stackedql_app/ui/views/startup/startup_view.dart';
import 'package:stackedql_app/ui/views/terms/terms_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: InitialView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: RegisterView),
  MaterialRoute(page: ProfileSetupView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: TermsView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: HTTP),
  LazySingleton(classType: Auth),
  Presolve(classType: MentClient, presolveUsing: MentClient.initialize),
  LazySingleton(classType: UserService),
], logger: StackedLogger())
class AppSetup {}

// flutter pub run build_runner build --delete-conflicting-outputs