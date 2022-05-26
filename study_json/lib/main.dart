import 'package:flutter/material.dart';
import 'dart:convert';
import '/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: JSONTest(),
    );
  }
}

class JSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String json = '{"name": "하영","email": "hysong@example.com", "created_time": 123123123, "address":{"street":"온고을로", "city":"전주시"}}';

    Map<String, dynamic> userMap = jsonDecode(json);

    var user = User.fromJson(userMap);
    var jsonData = user.toJson();

    return Scaffold(
      body: Column(
        children: [
          Text(
            'name: ${user.name} \n email: ${user.email} \n created_time: ${user.createdTime} \n toJson: $jsonData'
            , textScaleFactor: 2,
          )
          ]
      ),
    );
  }
}