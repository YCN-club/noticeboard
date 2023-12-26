import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/PostViewModel.dart';
import 'package:notice_board/views/mainPages/ClubInfoPage.dart';
import '../components/noticeList.dart';
import '../components/drawerView.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<PostViewModel>(builder: (controller) {
      return Scaffold(
        floatingActionButton: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClubInfoPage()));
                    HapticFeedback.heavyImpact();
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
                    HapticFeedback.heavyImpact();
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
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const SettingsScreen(),
          //         ),
          //       );
          //     },
          //     icon: const Icon(Icons.settings),
          //     color: Colors.black,
          //   )
          // ],
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
