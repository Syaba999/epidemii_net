import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/news_tab/mobx/preventive_state.dart';
import 'package:epidemiinet/pages/news_tab/widgets/preventive_item.dart';
import 'package:epidemiinet/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class PreventivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).preventiveMeasures),
      ),
      body: MobxStatefulObserver<PreventiveState>(
        store: PreventiveState(),
        builder: _content,
        initFunction: (state) => state.fetchPages(),
      ),
    );
  }

  Widget _content(BuildContext context, PreventiveState state) {
    if (state.opened == null) {
      return Loader();
    }
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: state.pages.length,
        itemBuilder: (context, index) {
          return PreventiveItem(
            htmlPage: state.pages[index],
            opened: state.opened[index],
            onTap: () => state.togglePage(index),
          );
        });
  }
}
