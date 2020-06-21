import 'package:epidemiinet/api/api_client.dart';
import 'package:epidemiinet/api/queries/news_queries.dart';
import 'package:epidemiinet/api/queries/pages_queries.dart';
import 'package:epidemiinet/api/queries/user_queries.dart';
import 'package:epidemiinet/api/queries/vaccination_calendar_queries.dart';
import 'package:epidemiinet/api/queries/vaccination_place_queries.dart';
import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/models/html_page.dart';
import 'package:epidemiinet/models/news.dart';
import 'package:epidemiinet/models/user.dart';
import 'package:epidemiinet/models/vaccination_calendar.dart';
import 'package:epidemiinet/models/vaccination_place.dart';
import 'package:graphql/client.dart';

abstract class ApiRequests {
  static final _apiClient = Injector.getInjector.get<ApiClient>().client;
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

  static Future<User> getUserInfo(int id) async {
    final options = QueryOptions(
        documentNode: gql(getUser),
        variables: <String, dynamic>{'nUserId': id});
    final result = await _apiClient.query(options);
    if (result.hasException) {
      print(result.exception.toString());
      return null;
    }
    return User.fromJson(result.data['user']);
  }
}
