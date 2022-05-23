import 'package:flutter/material.dart';
import 'package:study_todo/screens/list_screen.dart';
import 'package:study_todo/screens/login_screen.dart';
import 'package:study_todo/screens/splash_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timer APP',
      //home: DetailScreen(),
      home: SplashScreen(),
    );
  }
}

