import 'package:json_annotation/json_annotation.dart';
part 'Post.g.dart';

@JsonSerializable()
class Post{
  final String title;
  final String description;
  final String startDateTime;
  final String endDateTime;
  final String uid;
  final String CMemail;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  Post(this.title, this.description, this.startDateTime, this.endDateTime, this.uid, this.CMemail, this.createdAt, this.updatedAt, this.publishedAt);
 factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
 Map<String, dynamic> toJson() => _$PostToJson(this);

}