import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/call_api.dart';

void main() async {
  var res = await CallAPI.getNews("");
  NewsModel? newsModel;
  if (res.statusCode == 200) {
    newsModel = newsModelFromJson(res.body);
    print(newsModel.articles.first.content);
  } else {
    throw "E R R O R";
  }

  // runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
