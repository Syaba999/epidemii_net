// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['address'] as String,
    json['email'] as String,
    json['firstName'] as String,
    json['id'] as String,
    json['lastName'] as String,
    json['middleName'] as String,
    (json['notices'] as List)
        ?.map((e) =>
            e == null ? null : Notice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['phone'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'address': instance.address,
      'email': instance.email,
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'notices': instance.notices,
      'phone': instance.phone,
    };
