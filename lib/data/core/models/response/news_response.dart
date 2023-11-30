
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_app/data/news/models/news.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
class NewsResponse with _$NewsResponse {
  factory NewsResponse({
    required List<News> articles,
  }) = _NewsResponse;
	
  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
			_$NewsResponseFromJson(json);
}
