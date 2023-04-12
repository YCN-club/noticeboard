import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notice_board/models/Post.dart';
import 'package:notice_board/models/notice.dart';
import 'package:intl/intl.dart';

class InfoScreen extends StatelessWidget {
  Result infoNotice;

  InfoScreen(this.infoNotice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(infoNotice.imageUrl),
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          infoNotice.title,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   DateFormat.yMMMd().format(infoNotice.date),
                        //   style: const TextStyle(
                        //       color: Colors.grey,
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.w600,
                        //       letterSpacing: -1),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          infoNotice.longDescription,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
