import 'package:http/http.dart' as http;

class CallAPI {
  static const apiKEY = "a9dff07c1bbe4be985081eace5123f05";
  static var client = http.Client();
  static Future<http.Response> getNews(String cat) async {
    String baseUrl =
        "https://newsapi.org/v2/everything?q=tech&apiKey=a9dff07c1bbe4be985081eace5123f05";
    var url = Uri.parse(baseUrl);
    return await http.get(url);
  }
}
