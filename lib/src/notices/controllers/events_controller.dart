import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:noticeboard/src/notices/models/post_model.dart';

part 'events_controller.g.dart';

@riverpod
class Events extends _$Events {
  @override
  Future<PostModel> build() async {
    return await getPosts();
  }

  Future<PostModel> getPosts() async {
    var url = Uri.parse(
      'https://77w5symg.api.sanity.io/v2021-10-21/data/query/production?query=*%5BPublished%20%3D%3D%20true%5D%7C%20order(order%20asc)%7B%0A...%2C%0A%20%20%22ImageUrl%22%3A%20mainImage.asset%20-%3E%20url%0A%20%20%0A%7D',
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body.toString()));
    } else {
      return PostModel(ms: 0, query: '', result: []);
    }
  }
}
