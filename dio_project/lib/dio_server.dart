import 'package:dio/dio.dart';
import 'dart:convert';

const _API_PREFIX = "https://jsonplaceholder.typicode.com/posts";

class Server {
  Future<void> getReq() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX/1");
    print(response.data.toString());
  }

  Future<void> postReq() async {
    Response response;
    Dio dio = new Dio();
    Map<String, dynamic> data = {"id": 12, "name": "vidtorianoch"};
    data.putIfAbsent("userId", () => 189);
    response = await dio.post(_API_PREFIX, data : data );
    print(response.data.toString());
  }

  Future<void> getReqWzQuery() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(_API_PREFIX, queryParameters: {
      "userId": 1,
    });
    //Map<String, dynamic> asdf = jsonDecode(response.data);

    String jsonString = response.data.toString();
    print(response.data.toString());

    //Map<String, dynamic> user = jsonDecode(jsonString);

    //print('안녕하세요, ${user['name']}님!');
    //print('${user['email']}으로 인증 링크를 보냈습니다.');
    //print('${asdf}');
    //print(response.data);
    //print(jsonDecode(response.data));
  }
}

Server server = Server();