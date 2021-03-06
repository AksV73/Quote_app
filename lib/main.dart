
import 'package:flutter/material.dart';

import 'package:quote_app/quotescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Random Quote',
      home: MainPage(),
    );
  }
}