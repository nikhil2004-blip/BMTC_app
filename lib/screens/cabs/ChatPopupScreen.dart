import 'package:flutter/material.dart';
class ChatPopupScreen extends StatefulWidget {
  final String driverName;

  ChatPopupScreen({required this.driverName});

  @override
  _ChatPopupScreenState createState() => _ChatPopupScreenState();
}

class _ChatPopupScreenState extends State<ChatPopupScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final List<String> _driverReplies = [
    'I am on my way and will reach at your location shortly',
    'I will arrive in 10 minutes',
    'Traffic is heavy, but I am moving as fast as I can',
    'I am currently stuck in traffic, will update you soon',
    'I am close, expect me in 5 minutes',
    'I have just left and will be there shortly'
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add("You: ${_messageController.text}");
        _messageController.clear();
      });

      // Choose a random driver reply after a delay
      Future.delayed(Duration(seconds: 1), () {
        final randomReply = (_driverReplies..shuffle()).first;
        setState(() {
          _messages.add("Driver: $randomReply");
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 400,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chat with ${widget.driverName}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _messages.map((message) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Align(
                    alignment: message.startsWith("You:") ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: message.startsWith("You:") ? Colors.blue[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(message),
                    ),
                  ),
                )).toList(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}