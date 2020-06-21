import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/cabinet_tab/cabinet_tab_page.dart';
import 'package:epidemiinet/pages/home/mobx/home_state.dart';
import 'package:epidemiinet/pages/news_tab/news_tab_page.dart';
import 'package:epidemiinet/pages/notify_tab/notify_tab_page.dart';
import 'package:epidemiinet/pages/place_tab/place_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mobx_provider/mobx_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver(
      store: Injector.getInjector.get<HomeState>(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, HomeState state) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome5.newspaper,
            ),
            title: Text(
              S.of(context).newsList,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.bell,
            ),
            title: Text(
              S.of(context).notifications,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome5Solid.clinic_medical,
            ),
            title: Text(
              S.of(context).vaccination,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.user),
            title: Text(
              S.of(context).cabinet,
            ),
          ),
        ],
        onTap: state.selectTab,
        currentIndex: state.selectedTab,
      ),
      body: pages[state.selectedTab],
    );
  }

  final List<Widget> pages = [
    NewsTabPage(),
    NotifyTabPage(),
    PlaceTabPage(),
    CabinetTabPage(),
  ];
}
