import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/PostViewModel.dart';
import 'package:notice_board/views/mainPages/HomePage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: ".env");
  runApp(const GetMaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostViewModel controller = Get.put(PostViewModel());
    controller.fetchPosts();
    return const SafeArea(child: HomePage());
  }
}
