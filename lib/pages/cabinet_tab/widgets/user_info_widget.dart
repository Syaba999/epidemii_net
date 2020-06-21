import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/models/user.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final User user;
  final Function() logoutButtonPress;

  const UserInfoWidget({Key key, @required this.user, this.logoutButtonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: Center(
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.fullName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  user.address,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${S.of(context).phone}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user.phone),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${S.of(context).email}:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(user.email),
              ],
            ),
          ),
          InkWell(
            onTap: logoutButtonPress,
            child: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
