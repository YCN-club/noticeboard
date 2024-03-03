import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title,
      description,
      startDateTime,
      endDateTime,
      publishedAt,
      image;
  const PostCard(
      {super.key,
      required this.title,
      required this.description,
      required this.startDateTime,
      required this.endDateTime,
      required this.publishedAt,
      required this.image});

  @override
  Widget build(BuildContext context) {
    // DateTime sdt = DateTime.parse(startDateTime);
    // DateTime edt = DateTime.parse(endDateTime);
    return Card(
      elevation: 10.0,
      child: Column(children: [
        FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.jpeg', image: image),
        ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //     "Start date: ${sdt.day}/${sdt.month}/${sdt.year}  -  ${sdt.hour}:${sdt.minute}"),
            // Text(
            //     "End date: ${edt.day}/${edt.month}/${edt.year}  -  ${edt.hour}:${edt.minute}"),
          ],
        ),
      ]),
    );
  }
}
