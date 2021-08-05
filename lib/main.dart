import 'package:flutter/material.dart';
import 'package:product_list/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.cyan),
      home: Home(),
    );
  }
}
