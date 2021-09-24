import 'package:ferry/ferry.dart';
import 'package:stackedql_ferry/client.dart';
import 'package:stackedql_app/app/app.locator.dart';
import 'package:stackedql_app/app/app.logger.dart';
import 'package:stackedql_app/app/app.router.dart';
import 'package:stackedql_app/main.dart';
import 'package:stackedql_app/services/auth.dart';
import 'package:stacked_services/stacked_services.dart';

class FerryClient {
  static final log = getLogger("FerryClient");
  static String url = API + "/graphql";
  Client _client;
  FerryClient(this._client);

  static Future<FerryClient> initialize() async {
    final navigationService = locator<NavigationService>();
    return FerryClient(await initClient(url,
        defaultHeaders: {"Content-Type": "application/json"},
        updateToken: () => updateToken(),
        tokenExpired: () => Auth.service.tokenExpired(),
        onException: (exception) {
          log.w("(${exception.response.toString()})");
          navigationService.clearStackAndShow(Routes.startUpView);
        }));
  }

  static Future<String?> updateToken() async {
    print("Called update token.");
    String? token = (await Auth.getToken());
    print("Got Token: $token");
    return token;
  }

  static FerryClient get service => locator<FerryClient>();
  static Client get client => locator<FerryClient>()._client;
}
