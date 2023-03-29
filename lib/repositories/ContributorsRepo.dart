import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:notice_board/views/components/contributorsList.dart';
import 'package:notice_board/views/mainPages/FeedbackPage.dart';
import 'package:notice_board/models/contributorObject.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class ContributorsRepo{
   Future getApiData() async {
    var url = Uri.parse(
        "https://api.github.com/repos/CodeX-MIT-BLR/NoticeBoard/contributors");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // final List<Contributor> contributors = List<Contributor>.from(data);
      // print(contributors[1]);
      final List<Contributor> contributors =
          contributorFromJson(response.body.toString());
      return contributors;
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

}