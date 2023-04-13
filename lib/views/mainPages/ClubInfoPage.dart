import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:notice_board/models/Department.dart';

class ClubInfoPage extends StatelessWidget {
  ClubInfoPage({super.key});

  _launchURLGithub(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  final departments = [
    Department("App Development", "Kevin Thomas"),
    Department("Open Source", "Chandan CV & Astitva Agarwal"),
    Department(
        "Game Development", "Deepro Chakravorty, Aryan D & Arnav Upadhyay"),
    Department("Competitive Programming", "Mayukh Saha & Ojas Joshi"),
    Department("Software Development", "Abhigyan Tripathi"),
    Department("Information Technology", "Raghav Gupta"),
    Department("Research & Development", "Ayraf"),
    Department("Social Media", "Vaishnavi D & Nakul Kamath"),
    Department("Creative", "Amritanshu Kumar"),
  ];

  final socialLinks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About CodeX",
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                image: AssetImage("images/cxLogoColor.png"),
                height: 100,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    _launchURLGithub(
                        "https://linktr.ee/CodeXmitb?fbclid=PAAaZRlBJzUdmpJyvdMh1NPFzyOmcS04tHldmILCHpRk0tX5QmEdPv_TdG_T8");
                  },
                  icon: Icon(Icons.link),
                  label: Text("Social Media")),
              SizedBox(
                height: 20,
              ),
              const Text(
                "This app was made by the CodeX App Development and CodeX Open Source departments at MIT-Bengaluru. CodeX is the premier technical club at MIT and we encourage all our members to learn and contribute to projects by showing their creativity through code.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                child: Text(
                  "Our Departments",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: departments.map((department) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(department.name),
                            Text(
                              department.head,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ]),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
