import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isAI;

  ChatMessage({required this.text, required this.isAI});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _textController.clear();
    
    setState(() {
      _messages.add(ChatMessage(text: text, isAI: false));
      _isTyping = true;
    });

    _scrollToBottom();
    _simulateAIResponse();
  }

  void _simulateAIResponse() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!mounted) return;

    setState(() {
      _messages.add(ChatMessage(
        text: "This is a mock AI response to your message. I am a very basic bot now!",
        isAI: true,
      ));
      _isTyping = false;
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildTextComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: Theme.of(context).cardColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: "Send a message",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment:
            message.isAI ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.isAI) ...[
            const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.smart_toy, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: message.isAI
                    ? Colors.grey[800]
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16).copyWith(
                  bottomLeft: message.isAI ? const Radius.circular(0) : null,
                  bottomRight: !message.isAI ? const Radius.circular(0) : null,
                ),
              ),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          if (!message.isAI) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic AI Chat'),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment),
            tooltip: 'New Chat',
            onPressed: () {
              setState(() {
                _messages.clear();
                _isTyping = false;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _buildMessage(_messages[index]),
            ),
          ),
          if (_isTyping)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "AI is typing...",
                  style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
            ),
          const Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}
