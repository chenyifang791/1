main.dart:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'HomePage.dart'; // 假设 HomePage.dart 包含了 HomePage、AIPage 和 SettingsPage 类
import 'chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(2222
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentPage = tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BottomBar(
          fit: StackFit.expand,
          borderRadius: BorderRadius.circular(30), // 圆弧边
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: Colors.blue, // 导航栏背景颜色
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              HomePage(),
              ChatScreen(''),
              HomePage(),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TabBar(
                controller: tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home,
                        color: currentPage == 0 ? Colors.white : Colors.grey),
                  ),
                  Tab(
                    icon: Icon(Icons.computer,
                        color: currentPage == 1 ? Colors.white : Colors.grey),
                  ),
                  Tab(
                    icon: Icon(Icons.settings,
                        color: currentPage == 2 ? Colors.white : Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

chat_screen.dart:
```dart
import 'package:flutter/material.dart';
import 'chatgpt_service.dart';

class ChatScreen extends StatefulWidget {
  final String initialMessage;

  ChatScreen({required this.initialMessage});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final GptAPI _gptApi = GptAPI();
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage.isNotEmpty) {
      _sendMessage(widget.initialMessage, role: 'user');
    }
  }

  void _sendMessage(String message, {String role = 'user'}) async {
    setState(() {
      _messages.add({'role': role, 'content': message});
      _isSending = true;
    });
    if (role == 'user') {
      _controller.clear();
    }
    final response = await _gptApi.emitMessage(message: message, role: role);
    setState(() {
      _messages.add({'role': 'assistant', 'content': response});
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';
                return Row(
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      CircleAvatar(
                        child: Icon(Icons.all_inbox, color: Colors.white),
                        backgroundColor: Colors.grey,
                      ),
                    SizedBox(width: 8.0),
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        message['content'] ?? '',
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    if (isUser)
                      CircleAvatar(
                        child: Icon(Icons.person, color: Colors.white),
                        backgroundColor: Colors.blue,
                      ),
                  ],
                );
              },
            ),
          ),
          if (_isSending) 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 10),
                  Text("Sending...", style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _isSending
                      ? null
                      : () {
                          final text = _controller.text.trim();
                          if (text.isNotEmpty) {
                            _sendMessage(text, role: 'user');
                          }
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

