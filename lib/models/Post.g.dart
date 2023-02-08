// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['title'] as String,
      json['description'] as String,
      json['startDateTime'] as String,
      json['endDateTime'] as String,
      json['uid'] as String,
      json['CMemail'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['publishedAt'] as String,
      json['Image'],
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'uid': instance.uid,
      'CMemail': instance.CMemail,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'Image': instance.Image,
    };
