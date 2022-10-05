import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  static bool headline = false;
  static String headLinePath = "https://newsapi.org/v2/top-headlines";
  static String everyThingPath = "https://newsapi.org/v2/everything";
  static Map<String, String> header = {
    "x-api-key": "a9dff07c1bbe4be985081eace5123f05",
  };

  final List<Article> _articles = [];
  List<Article> get articles => _articles;

  bool _loading = true;
  bool get isLoading => _loading;
  set setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> getNews(String search) async {
    _articles.clear();
    Map<String, String> param = {"q": search};
    BaseOptions options = BaseOptions(
      headers: header,
      queryParameters: param,
    );
    Dio dio = Dio(options);

    setLoading = true;
    // headline = val;
    String path = everyThingPath;
    NewsModel? newsModel;
    try {
      Response userData = await dio.get(path);
      newsModel = NewsModel.fromJson(userData.data);
      int n = newsModel.articles.length;

      for (int i = 0; i < n; i++) {
        Article cur = newsModel.articles[i];
        if (cur.content != null && cur.urlToImage != null) {
          _articles.add(cur);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response);
        print(e.type);
      } else {
        // Error due to setting up or sending the request
        print('!!!!!!!!!!!!!!!!!!');
        print(e.message);
      }
    }
    setLoading = false;
  }
}
