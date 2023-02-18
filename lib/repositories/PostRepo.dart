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
  static const String _baseUrl = 'api.notion.com';

  final http.Client _client;

  PostRepo({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close(); //Always close HTTP clients after using them.
  }

  Future getPosts() async {
    try {
      final url = '${_baseUrl}databases/${dotenv.env['NOTION_DATABASE']}/query';
      final response = await _client.post(
        Uri.https(
            _baseUrl, '/v1/databases/${dotenv.env['NOTION_DATABASE']}/query'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer ${dotenv.env['NOTION_SECRET']}',
          'Notion-Version': '2022-02-22',
           'accept': 'application/json',
      'Content-Type': 'application/json-patch+json',
        },
      );
        if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        print(data);
        return (data);
      }
    } catch (_) {
      print(_.toString());
      print("ayoooo something went wrong");
    }
    return ({});
  }
}
