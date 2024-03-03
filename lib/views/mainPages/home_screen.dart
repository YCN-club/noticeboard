import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noticeboard/controllers/post_controller.dart';
import 'package:noticeboard/views/components/drawer_view.dart';
import 'package:noticeboard/views/components/notice_list.dart';

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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'noticeboard.',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: NoticeList(
          noticeArray: controller.posts.value,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: DrawerView(),
        ),
      );
    });
  }
}
