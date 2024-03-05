// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultModelImpl _$$ResultModelImplFromJson(Map<String, dynamic> json) =>
    _$ResultModelImpl(
      imageUrl: json['imageUrl'] as String,
      published: json['published'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
      rev: json['rev'] as String,
      type: json['type'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      date: DateTime.parse(json['date'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      longDescription: json['longDescription'] as String,
      mainImage: json['mainImage'] as Object,
      order: json['order'] as int,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      redirect: json['redirect'] as String,
      shortDescription: json['shortDescription'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ResultModelImplToJson(_$ResultModelImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'published': instance.published,
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'rev': instance.rev,
      'type': instance.type,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'longDescription': instance.longDescription,
      'mainImage': instance.mainImage,
      'order': instance.order,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'redirect': instance.redirect,
      'shortDescription': instance.shortDescription,
      'startTime': instance.startTime.toIso8601String(),
      'tags': instance.tags,
      'title': instance.title,
    };
