import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/contributors_view_model.dart';
import 'package:notice_board/viewmodels/post_view_model.dart';
import 'package:notice_board/views/mainPages/tab_navigator.dart';

void main(List<String> args) async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostViewModel controller = Get.put(PostViewModel());
    final ContributorsViewModel controller2 = Get.put(ContributorsViewModel());
    controller.fetchPosts();
    controller2.getContributors();
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
