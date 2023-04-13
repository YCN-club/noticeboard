import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/PostViewModel.dart';
import 'package:notice_board/views/mainPages/ClubInfoPage.dart';
import 'package:notice_board/views/mainPages/settingsScreen.dart';
import '../../models/notice.dart';
import '../components/noticeList.dart';
import '../components/drawerView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Notice> noticeArray = [
    Notice(
      "Welcome to Manipal Notice Board",
      "This is your one stop for all notice related items",
      DateTime.now(),
      true,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      true,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      false,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      false,
      const Image(
          image: NetworkImage(
              "https://img.freepik.com/free-photo/final-exam-results-test-reading-books-words-concept_53876-123721.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      false,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      false,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
      "Exam Timetable Announcement",
      "Please find attached the timetable for your 2nd In semester examinations",
      DateTime.now(),
      false,
      const Image(
          image: NetworkImage(
              "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg")),
    ),
    Notice(
        "Exam Timetable Announcement",
        "Please find attached the timetable for your 2nd In semester examinations",
        DateTime.now(),
        false,
        const Image(
            image: NetworkImage(
                "https://manipal.edu/content/dam/manipal/mu/imagesnew/Campuslife/1440%20x%20800px%20.jpg"))),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<PostViewModel>(builder: (controller) {
      return Scaffold(
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClubInfoPage()));
                  },
                  backgroundColor: Colors.white,
                  child: Image(image: AssetImage("images/cxLogoColor.png")),
                  elevation: 0,
                )),
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    controller.fetchPosts();
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.replay_outlined,
                    color: Colors.orange,
                  ),
                  elevation: 0,
                )),
          ],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Text(
            "MAHE Bangalore Notice Board",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              color: Colors.black,
            )
          ],
        ),
        body: NoticeList(controller.posts.value),
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: DrawerView(),
        ),
      );
    });
  }
}
