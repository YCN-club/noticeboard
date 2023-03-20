import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:notice_board/models/Post.dart';

class PostRepo {
  // final client = http.Client();

  // void dispose() {
  //   client.close();
  // }

  // Future getPosts() async {
  //   print("ayooooo I am being executed!!");
  //   print(dotenv.env['NOTION_SECRET']);
  //   print(dotenv.env['NOTION_DATABASE']);

  //   try {
  //     var response = await client.post(
  //       Uri.parse(
  //           "https://api.notion.com/v1/databases/8948c02582004ea9812c3d3a2b9e9f75/query"),
  //       body: {},
  //       headers: {
  //         HttpHeaders.authorizationHeader:
  //         'Bearer secret_51f5fI2gUAgi67wWARVv4rHNmDh8djOCNAeoAslEWFd',
  //         'Notion-Version':'2022-06-28'
  //       }
  //     );
  //     var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //     var uri = Uri.parse(decodedResponse['uri'] as String);
  //     print(await client.get(uri));
  //   } finally {
  //     dispose();
  //   }

  //   return {"name": "your mum"};
  // }
  static const String _baseUrl = 'https://api.notion.com/v1/';

  final _client = http.Client();

  void dispose() {
    _client.close(); //Always close HTTP clients after using them.
  }

  Future<List<Post>> getPosts() async {
    try {
      var url = '${_baseUrl}databases/${dotenv.env['NOTION_DATABASE']}/query';
      var response = await _client.post(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env['NOTION_SECRET']}',
        'Notion-Version': '2022-02-22',
        'accept': 'application/json',
        'Content-Type': 'application/json',
      }, body: jsonEncode({
        "filter": {
          "property": "published",
          "checkbox": {"equals": true}
        }
      }));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => Post.fromMap(e)).toList();
      }
    } catch (_) {
      print(_.toString());
      print("ayoooo something went wrong");
    }
    return [
      const Post(
          title: "",
          shortDescription: "",
          longDescription: "",
          startDateTime: "",
          endDateTime: "",
          uid: "",
          createdAt: "",
          updatedAt: "",
          Image: "")
    ];
  }
}
