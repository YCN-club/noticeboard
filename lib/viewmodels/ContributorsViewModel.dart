
import 'package:get/get.dart';
import 'package:notice_board/models/contributorObject.dart';
import 'package:notice_board/repositories/ContributorsRepo.dart';

class ContributorsViewModel extends GetxController{
final ContributorsRepo _repo = ContributorsRepo();
final contributors = <Contributor>[].obs;
Future getContributors() async
{
  var temp = await _repo.getApiData();
  if(temp.length>0){
    contributors.value = temp;
  }
}
}