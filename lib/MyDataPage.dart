import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'MyDataPage2.dart';

class MyDataPage extends StatefulWidget {
  @override
  _MyDataPageState createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  bool _isConnected = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        Duration(seconds: 1), (timer) => _checkConnectivityAndNavigate());
  }

  Future<void> _checkConnectivityAndNavigate() async {
    try {
      final result = await InternetAddress.lookup('www.apple.com');
      setState(() {
        _isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      });

      if (_isConnected) {
        _timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyDataPage2()),
        );
      }
    } on SocketException catch (_) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0000FF), // 深蓝色
                Color(0xFF87CEEB), // 浅蓝色
              ],
            ),
          ),
          child: Center(
            child: _isConnected
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', width: 150),
                      SizedBox(height: 30),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 6.0,
                      ),
                      SizedBox(height: 20),
                      Text(
                        '连接中，请稍候...\n如果长时间没有加载可以尝试重启app',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wifi_off, size: 80, color: Colors.white),
                      SizedBox(height: 20),
                      Text(
                        '没有网络，请检查设置。',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 6.0,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
