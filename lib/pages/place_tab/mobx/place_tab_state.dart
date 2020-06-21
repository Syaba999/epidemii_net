import 'package:epidemiinet/api/requests.dart';
import 'package:epidemiinet/models/vaccination_place.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:url_launcher/url_launcher.dart';

part 'place_tab_state.g.dart';

class PlaceTabState = _PlaceTabState with _$PlaceTabState;

abstract class _PlaceTabState extends MobxBase with Store {
  List<VaccinationPlace> vaccinationsPlaces;

  @observable
  ListType listType;

  @action
  void toggleListType() {
    if (listType == ListType.map) {
      listType = ListType.list;
    } else {
      listType = ListType.map;
    }
  }

  Future<void> fetchVaccinationsPlaces() async {
    vaccinationsPlaces = await ApiRequests.getVaccinationPlaces();
    listType = ListType.list;
  }

  void launchUrl(String url) {
    _launchURL(url);
  }

  void launchMail(String mail) {
    _launchURL("mailto:$mail");
  }

  void launchPhone(String phone) {
    _launchURL("tel:$phone");
  }

  @override
  void dispose() {}

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

enum ListType { map, list }
