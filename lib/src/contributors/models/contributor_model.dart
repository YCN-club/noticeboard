// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contributor_model.freezed.dart';
part 'contributor_model.g.dart';

@freezed
class ContributorModel with _$ContributorModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ContributorModel({
    required String login,
    required int id,
    required String nodeId,
    required String avatarUrl,
    required String gravatarId,
    required String url,
    required String htmlUrl,
    required String followersUrl,
    required String followingUrl,
    required String gistsUrl,
    required String starredUrl,
    required String subscriptionsUrl,
    required String organizationsUrl,
    required String reposUrl,
    required String eventsUrl,
    required String receivedEventsUrl,
    required String type,
    required bool siteAdmin,
    required int contributions,
  }) = _ContributorModel;

  factory ContributorModel.fromJson(Map<String, Object?> json) =>
      _$ContributorModelFromJson(json);
}
