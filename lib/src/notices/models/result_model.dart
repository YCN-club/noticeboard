// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
class ResultModel with _$ResultModel {
  const factory ResultModel({
    required String imageUrl,
    required bool published,
    required DateTime createdAt,
    required String id,
    required String rev,
    required String type,
    required DateTime updatedAt,
    required DateTime date,
    required DateTime endTime,
    required String longDescription,
    required Object mainImage,
    required int order,
    required DateTime publishedAt,
    required String redirect,
    required String shortDescription,
    required DateTime startTime,
    required List<String> tags,
    required String title,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, Object?> json) =>
      _$ResultModelFromJson(json);
}
