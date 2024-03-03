import 'package:get/get.dart';
import 'package:noticeboard/models/post.dart';
import 'package:noticeboard/repositories/post_repo.dart';

class PostController extends GetxController {
  final PostRepo _repo = PostRepo();
  final posts = Posts(ms: 0, query: '', result: []).obs;
  Future fetchPosts() async {
    var temp = await _repo.getPosts();
    if (temp.result.isNotEmpty) {
      // rawPostResponse =  RawPostResponse.fromJson(jsonDecode(temp));
      // posts.value = rawPostResponse.data;
      posts.value = temp;
    }
  }
}
