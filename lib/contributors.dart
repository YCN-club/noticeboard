import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:notice_board/contributorObject.dart';
import 'package:url_launcher/url_launcher.dart';

class Contributors extends StatelessWidget {
  Contributors({super.key});

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
            "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80"),
        height: 100,
      ),
      "scenario7",
      "www.google.com",
    ),
    Contributor(
      const Image(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80"),
          height: 100),
      "scenario7",
      "www.google.com",
    ),
    Contributor(
      const Image(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80"),
          height: 100),
      "scenario7",
      "www.google.com",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: GridView.count(
        crossAxisCount: 2,
        children: contributors.map((ct) {
          return Card(
            child: Column(children: [
              ClipOval(
                child: ct.pfp,
              ),
              Text(ct.username),
              ElevatedButton(
                  onPressed: () {
                    _launchURL(ct.profileLink);
                  },
                  child: const Text("Profile"))
            ]),
          );
        }).toList(),
      )),
    );
  }
}
