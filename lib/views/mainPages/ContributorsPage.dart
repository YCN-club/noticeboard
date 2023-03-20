import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:notice_board/views/components/contributorsList.dart';
import 'package:notice_board/views/mainPages/FeedbackPage.dart';
import 'package:notice_board/views/mainPages/contributors.dart';

class contributorsPage extends StatelessWidget {
  const contributorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meet the team"),
      ),
      body: Contributors(),
    );
  }
}
