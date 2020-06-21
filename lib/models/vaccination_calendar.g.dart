// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationCalendar _$VaccinationCalendarFromJson(Map<String, dynamic> json) {
  return VaccinationCalendar(
    json['endDate'] as String,
    json['id'] as String,
    json['startDate'] as String,
    json['title'] as String,
    json['toNotice'] as String,
  );
}

Map<String, dynamic> _$VaccinationCalendarToJson(
        VaccinationCalendar instance) =>
    <String, dynamic>{
      'endDate': instance.endDate,
      'id': instance.id,
      'startDate': instance.startDate,
      'title': instance.title,
      'toNotice': instance.toNotice,
    };
