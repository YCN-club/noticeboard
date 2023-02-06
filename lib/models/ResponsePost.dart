import 'package:notice_board/models/Post.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ResponsePost.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponsePost{
  final int id;
  final Post attributes;

  ResponsePost(this.id, this.attributes);
 factory ResponsePost.fromJson(Map<String, dynamic> json) => _$ResponsePostFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostToJson(this);
}