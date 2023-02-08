import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notice_board/views/mainPages/ContributorsPage.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Manipal Notice Board - Feedback and ideas"),
        actions: [ IconButton(
              onPressed: () => {Get.to(const contributorsPage())},
              icon: const Icon(Icons.groups),
              tooltip: "meet the team and contributors",
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.feedback),
              tooltip: "Send us your ideas and feedback",
            ),]),
            body: Column(children: [
             
            ],),
    );
  }
}