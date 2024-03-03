import 'package:http/http.dart';
import 'package:noticeboard/models/contributor.dart';

class ContributorsRepo {
  Future getApiData() async {
    var url = Uri.parse(
        'https://api.github.com/repos/mitblr-club/noticeboard/contributors');
    Response response = await get(url);
    if (response.statusCode == 200) {
      final List<Contributor> contributors =
          contributorFromJson(response.body.toString());
      return contributors;
    }
  }
}
