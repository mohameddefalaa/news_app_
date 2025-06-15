import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class Webviewscreen extends StatelessWidget {
  const Webviewscreen({super.key, required this.url, required this.title});
  final String url;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: Webview(url: url),
    );
  }
}
