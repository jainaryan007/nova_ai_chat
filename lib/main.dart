import 'package:flutter/material.dart';
import 'chat_screen.dart';

void main() {
  runApp(const BasicAIApp());
}

class BasicAIApp extends StatelessWidget {
  const BasicAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic AI Chat',
      theme: ThemeData.dark(useMaterial3: true),
      home: const ChatScreen(),
    );
  }
}
