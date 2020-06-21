import 'package:epidemiinet/models/vaccination_calendar.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final VaccinationCalendar calendar;
  final Function() onTap;

  const CalendarItem({Key key, @required this.calendar, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        color: Theme.of(context).accentColor,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  calendar.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Необходимо пройти в период с ${calendar.startDateFormat} по ${calendar.endDateFormat}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
