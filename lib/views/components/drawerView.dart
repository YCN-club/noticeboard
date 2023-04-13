import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';
import 'package:notice_board/views/mainPages/ContributorsPage.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(
        scheme: "https",
        host: "www.docs.google.com",
        path:
            "/forms/d/e/1FAIpQLScV8JBTgLg9eWwk3OdepyzpQd1oXD64dLx2PrPKg37fGN3jfQ/viewform");
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("images/mitBuilding.jpeg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Text(
              //   "Kevin Thomas",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 25,
              //       fontWeight: FontWeight.w600),
              // ),
              // Text(
              //   "kevin1.mitblr2022@learner.manipal.edu",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          ),
        ),
        ListTile(
          leading: IconButton(
            onPressed: () {
              Get.to(ContributorsPage());
            },
            icon: const Icon(
              Icons.people,
              color: Colors.orange,
            ),
          ),
          title: const Text(
            "Contributors",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Get.to(ContributorsPage());
          },
        ),
        ListTile(
          leading: IconButton(
            onPressed: () => _launchURL(""),
            icon: const Icon(
              Icons.open_in_new,
              color: Colors.orange,
            ),
          ),
          title: const Text(
            "Feedback",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onTap: () => _launchURL(""),
        )
      ],
    );
  }
}
