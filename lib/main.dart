import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticeboard/controllers/contributors_controller.dart';
import 'package:noticeboard/controllers/post_controller.dart';
import 'package:noticeboard/views/mainPages/tab_navigator.dart';

void main(List<String> args) async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());
    final ContributorController contributorController =
        Get.put(ContributorController());
    postController.fetchPosts();
    contributorController.getContributors();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notice Board',
        theme: ThemeData(primarySwatch: primaryBlack, fontFamily: "Lufga"),
        home: const TabNavigator());
  }
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
