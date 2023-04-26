import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notice_board/models/Post.dart';
import 'package:notice_board/models/notice.dart';
import 'package:intl/intl.dart';

class InfoScreen extends StatelessWidget {
  Result infoNotice;

  InfoScreen(this.infoNotice);

  final tagsList = ["Solstice Fest", "Events", "News", "Student Council"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  infoNotice.title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Published on 12th April, 2023",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                infoNotice.imageUrl,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "TAGS",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tagsList.map((tag) {
                      return SizedBox(
                        child: Card(
                          color: Colors.orange,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              tag,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
