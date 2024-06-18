import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class MyDataPage2 extends StatefulWidget {
  @override
  _MyDataPage2State createState() => _MyDataPage2State();
}

class _MyDataPage2State extends State<MyDataPage2> {
  late WebViewController _controller;
  static const platform = MethodChannel('com.PrimeMotionSports/icloud');

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // 更新加载进度
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );

    _loadUrlFromICloud();
  }

  Future<void> _loadUrlFromICloud() async {
    try {
      final String url = await platform.invokeMethod('PrimeMotionSports');
      _controller.loadRequest(Uri.parse(url));
    } on PlatformException catch (e) {
      print("Failed to load URL from iCloud: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
