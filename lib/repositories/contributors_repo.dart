import 'package:http/http.dart';
import 'package:notice_board/models/contributor.dart';

class ContributorsRepo {
  Future getApiData() async {
    var url = Uri.parse(
        "https://api.github.com/repos/CodeX-MIT-BLR/NoticeBoard/contributors");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final List<Contributor> contributors =
          contributorFromJson(response.body.toString());
      return contributors;
    }
  }
}
