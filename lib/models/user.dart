import 'package:epidemiinet/models/notice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String address;
  final String email;
  final String firstName;
  final String id;
  final String lastName;
  final String middleName;
  final List<Notice> notices;
  final String phone;

  User(this.address, this.email, this.firstName, this.id, this.lastName,
      this.middleName, this.notices, this.phone);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String get fullName => "$lastName $firstName $middleName";
}
