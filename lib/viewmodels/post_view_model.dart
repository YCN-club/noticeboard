import 'package:get/get.dart';
import 'package:notice_board/models/post.dart';
import 'package:notice_board/repositories/post_repo.dart';

class PostViewModel extends GetxController {
  final PostRepo _repo = PostRepo();
  final posts = Posts(ms: 0, query: "", result: []).obs;
  Future fetchPosts() async {
    var temp = await _repo.getPosts();
    if (temp.result.isNotEmpty) {
      // rawPostResponse =  RawPostResponse.fromJson(jsonDecode(temp));
      // posts.value = rawPostResponse.data;
      posts.value = temp;
    }
  }
}
