import 'package:flutter/material.dart';
import 'package:flutter_firechat/screens/chat_screen.dart';
import 'package:flutter_firechat/screens/login_screen.dart';
import 'package:flutter_firechat/screens/registration_screen.dart';
import 'package:flutter_firechat/screens/welcome_screen.dart';

void main() => runApp(FireChat());

class FireChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
