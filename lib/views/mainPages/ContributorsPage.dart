import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:notice_board/views/components/contributorsList.dart';
import 'package:notice_board/views/mainPages/FeedbackPage.dart';
import 'package:notice_board/views/mainPages/contributors.dart';
import 'package:notice_board/models/contributorObject.dart';
import 'package:url_launcher/url_launcher.dart';

class contributorsPage extends StatelessWidget {
  contributorsPage({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  final List<Contributor> contributors = [
    Contributor(
      const Image(
        image: NetworkImage(
            "https://avatars.githubusercontent.com/u/77824686?v=4"),
        height: 70,
      ),
      "scenario7",
      "www.google.com",
    ),
    Contributor(
      const Image(
          image: NetworkImage(
              "https://avatars.githubusercontent.com/u/77824686?v=4"),
          height: 70),
      "scenario7",
      "www.google.com",
    ),
    Contributor(
      const Image(
          image: NetworkImage(
              "https://avatars.githubusercontent.com/u/77824686?v=4"),
          height: 70),
      "scenario7",
      "www.google.com",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Meet the Team")),
      body: GridView.count(
        padding: EdgeInsets.all(5),
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
        children: contributors.map((ct) {
          return Card(
            elevation: 0,
            color: Colors.grey.withOpacity(0.5),
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ClipOval(
                  child: ct.pfp,
                ),
                SizedBox(height: 10),
                Text(
                  ct.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      _launchURL(ct.profileLink);
                    },
                    child: const Text("Profile"))
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
