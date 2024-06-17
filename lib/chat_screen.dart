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

  @override
  void dispose() {
    // Cancel any pending messages if the screen is disposed while waiting for a response
    if (_isSending) {
      // Implement cancellation logic if your API supports it
    }
    _controller.dispose();
    super.dispose();
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
    if (!mounted) return;
    setState(() {
      _messages.add({'role': 'assistant', 'content': response});
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00008B), Color(0xFF87CEEB)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
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
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isUser)
                        CircleAvatar(
                          child: Icon(Icons.all_inbox, color: Colors.white),
                          backgroundColor: Colors.grey,
                        ),
                      SizedBox(width: 8.0),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
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
                    Text(
                      "Sending...",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  16, 0, 16, 75), // Adjust bottom padding height
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
      ),
    );
  }
}
