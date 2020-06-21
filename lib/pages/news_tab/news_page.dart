import 'package:epidemiinet/di/injector.dart';
import 'package:epidemiinet/pages/news_tab/mobx/news_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatelessObserver(
      store: Injector.getInjector.get<NewsState>(),
      builder: _content,
    );
  }

  Widget _content(BuildContext context, NewsState state) {
    final news = state.selectedNews;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(news.fullImageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                news.date,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.description),
            ),
          ],
        ),
      ),
    );
  }
}
