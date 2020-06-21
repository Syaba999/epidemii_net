import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vaccination_calendar.g.dart';

@JsonSerializable()
class VaccinationCalendar {
  final String endDate;
  final String id;
  final String startDate;
  final String title;
  final String toNotice;

  VaccinationCalendar(
      this.endDate, this.id, this.startDate, this.title, this.toNotice);

  factory VaccinationCalendar.fromJson(Map<String, dynamic> json) =>
      _$VaccinationCalendarFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationCalendarToJson(this);

  String get startDateFormat {
    final dateFormat = DateFormat("dd.MM.yyyy");
    return dateFormat.format(DateTime.parse(startDate));
  }

  String get endDateFormat {
    final dateFormat = DateFormat("dd.MM.yyyy");
    return dateFormat.format(DateTime.parse(endDate));
  }
}
