// lib/screens/list_screen.dart
import 'package:flutter/material.dart';
import 'package:hyflutter/screens/detail_screen.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서 목록 앱'),
      ),
      body: ListView(
        children: [
          BookTile(
            title: 'Node.js 프로젝트 투입 일주일 전',
            subtitle: '부제목1',
            description: '양파맛쿠키',
            image: 'https://img1.daumcdn.net/thumb/R750x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdJrbNH%2FbtroZFxQiId%2FvbNwWAebTWxwmKs1Ye76QK%2Fimg.png',
          ),
          BookTile(
            title: '제목머쓰지',
            subtitle: '부제목2',
            description: '랄랄라',
            image: 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTtC2F%2FbtroDslQlu7%2FLtLdUbAlrKaEOUIBNT6sU1%2Fimg.png',
          ),
          BookTile(
            title: 'Vue.js 프로젝트 투입 일주일 전',
            subtitle: '부제목3',
            description: 'abcdefu',
            image: 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb34jpw%2FbtroVjCpojy%2FQsACRNLSsK8a9lISlPtIUK%2Fimg.png',
          ),
          BookTile(
            title: 'React.js 프로젝트 투입 일주일 전',
            subtitle: '부제목4',
            description: 'asdfw',
            image: 'https://img1.daumcdn.net/thumb/R750x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdJrbNH%2FbtroZFxQiId%2FvbNwWAebTWxwmKs1Ye76QK%2Fimg.png',
          ),
        ],
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  BookTile({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });
  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(title),
      leading: Image.network(image),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                subtitle: subtitle,
                description: description,
                image: image,
              ),
          ),
        );
      },
    );
  }

}