import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/notify_tab/mobx/notify_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class NotifyTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      body: MobxStatefulObserver(
        store: NotifyState(),
        builder: _content,
      ),
    );
  }

  Widget _content(BuildContext context, NotifyState state) {
    if (state.noticeList.isEmpty) {
      return Center(
        child: Text(
          "Уведомления отсутсвуют",
        ),
      );
    }
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemCount: state.noticeList.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Text(
                  state.noticeList[index].title,
                  style: TextStyle(fontSize: 16),
                ))
              ],
            ),
          ));
        });
  }
}
