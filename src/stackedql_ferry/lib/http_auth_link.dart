import 'package:gql_error_link/gql_error_link.dart';
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import 'package:gql_transform_link/gql_transform_link.dart';

class HttpAuthLink extends Link {
  late Link _link;
  String? _token;
  Future<String?> Function()? updateToken;
  final bool Function()? tokenExpired;
  Function(HttpLinkServerException)? onException;

  HttpAuthLink({
    this.updateToken,
    this.tokenExpired,
    this.onException,
  }) {
    _link = Link.concat(
      ErrorLink(onException: handleException),
      TransformLink(requestTransformer: transformRequest),
    );
  }

  Stream<Response> handleException(
    Request request,
    NextLink forward,
    LinkException exception,
  ) async* {
    if (exception is HttpLinkServerException) {
      print("Exception: ${exception.response.statusCode}");
      onException!(exception);

      yield* forward(request);
    } else {
      throw exception;
    }
  }

  Request transformRequest(Request request) {
    return request.updateContextEntry<HttpLinkHeaders>(
      (headers) {
        return HttpLinkHeaders(
          headers: <String, String>{
            ...headers?.headers ?? <String, String>{},
            "Authorization": "Bearer $_token",
          },
        );
      },
    );
  }

  @override
  Stream<Response> request(Request request, [forward]) async* {
    if (_token == null || tokenExpired!()) {
      print("HttpLink: Request had null token, updatingToken().");
      _token = await updateToken!();
    }

    yield* _link.request(request, forward);
  }
}
