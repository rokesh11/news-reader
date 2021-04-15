import 'dart:convert';
import 'articleModel.dart';
import 'package:http/http.dart' as http;

class NewsData {
  List<ArticleModel> _articles = [];

  Future<List<ArticleModel>> getArticles(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=95a6b8ae9d314d45ba65e010c53942ba";
    var response = await http.get(url);

    var data = jsonDecode(response.body);
    print('status:  ' + data['status']);

    if (data['status'] == 'ok') {
      data['articles'].forEach((article) {
        if (article['title'] != null &&
            article['url'] != null &&
            article['urlToImage'] != null &&
            article['description'] != null &&
            article['content'] != null &&
            article['publishedAt'] != null &&
            article['author'] != null) {
          ArticleModel newArticle = ArticleModel(
            title: article['title'],
            author: article['author'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            description: article['description'],
            content: article['content'],
            publishedAt: article['publishedAt'],
          );
          _articles.add(newArticle);
        }
      });
    } else {
      print('Empty entries');
    }
    print('Empty entries ${_articles.length}');
    return _articles;
  }
}
