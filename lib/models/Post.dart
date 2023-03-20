import 'package:json_annotation/json_annotation.dart';

class Post {
  final String title;
  final String shortDescription;
  final String longDescription;
  final String startDateTime;
  final String endDateTime;
  final String uid;
  final String createdAt;
  final String updatedAt;
  final String Image;
  const Post(
      {required this.title,
      required this.shortDescription,
      required this.longDescription,
      required this.startDateTime,
      required this.endDateTime,
      required this.uid,
      required this.createdAt,
      required this.updatedAt,
      required this.Image});

  factory Post.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return Post(
      title: properties['Title']?['title']?[0]?['text']?['content'],
      shortDescription: properties['shortDescription']?['rich_text']?[0]
          ?['text']?['content'],
      longDescription: properties['longDescription']?['rich_text']?[0]?['text']
          ?['content'],
      Image: properties['Image']?['files']?[0]?['file']?['url'],
      startDateTime: properties['dateTime']?['date']?['start'],
      endDateTime: properties['dateTime']?['date']?['end'],
      createdAt: map['created_time'],
      updatedAt: map['last_edited_time'],
      uid: map['id']
    );
  }
}
