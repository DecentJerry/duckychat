import 'package:flutter/material.dart';

// class IndividualChatScreen extends StatefulWidget {
//   final String name;

//   IndividualChatScreen({required this.name});

//   @override
//   _IndividualChatScreenState createState() => _IndividualChatScreenState();
// }

// class _IndividualChatScreenState extends State<IndividualChatScreen> {
//   final TextEditingController _textController = TextEditingController();
//   String lastMessage = ''; // Add a variable to track the last message

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     lastMessage = text; // Update the last message when a new message is sent
//     ChatMessage message = ChatMessage(
//       text: text,
//       isSender: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

// Rest of the code...

class IndividualChatScreen extends StatefulWidget {
  final String name;

  IndividualChatScreen({
    required this.name,
  });

  @override
  _IndividualChatScreenState createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  String lastMessage = '';

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSender: true, // Assuming the user is the sender
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromARGB(255, 147, 220, 164),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Color.fromARGB(255, 147, 220, 164)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Color.fromARGB(255, 147, 220, 164),
              ),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSender;

  ChatMessage({required this.text, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isSender)
            CircleAvatar(
              // You can replace this with the sender's profile image
              backgroundColor: Color.fromARGB(255, 147, 220, 164),
              child: Text('S'), // Display first letter of sender's name
            ),
          Container(
            decoration: BoxDecoration(
              color: isSender
                  ? Color.fromARGB(255, 147, 220, 164)
                  : Color.fromARGB(8, 88, 217, 166),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
