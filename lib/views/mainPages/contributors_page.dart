import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/contributors_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContributorsPage extends StatelessWidget {
  const ContributorsPage({super.key});

  _launchURLGithub(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ContributorsViewModel>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Behind the Scenes",
              style: TextStyle(color: Colors.black),
            ),
            leading: const BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: ListView.builder(
            itemCount: controller.contributors.isNotEmpty
                ? controller.contributors.length
                : 0,
            itemBuilder: ((context, index) {
              var currentData = controller.contributors[index];
              return ListTile(
                trailing: ElevatedButton.icon(
                  onPressed: () {
                    _launchURLGithub(currentData.htmlUrl);
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("GitHub"),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(currentData.avatarUrl),
                ),
                title: Text(
                  currentData.login,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                    "${currentData.contributions.toString()} contributions",
                    style: const TextStyle(color: Colors.grey)),
              );
            }),
          ));
    });
  }
}
