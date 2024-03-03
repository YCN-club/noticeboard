import 'package:http/http.dart' as http;
import 'package:noticeboard/models/post.dart';

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

  final _client = http.Client();

  void dispose() {
    _client.close(); //Always close HTTP clients after using them.
  }

  Future<Posts> getPosts() async {
    try {
      var url =
          'https://77w5symg.api.sanity.io/v2021-10-21/data/query/production?query=*%5BPublished%20%3D%3D%20true%5D%7C%20order(order%20asc)%7B%0A...%2C%0A%20%20%22ImageUrl%22%3A%20mainImage.asset%20-%3E%20url%0A%20%20%0A%7D';
      var response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return postsFromJson(response.body);
      }
    } catch (_) {
      print(_.toString());
    }
    return Posts(ms: 0, query: "", result: []);
  }
}
