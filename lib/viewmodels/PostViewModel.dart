import 'dart:convert';

import 'package:get/get.dart';
import 'package:notice_board/models/Response.dart';
import 'package:notice_board/models/ResponsePost.dart';
import 'package:notice_board/repositories/PostRepo.dart';
class PostViewModel extends GetxController{
  final PostRepo _repo = PostRepo();
  final posts = List<ResponsePost>.empty().obs;
  
  Future fetchPosts()async{
    RawPostResponse rawPostResponse;
    const JsonDecoder decoder = JsonDecoder();
    var temp = await _repo.getPosts();
    if(temp.length>0){
    rawPostResponse =  RawPostResponse.fromJson(jsonDecode(temp));
    print(temp);
    posts.value = rawPostResponse.data;
  }
  }
  convertJsonMapToRawPostResponse(String rawJsonString){
    const JsonDecoder decoder = JsonDecoder();
    var rawJson = decoder.convert(rawJsonString);
    rawJson['data'].map((responsePost)=>{

    });
  }
}