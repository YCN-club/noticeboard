import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/PostViewModel.dart';
import 'package:notice_board/views/components/PostCard.dart';
import 'package:notice_board/views/mainPages/ContributorsPage.dart';
import 'package:notice_board/views/mainPages/FeedbackPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manipal Notice Board"),

          actions: [
            IconButton(
              onPressed: () => {Get.to(contributorsPage())},
              icon: const Icon(Icons.groups),
              tooltip: "meet the team and contributors",
            ),
            IconButton(
              onPressed: () => {Get.to(FeedbackPage())},
              icon: const Icon(Icons.feedback),
              tooltip: "Send us your ideas and feedback",
            ),
          ],
        ),
        body: GetX<PostViewModel>(builder: (controller) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: SizedBox(
                          width: 500.0,
                          child: ListView.builder(
                              itemCount: controller.posts.isNotEmpty
                                  ? controller.posts.length
                                  : 0,
                              itemBuilder: ((context, index) {
                                var currentData =
                                    controller.posts[index].attributes;
                                return PostCard(
                                    title: currentData.title,
                                    description: currentData.description,
                                    startDateTime: currentData.startDateTime,
                                    endDateTime: currentData.endDateTime,
                                    publishedAt: currentData.publishedAt,
                                    image: currentData.Image,
                                    );
                              }))))
                ])
          ]);
        }));
  }
}
