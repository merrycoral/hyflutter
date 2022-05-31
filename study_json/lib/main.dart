import 'package:flutter/material.dart';
import 'package:study_json/post.dart';
import 'package:study_json/myhttp.dart';
import 'dart:convert';
import '/user.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Future<List<Post>>? postList;
  Future<Post>? post;

  @override
  void initState() {
    super.initState();
    postList = fetchPost();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'studyHttpJson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP GET'),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: postList,
            builder: (context, snapshot){
              if(snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index){
                      Post post = snapshot.data[index];
                      return Card(
                        child: ListTile(
                          title: Text(post.title),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }
          ),
        ),
      )
      // MyHttp(),
      //home: JSONTest(),
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

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body);
    var postList = list.map((element) => Post.fromJson(element)).toList();
    return postList;
    //return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}