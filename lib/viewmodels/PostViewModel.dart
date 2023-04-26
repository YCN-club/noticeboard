import 'dart:convert';

import 'package:get/get.dart';
import 'package:notice_board/models/Post.dart';
import 'package:notice_board/repositories/PostRepo.dart';

class PostViewModel extends GetxController {
  final PostRepo _repo = PostRepo();
  final posts = Posts(ms: 0, query: "", result: []).obs;
  Future fetchPosts() async {
    var temp = await _repo.getPosts();
    if (temp.result.length > 0) {
      // rawPostResponse =  RawPostResponse.fromJson(jsonDecode(temp));
      // posts.value = rawPostResponse.data;
      posts.value = temp;
    }
  }
}
