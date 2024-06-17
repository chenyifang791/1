import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'HomePage.dart'; // 假设 HomePage.dart 包含了 HomePage、AIPage 和 SettingsPage 类
import 'chat_screen.dart';
import 'UserCenterPage.dart';
import 'MainPage.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
