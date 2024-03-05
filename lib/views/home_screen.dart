import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:noticeboard/components/notice_list.dart';
import 'package:noticeboard/controllers/post_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<PostController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: Container(
            margin: const EdgeInsets.all(10),
            child: FloatingActionButton(
              onPressed: () {
                controller.fetchPosts();
                HapticFeedback.heavyImpact();
              },
              backgroundColor: Colors.white,
              elevation: 0,
              child: const Icon(
                Icons.replay_outlined,
                color: Colors.orange,
              ),
            )),
        body: NoticeList(
          noticeArray: controller.posts.value,
        ),
      );
    });
  }
}
