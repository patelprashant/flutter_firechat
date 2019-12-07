import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firechat/screens/chat_message_bubble.dart';
import 'package:flutter_firechat/screens/chat_screen.dart';

class ChatStream extends StatelessWidget {
  const ChatStream({
    Key key,
    @required Firestore firestore,
  })  : _firestore = firestore,
        super(key: key);

  final Firestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('chatMessages')
          .orderBy('dateCreated', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final _chatMessages = snapshot.data.documents.reversed;
        List<ChatMessageBubble> chatMessageWidgets = [];
        for (var chatMessage in _chatMessages) {
          final chatMessageText = chatMessage.data['message'];
          final chatMessageSender = chatMessage.data['sender'];
          final currentUser = loggedInUser.email;

          if (currentUser == chatMessageSender) {}

          final chatMessageBubble = new ChatMessageBubble(
              message: chatMessageText,
              sender: chatMessageSender,
              isMe: currentUser == chatMessageSender);
          chatMessageWidgets.add(chatMessageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            children: chatMessageWidgets,
          ),
        );
      },
    );
  }
}
