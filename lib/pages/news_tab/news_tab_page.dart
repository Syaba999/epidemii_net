import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/news_tab/mobx/news_state.dart';
import 'package:epidemiinet/pages/news_tab/widgets/news_card_widget.dart';
import 'package:epidemiinet/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class NewsTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).newsList),
      ),
      body: MobxStatefulObserver(
        store: Injector.getInjector.get<NewsState>(),
        builder: _content,
        initFunction: (NewsState store) {
          if (store.newsList == null) store.fetchNewsList();
        },
      ),
    );
  }

  Widget _content(BuildContext context, NewsState state) {
    if (state.newsList == null) {
      return Loader();
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: state.preventiveButtonPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      S.of(context).preventiveMeasures.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return NewsCardWidget(
                  news: state.newsList[index],
                  onTap: () => state.onNewsItemTap(state.newsList[index].id),
                );
              }),
        ],
      ),
    );
  }
}
