// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponsePost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePost _$ResponsePostFromJson(Map<String, dynamic> json) => ResponsePost(
      json['id'] as int,
      Post.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponsePostToJson(ResponsePost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes.toJson(),
    };
