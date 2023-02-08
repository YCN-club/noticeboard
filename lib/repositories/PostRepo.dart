import 'package:http/http.dart' as http;
class PostRepo{
  Future getPosts()async{
    
    const headers = {
  'Content-Type':'application/json',
  'Accept': 'application/json'
};

var response = await http.get( Uri.parse('http://localhost:1337/api/posts?populate=*'),
  headers: headers
);
return response.body;
  }
}