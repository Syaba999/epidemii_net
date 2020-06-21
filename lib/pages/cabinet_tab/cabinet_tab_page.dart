import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/pages/cabinet_tab/mobx/cabinet_state.dart';
import 'package:epidemiinet/pages/cabinet_tab/widgets/calendar_item.dart';
import 'package:epidemiinet/pages/cabinet_tab/widgets/user_info_widget.dart';
import 'package:epidemiinet/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';

class CabinetTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).cabinet),
        ),
        body: MobxStatefulObserver(
          builder: _content,
          store: CabinetState(),
          initFunction: (CabinetState state) => state.fetchCalendarList(),
        ));
  }

  Widget _content(BuildContext context, CabinetState state) {
    if (state.calendarList == null) {
      return Loader();
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          UserInfoWidget(
            user: state.user,
            logoutButtonPress: state.logout,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.calendarList.length,
              itemBuilder: (context, index) => CalendarItem(
                    calendar: state.calendarList[index],
                    onTap: state.onCalendarTap,
                  )),
        ],
      ),
    );
  }
}
