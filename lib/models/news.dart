import 'package:epidemiinet/api/urls.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String createdAt;

  News(this.id, this.title, this.description, this.imageUrl, this.createdAt);

  String get fullImageUrl => homeUrl + imageUrl;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  String get date {
    final formatter = DateFormat('dd.MM.yyyy HH:mm');
    return formatter.format(DateTime.parse(createdAt));
  }
}
