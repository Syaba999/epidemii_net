import 'package:json_annotation/json_annotation.dart';

part 'html_page.g.dart';

@JsonSerializable()
class HtmlPage {
  final String id;
  final String title;
  final String name;
  final String text;

  HtmlPage(this.id, this.title, this.name, this.text);

  factory HtmlPage.fromJson(Map<String, dynamic> json) =>
      _$HtmlPageFromJson(json);

  Map<String, dynamic> toJson() => _$HtmlPageToJson(this);
}
