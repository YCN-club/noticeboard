import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:noticeboard/src/contributors/models/contributor_model.dart';

part 'contributors_controller.g.dart';

@riverpod
class Contributors extends _$Contributors {
  @override
  Future<List<ContributorModel>> build() async {
    return await init();
  }

  Future<List<ContributorModel>> init() async {
    var url = Uri.parse(
      'https://api.github.com/repos/mitblr-club/noticeboard/contributors',
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      return List<ContributorModel>.from(json
          .decode(response.body.toString())
          .map((x) => ContributorModel.fromJson(x)));
    } else {
      return [];
    }
  }
}
