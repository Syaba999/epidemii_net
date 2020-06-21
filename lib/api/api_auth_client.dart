import 'package:epidemiinet/api/urls.dart';
import 'package:graphql/client.dart';

class ApiAuthClient {
  final GraphQLClient client;

  ApiAuthClient(this.client);

  factory ApiAuthClient.init() {
    HttpLink _httpLink = HttpLink(
      uri: apiAuthUrl,
    );

    AuthLink _authLink = AuthLink(
      getToken: () async => '',
    );

    Link _link = _authLink.concat(_httpLink);

    GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );

    return ApiAuthClient(_client);
  }
}
