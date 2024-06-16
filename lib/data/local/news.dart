import 'package:hive/hive.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String publishedAt;
  @HiveField(3)
  final String source;
  @HiveField(4)
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source']['name'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
