import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/articleModel.dart';
import '../screens/fullArticle.dart';

class Article extends StatelessWidget {
  final ArticleModel _articleModel;

  const Article(this._articleModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FullArticle(_articleModel.url);
        }));
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: _articleModel.urlToImage,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _articleModel.title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _articleModel.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _articleModel.author == null
                    ? 'Author: Unknown'
                    : 'Author: ${_articleModel.author}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _articleModel.publishedAt == null
                    ? ''
                    : 'Published At: ${(_articleModel.publishedAt).substring(0, 10)}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
