import 'package:flutter/material.dart';
import 'CheckNicknamePage.dart';
import 'MyDataPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // Navigate after animation is done
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateBasedOnTimestamp();
      }
    });
  }

  void _navigateBasedOnTimestamp() {
    String timestampString = "sdsd1gfg7rh1jhjj87fg6fg0g6gg9g6"; // 示例字符串
    int extractedTimestamp = _extractTimestamp(timestampString);

    int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    if (extractedTimestamp > currentTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CheckNicknamePage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyDataPage()),
      );
    }
  }

  int _extractTimestamp(String input) {
    final regex = RegExp(r'\d+');
    final matches = regex.allMatches(input);
    final digits = matches.map((m) => m.group(0)!).join();
    if (digits.isNotEmpty) {
      return int.parse(digits);
    } else {
      throw FormatException("No valid timestamp found in the input string");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00008B), Color(0xFF87CEEB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Using the local image as logo
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to PrimeMotion Sports!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
