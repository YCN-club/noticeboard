import 'package:flutter/material.dart';
import 'package:notice_board/models/Post.dart';

class DisplayPosts extends StatelessWidget {
  final List<Post> posts;
  const DisplayPosts({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Container();
          })
    ]);
  }
}
