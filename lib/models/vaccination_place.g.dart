// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationPlace _$VaccinationPlaceFromJson(Map<String, dynamic> json) {
  return VaccinationPlace(
    json['address'] as String,
    json['description'] as String,
    json['email'] as String,
    json['id'] as String,
    json['lat'] as String,
    json['long'] as String,
    json['phone'] as String,
    json['site'] as String,
    json['title'] as String,
    json['worktime'] as String,
  );
}

Map<String, dynamic> _$VaccinationPlaceToJson(VaccinationPlace instance) =>
    <String, dynamic>{
      'address': instance.address,
      'description': instance.description,
      'email': instance.email,
      'id': instance.id,
      'lat': instance.latString,
      'long': instance.longString,
      'phone': instance.phone,
      'site': instance.site,
      'title': instance.title,
      'worktime': instance.worktime,
    };
