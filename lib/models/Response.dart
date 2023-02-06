import 'package:notice_board/models/Post.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:notice_board/models/ResponsePost.dart';
part 'Response.g.dart';


@JsonSerializable(explicitToJson: true)

class RawPostResponse{
  final List<ResponsePost> data;
  final meta;

  RawPostResponse(this.data, this.meta);
  
 factory RawPostResponse.fromJson(Map<String, dynamic> json) => _$RawPostResponseFromJson(json);
 Map<String, dynamic> toJson() => _$RawPostResponseToJson(this);
}


