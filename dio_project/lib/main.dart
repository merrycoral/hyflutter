import 'package:dio_project/dio_server.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            color: Colors.orangeAccent,
            onPressed: () {
              server.getReq();
            },
            child: Text("GET")
          ),
          FlatButton(
            color: Colors.orangeAccent,
            onPressed: () {
              server.postReq();
            },
            child: Text("POST"),
          ),
          FlatButton(
            color: Colors.orangeAccent,
            onPressed: () {
              server.getReqWzQuery();
            },
            child: Text("GET WITH QUERY")
          ),
        ],
      ),
    );
  }
}