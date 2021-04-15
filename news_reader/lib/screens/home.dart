import 'package:flutter/material.dart';
import '../widgets/articleList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Reader'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'General',
              ),
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Entertainment',
              ),
              Tab(
                text: 'Health',
              ),
              Tab(
                text: 'Sports',
              ),
              Tab(
                text: 'Science',
              ),
              Tab(
                text: 'Technology',
              ),
            ],
            isScrollable: true,
            indicatorWeight: 2.5,
            physics: ClampingScrollPhysics(),
          ),
        ),
        body: TabBarView(
          children: [
            ArticleList('general'),
            ArticleList('business'),
            ArticleList('entertainment'),
            ArticleList('health'),
            ArticleList('sports'),
            ArticleList('science'),
            ArticleList('technology'),
          ],
        ),
      ),
    );
  }
}
