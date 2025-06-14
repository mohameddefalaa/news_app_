import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class Webviewscreen extends StatelessWidget {
  const Webviewscreen({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Webview(url: url),
    );
  }
}
