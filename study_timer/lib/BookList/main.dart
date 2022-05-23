import 'package:flutter/material.dart';
import 'package:hyflutter/screens/list_screen.dart';
import 'package:hyflutter/screens/detail_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List APP',
      //home: DetailScreen(),
      home: ListScreen(),
    );
  }
}

