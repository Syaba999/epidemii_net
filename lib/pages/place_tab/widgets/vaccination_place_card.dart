import 'package:epidemiinet/generated/l10n.dart';
import 'package:epidemiinet/models/vaccination_place.dart';
import 'package:flutter/material.dart';

class VaccinationPlaceCard extends StatelessWidget {
  final VaccinationPlace place;
  final Function(String) onSiteTap;
  final Function(String) onPhoneTap;
  final Function(String) onMailTap;

  const VaccinationPlaceCard(
      {Key key,
      @required this.place,
      this.onSiteTap,
      this.onPhoneTap,
      this.onMailTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    place.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(place.address),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    place.description,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  _buildInfo(
                    context,
                    S.of(context).workTime,
                    place.worktime,
                  ),
                  _buildInfo(
                    context,
                    S.of(context).phone,
                    place.phone,
                    onPressed: () => onPhoneTap(place.phone),
                    icon: Icons.phone,
                  ),
                  _buildInfo(
                    context,
                    S.of(context).email,
                    place.email,
                    onPressed: () => onMailTap(place.email),
                    icon: Icons.mail_outline,
                  ),
                  _buildInfo(
                    context,
                    S.of(context).site,
                    place.site,
                    onPressed: () => onSiteTap(place.site),
                    icon: Icons.open_in_new,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context, String label, String text,
      {Function() onPressed, icon}) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15,
                        color: onPressed != null
                            ? Theme.of(context).accentColor
                            : Colors.black),
                  )
                ],
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: Theme.of(context).accentColor,
                size: 20,
              )
          ],
        ),
      ),
    );
  }
}
