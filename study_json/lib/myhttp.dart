import 'package:flutter/material.dart';
import 'package:study_json/Post.dart';
import 'package:study_json/main.dart';

class MyHttp extends StatefulWidget {
  MyHttp({Key? key}) : super(key: key);

  @override
  _MyHttpState createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
  Future<List<Post>> postList = [] as Future<List<Post>>;

  @override
  void initState() {
    super.initState();
    postList = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '밀크티',
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
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Post post = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: Text(post.title),
                      ),
                    );
                  },

                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}