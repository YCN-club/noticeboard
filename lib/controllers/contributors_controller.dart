import 'package:get/get.dart';

import 'package:noticeboard/models/contributor.dart';
import 'package:noticeboard/repositories/contributors_repo.dart';

class ContributorController extends GetxController {
  final ContributorsRepo _repo = ContributorsRepo();
  final contributors = <Contributor>[].obs;
  Future getContributors() async {
    var temp = await _repo.getApiData();
    if (temp != null) {
      contributors.value = temp;
    }
  }
}
