// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawPostResponse _$RawPostResponseFromJson(Map<String, dynamic> json) =>
    RawPostResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ResponsePost.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'],
    );

Map<String, dynamic> _$RawPostResponseToJson(RawPostResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta,
    };
