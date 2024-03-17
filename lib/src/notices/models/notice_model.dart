// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.g.dart';
part 'notice_model.freezed.dart';

@freezed
class NoticeModel with _$NoticeModel {
  const factory NoticeModel({
    required DateTime createdAt,
    required DateTime updatedAt,
    required String title,
    required String image,
    required String type,
    required DateTime startTime,
    required DateTime endTime,
    required String shortDescription,
    required String longDescription,
    required List<String> tags,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, Object?> json) =>
      _$NoticeModelFromJson(json);
}
