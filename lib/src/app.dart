import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:noticeboard/controllers/contributors_controller.dart';
import 'package:noticeboard/controllers/post_controller.dart';
import 'package:noticeboard/views/tab_navigator.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());
    final ContributorController contributorController =
        Get.put(ContributorController());

    postController.fetchPosts();
    contributorController.getContributors();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notice Board',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
          ),
          useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const TabNavigator(),
    );
  }
}
