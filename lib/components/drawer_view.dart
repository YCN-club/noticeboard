import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:noticeboard/views/contributors_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: 'www.docs.google.com',
        path:
            '/forms/d/e/1FAIpQLScV8JBTgLg9eWwk3OdepyzpQd1oXD64dLx2PrPKg37fGN3jfQ/viewform');
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Can not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/mitBuilding.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken))),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
        ListTile(
          leading: IconButton(
            onPressed: () {
              Get.to(const ContributorsPage());
            },
            icon: const Icon(
              Icons.people,
              color: Colors.orange,
            ),
          ),
          title: const Text(
            'Contributors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onTap: () {
            Get.to(const ContributorsPage());
          },
        ),
        ListTile(
          leading: IconButton(
            onPressed: () => _launchURL(''),
            icon: const Icon(
              Icons.open_in_new,
              color: Colors.orange,
            ),
          ),
          title: const Text(
            'Feedback',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onTap: () => _launchURL(''),
        ),
        const SizedBox(
          height: 50,
        ),
        const Column(
          children: [
            Text(
              'Brought to you by mitblr.club',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
