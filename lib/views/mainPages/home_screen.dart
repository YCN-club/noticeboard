import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notice_board/viewmodels/post_view_model.dart';
import 'package:notice_board/views/mainPages/club_info_page.dart';
import '../components/notice_list.dart';
import '../components/drawer_view.dart';
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
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClubInfoPage()));
                    HapticFeedback.heavyImpact();
                  },
                  backgroundColor: Colors.white,
                  elevation: 0,
                  child:
                      const Image(image: AssetImage("images/cxLogoColor.png")),
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    controller.fetchPosts();
                    HapticFeedback.heavyImpact();
                  },
                  backgroundColor: Colors.white,
                  elevation: 0,
                  child: const Icon(
                    Icons.replay_outlined,
                    color: Colors.orange,
                  ),
                )),
          ],
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "MAHE Bangalore Notice Board",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: NoticeList(
          noticeArray: controller.posts.value,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: DrawerView(),
        ),
      );
    });
  }
}
