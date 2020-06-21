import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/place_tab/mobx/place_tab_state.dart';
import 'package:epidemiinet/pages/place_tab/widgets/vaccination_place_card.dart';
import 'package:epidemiinet/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class PlaceTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).vaccinationPlaces),
      ),
      body: MobxStatefulObserver(
        store: Injector.getInjector.get<PlaceTabState>(),
        builder: _content,
        initFunction: (PlaceTabState state) {
          if (state.vaccinationsPlaces == null) state.fetchVaccinationsPlaces();
        },
      ),
    );
  }

  Widget _content(BuildContext context, PlaceTabState state) {
    if (state.listType == null) {
      return Loader();
    }
    return Scaffold(
      body: state.listType == ListType.map
          ? _buildMap(context, state)
          : _buildList(context, state),
      /*floatingActionButton: FloatingActionButton.extended(
        icon: Icon(state.listType == ListType.map ? Icons.list : Icons.map),
        label: Text(state.listType == ListType.map
            ? S.of(context).asList
            : S.of(context).onMap),
        onPressed: state.toggleListType,
      ),*/
    );
  }

  Widget _buildList(BuildContext context, PlaceTabState state) {
    return ListView.builder(
        shrinkWrap: true,
        //padding: const EdgeInsets.only(bottom: 80),
        itemCount: state.vaccinationsPlaces.length,
        itemBuilder: (context, index) => VaccinationPlaceCard(
              place: state.vaccinationsPlaces[index],
              onSiteTap: state.launchUrl,
              onMailTap: state.launchMail,
              onPhoneTap: state.launchPhone,
            ));
  }

  Widget _buildMap(BuildContext context, PlaceTabState state) {
    return Container();
  }
}
