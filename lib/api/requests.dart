import 'package:epidemiinet/api/api_auth_client.dart';
import 'package:epidemiinet/api/api_client.dart';
import 'package:epidemiinet/api/mutations/auth_mutations.dart';
import 'package:epidemiinet/api/queries/news_queries.dart';
import 'package:epidemiinet/api/queries/pages_queries.dart';
import 'package:epidemiinet/api/queries/user_queries.dart';
import 'package:epidemiinet/api/queries/vaccination_calendar_queries.dart';
import 'package:epidemiinet/api/queries/vaccination_place_queries.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/models/auth_model.dart';
import 'package:epidemiinet/models/html_page.dart';
import 'package:epidemiinet/models/news.dart';
import 'package:epidemiinet/models/user.dart';
import 'package:epidemiinet/models/vaccination_calendar.dart';
import 'package:epidemiinet/models/vaccination_place.dart';
import 'package:graphql/client.dart';

abstract class ApiRequests {
  static final _apiClient = Injector.getInjector.get<ApiClient>().client;
  static final _apiAuthClient =
      Injector.getInjector.get<ApiAuthClient>().client;

  static Future<List<News>> getNewsList() async {
    final options = QueryOptions(
      documentNode: gql(newsList),
    );
    final result = await _apiClient.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      return List<News>();
    }
    return (result.data['newsList'] as List)
        .map((e) => News.fromJson(e))
        .toList();
  }

  static Future<List<HtmlPage>> getPages() async {
    final options = QueryOptions(
      documentNode: gql(pages),
    );
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return List<HtmlPage>();
    }
    return (result.data['pages'] as List)
        .map((e) => HtmlPage.fromJson(e))
        .toList();
  }

  static Future<List<VaccinationPlace>> getVaccinationPlaces() async {
    final options = QueryOptions(
      documentNode: gql(vaccinationPlaces),
    );
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return List<VaccinationPlace>();
    }
    return (result.data['vaccinationPlaces'] as List)
        .map((e) => VaccinationPlace.fromJson(e))
        .toList();
  }

  static Future<List<VaccinationCalendar>> getVaccinationCalendarList() async {
    final options = QueryOptions(
      documentNode: gql(vaccinationCalendar),
    );
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return List<VaccinationCalendar>();
    }
    return (result.data['vaccinationCalendars'] as List)
        .map((e) => VaccinationCalendar.fromJson(e))
        .toList();
  }

  static Future<User> getUserInfo(AuthModel authModel) async {
    final options = QueryOptions(documentNode: gql(getUser));
    //final result = await _apiClient.query(options);
    final result = await _apiClient.query(options);
    print(result.toString());
    if (result.hasException) {
      print(result.exception.toString());
      return null;
    }
    return User.fromJson(result.data['user']);
  }

  static Future<User> login(String email, String password) async {
    print("LOGIN");
    final options = MutationOptions(
        documentNode: gql(userLogin),
        variables: <String, dynamic>{
          'email': email,
          'password': password,
        });
    final result = await _apiAuthClient.mutate(options);
    print(result.exception.toString());
    if (result.hasException) {
      throw result.exception.graphqlErrors.map((e) => e.message).toList();
    }
    print(result.data.toString());
    return User.fromJson(result.data['userLogin']['authenticatable']);
  }

  static Future<User> signUp(
    String email,
    String password,
    String passwordConf,
    String firstName,
    String lastName,
    String phone,
    String address,
    String middleName,
  ) async {
    print("signUp $email $password $passwordConf");
    final options = MutationOptions(
        documentNode: gql(userSignUp),
        variables: <String, dynamic>{
          'email': email,
          'password': password,
          'passwordConfirmation': passwordConf,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
          'address': address,
          'middleName': middleName,
        });
    final result = await _apiAuthClient.mutate(options);
    if (result.hasException) {
      throw result.exception.graphqlErrors.map((e) => e.message).toList();
    }
    print(result.data.toString());
    return User.fromJson(result.data['userSignUp']);
  }
}
