import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';
import 'package:stackedql_ferry/http_auth_link.dart';

export 'graphql/api.req.gql.dart';
export 'graphql/api.var.gql.dart';
export 'graphql/api.data.gql.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<Client> initClient(String url,
    {Map<String, String> defaultHeaders = const {},
    Future<String?> Function()? updateToken,
    bool Function()? tokenExpired,
    required Function(HttpLinkServerException)? onException}) async {
  final link = HttpLink(url, defaultHeaders: defaultHeaders);
  // Caching
  await Hive.initFlutter();
  final box = await Hive.openBox("graphql");
  final store = HiveStore(box);
  final cache = Cache(store: store);

  // Custom link
  final HttpAuthLink httpAuthLink = HttpAuthLink(
      updateToken: updateToken,
      onException: onException,
      tokenExpired: tokenExpired);
  final Client client = Client(
    link: httpAuthLink.concat(link),
    // cache: cache,
  );
  return client;
}
