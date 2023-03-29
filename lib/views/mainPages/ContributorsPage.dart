import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/ContributorsViewModel.dart';

class ContributorsPage extends StatelessWidget {
  ContributorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ContributorsViewModel>(builder: (controller){
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text("Meet the Team")),
        body: ListView.builder(
          itemCount: controller.contributors.isNotEmpty
              ? controller.contributors.length
              : 0,
          itemBuilder: ((context, index) {
            var currentData = controller.contributors[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(currentData.avatarUrl),
              ),
              title: Text(currentData.login, style: const TextStyle(color: Colors.white),),
              subtitle: Text(currentData.contributions.toString(), style: const TextStyle(color: Colors.white)),
              );
          }),
        )
      );
    }
    );
    }
}
