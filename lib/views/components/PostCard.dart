import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostCard extends StatelessWidget {
  final String title, description, startDateTime, endDateTime, publishedAt, image;
  const PostCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.startDateTime,
      required this.endDateTime,
      required this.publishedAt,
      required this.image
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime sdt = DateTime.parse(startDateTime);
    // DateTime edt = DateTime.parse(endDateTime);
    return Card(      
      elevation: 10.0,
      child: Column(children: [

        image!=null? Image.network(image): Image.network(""),
       ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
        Row(
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
