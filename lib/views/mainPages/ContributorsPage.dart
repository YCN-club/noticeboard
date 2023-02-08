import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:notice_board/views/mainPages/FeedbackPage.dart';

class contributorsPage extends StatelessWidget {
  const contributorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Manipal Notice Board - Meet the team"),
        actions: [
           IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.groups),
              tooltip: "meet the team and contributors",
            ),
            IconButton(
              onPressed: () => {Get.to(FeedbackPage())},
              icon: const Icon(Icons.feedback),
              tooltip: "Send us your ideas and feedback",
            ),
        ]),
        body: Column(
          children: const [
             Text("Coming soon")
          ],
        ),
    );
  }
}