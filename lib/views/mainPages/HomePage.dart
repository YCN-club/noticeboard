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
          floatingActionButton: Wrap(
            //will break to another line on overflow
            direction: Axis.horizontal, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      //action code for button 1
                    },
                    child: Icon(Icons.add),
                  )), //button first

              Container(
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      //action code for button 2
                    },
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Icon(Icons.add),
                  )), // button second

              Container(
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      //action code for button 3
                    },
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.add),
                  )), // button third

              // Add more buttons here
            ],
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
                onPressed: () => {Get.to(ContributorsPage())},
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
                                  itemCount: controller.posts.value.result.isNotEmpty
                                      ? controller.posts.value.result.length
                                      : 0,
                                  itemBuilder: ((context, index) {
                                    var currentData = controller.posts.value.result[index];
                                    return PostCard(
                                      title: currentData.title,
                                      description: currentData.shortDescription,
                                      startDateTime: currentData.startTime.toIso8601String(),
                                      endDateTime: currentData.endTime.toIso8601String(),
                                      publishedAt: currentData.publishedAt.toIso8601String(),
                                      image: currentData.imageUrl,
                                    ); 
                                  }))))
                    ])
              ],
            ),
          ));
    });
  }
}
