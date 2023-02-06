import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/PostViewModel.dart';
import 'package:notice_board/views/components/PostCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Manipal Notice Board")),
        body: GetX<PostViewModel>(builder: (controller) {
          return ListView.builder(
              itemCount:
                  controller.posts.isNotEmpty ? controller.posts.length : 0,
              itemBuilder: ((context, index) {
                var currentData = controller.posts[index].attributes;
                return PostCard(
                    title: currentData.title,
                    description: currentData.description,
                    startDateTime: currentData.startDateTime,
                    endDateTime: currentData.endDateTime,
                    publishedAt: currentData.publishedAt);
              }));
        }));
  }
}
