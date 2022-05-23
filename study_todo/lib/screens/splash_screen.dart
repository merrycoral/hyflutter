import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_todo/screens/list_screen.dart';
import 'package:study_todo/screens/login_screen.dart';
import 'package:study_todo/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] isLogin : " + isLogin.toString());
    return isLogin;
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      moveScreen();
    });
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
            (context) => ListScreen())
        );
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
            (context) => LoginScreen()));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SplashScreen', style: TextStyle(fontSize: 20)),
            Text('나만의 일정 관리 : TODO List App', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}