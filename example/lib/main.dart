import 'package:example/ui/home/list_web_view.dart';
import 'package:flutter/material.dart';

// import 'ui/home/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Web View',
      theme: ThemeData.light(),
      home: ListWebView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
