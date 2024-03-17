// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';
part 'event_model.freezed.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
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
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}
