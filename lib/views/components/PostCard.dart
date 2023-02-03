import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title,description,startDateTime, endDateTime, publishedAt;
  const PostCard({Key? key, required this.title, required this.description, required this.startDateTime, required this.endDateTime, required this.publishedAt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(title),
        Text(description),
        Text(startDateTime),
        Text(endDateTime),
      ]),
    );
  }
}