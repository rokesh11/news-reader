import 'package:flutter/material.dart';
import '../widgets/article.dart';
import '../helper/newsData.dart';
import '../helper/articleModel.dart';

class ArticleList extends StatefulWidget {
  final String category;

  const ArticleList(this.category);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  NewsData _newsData = NewsData();

  Future<List<ArticleModel>> getCategoryArticles(String category) async {
    return await _newsData.getArticles(category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: getCategoryArticles(widget.category),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                return Article(snapshot.data[index]);
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
