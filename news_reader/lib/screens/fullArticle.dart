import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticle extends StatefulWidget {
  final String url;

  const FullArticle(this.url);

  @override
  _FullArticleState createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Reader'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
