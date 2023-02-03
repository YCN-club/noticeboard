import 'dart:convert';

import 'package:get/get.dart';
import 'package:notice_board/repositories/PostRepo.dart';
class PostViewModel extends GetxController{
  final PostRepo _repo = PostRepo();

  final posts = {}.obs;
  Future fetchPosts()async{
    const JsonDecoder decoder = JsonDecoder();
    var temp = await _repo.getPosts();
    if(temp.length>0){
    posts.value = decoder.convert(temp);
  }
  }
}