import 'package:json_annotation/json_annotation.dart';

part 'vaccination_place.g.dart';

@JsonSerializable()
class VaccinationPlace {
  final String address;
  final String description;
  final String email;
  final String id;
  @JsonKey(name: "lat")
  final String latString;
  @JsonKey(name: "long")
  final String longString;
  final String phone;
  final String site;
  final String title;
  final String worktime;

  VaccinationPlace(
      this.address,
      this.description,
      this.email,
      this.id,
      this.latString,
      this.longString,
      this.phone,
      this.site,
      this.title,
      this.worktime);

  factory VaccinationPlace.fromJson(Map<String, dynamic> json) =>
      _$VaccinationPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$VaccinationPlaceToJson(this);

  double get lat => double.parse(latString);

  double get long => double.parse(longString);
}
