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
    return GetX<PostViewModel>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: FloatingActionButton(
            onPressed: controller.fetchPosts,
            child: Icon(Icons.replay_outlined),
          ),
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide(
                color: Colors.orange,
                width: 4,
              ),
            ),
            elevation: 4,
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
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: SizedBox(
                              width: 300.0,
                              child: ListView.builder(
                                  itemCount: controller.posts.isNotEmpty
                                      ? controller.posts.length
                                      : 0,
                                  itemBuilder: ((context, index) {
                                    var currentData = controller.posts[index];
                                    return PostCard(
                                      title: currentData.title,
                                      description: currentData.shortDescription,
                                      startDateTime: currentData.startDateTime,
                                      endDateTime: currentData.endDateTime,
                                      publishedAt: currentData.updatedAt,
                                      image: currentData.Image,
                                    );
                                    // return ListTile(
                                    //   title: Text(currentData.title),
                                    // );
                                  }))))
                    ])
              ],
            ),
          ));
    });
  }
}
