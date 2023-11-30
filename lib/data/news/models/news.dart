// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  factory News({
    required Source source,
    String? author,
    required String title,
    required String description,
    required String url,
    @JsonKey(name: "urlToImage") String? urlToImage,
    @JsonKey(name: "publishedAt") required DateTime publishedAt,
    String? content,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    String? id,
    required String name,
  }) = _Source;
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
