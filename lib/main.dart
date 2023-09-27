import 'package:dickychat/individualScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatListApp());
}

class ChatListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatListScreen(
        name: '',
        lastMessage: '',
      ),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  final String name;
  final String lastMessage;
  final List<ChatItem> chatItems = [
    ChatItem(
      name: "John Doe",
      message: "Hey, how are you?",
      time: "10:30 AM",
      profileImage: "assets/pp.jpg",
    ),
    ChatItem(
      name: "Tina",
      message: "Hey, how are you?",
      time: "10:30 AM",
      profileImage: "assets/th.jpg",
    ),
    ChatItem(
      name: "marry",
      message: "Hey, how are you?",
      time: "10:30 AM",
      profileImage: "assets/pp1.jpg",
    ),
    ChatItem(
      name: "Illy",
      message: "",
      time: "10:30 AM",
      profileImage: "assets/pp2.jpg",
    ),
    ChatItem(
      name: "Rose",
      message: "Hey, how are you?",
      time: "10:30 AM",
      profileImage: "assets/pp3.jpg",
    ),
    // Add more chat items here
  ];
  ChatListScreen({required this.name, required this.lastMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dickychat",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 147, 220, 164),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final chatItem = chatItems[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chatItem.profileImage),
            ),
            title: Text(chatItem.name),
            subtitle: Text(lastMessage),
            trailing: Text(chatItem.time),
            onTap: () {
              // Navigate to the individual chat screen
              // You can implement this as needed
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => IndividualChatScreen(
                    name: chatItem.name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String profileImage;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.profileImage,
  });
}
