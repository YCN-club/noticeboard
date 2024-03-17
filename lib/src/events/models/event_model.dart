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
    required String type,
    required String title,
    required String image,
    required String tagline,
    required String description,
    required DateTime startTime,
    required DateTime endTime,
    required String club,
    required String venue,
    required int registrations,
    required List<String> tags,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}
