import 'package:flutter/material.dart';

import 'package:noticeboard/src/notices/models/result_model.dart';

class InfoScreen extends StatelessWidget {
  final ResultModel infoNotice;

  InfoScreen({super.key, required this.infoNotice});

  final tagsList = ['Solstice Fest', 'Events', 'News', 'Student Council'];

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Published on ${infoNotice.date.day}/${infoNotice.date.month}/${infoNotice.date.year}',
                  style: const TextStyle(
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
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'TAGS',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: infoNotice.tags.map((tag) {
                      return SizedBox(
                        child: Card(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
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
