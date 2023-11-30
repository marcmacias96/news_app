// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsResponseImpl _$$NewsResponseImplFromJson(Map<String, dynamic> json) =>
    _$NewsResponseImpl(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsResponseImplToJson(_$NewsResponseImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
