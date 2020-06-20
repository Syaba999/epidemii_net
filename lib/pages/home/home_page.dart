import 'package:epidemiinet/pages/cabinet_tab/cabinet_tab_page.dart';
import 'package:epidemiinet/pages/home/mobx/home_state.dart';
import 'package:epidemiinet/pages/map_tab/map_tab_page.dart';
import 'package:epidemiinet/pages/news_tab/news_tab_page.dart';
import 'package:epidemiinet/pages/notify_tab/notify_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver(
      store: HomeState(),
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
            icon: Icon(Icons.list),
            title: Text("Новости"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Уведомления"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Карта"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Кабинет"),
          ),
        ],
        onTap: state.selectTab,
        currentIndex: state.selectedTab,
      ),
      body: pages[state.selectedTab],
    );
  }

  List<Widget> pages = [
    NewsTabPage(),
    NotifyTabPage(),
    MapTabPage(),
    CabinetTabPage(),
  ];
}
