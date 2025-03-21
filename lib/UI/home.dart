import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/chat_bubble.dart';
import '../widgets/image_bubble.dart';
import '../widgets/typing_indicator.dart';
import 'dart:ui';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  bool isTyping = false;

  final String chatbotApiUrl = "YOUR_AZURE_CHATBOT_ENDPOINT";
  final String chatbotApiKey = "YOUR_AZURE_CHATBOT_KEY";
  final String summarizationApiUrl = "YOUR_AZURE_SUMMARIZATION_ENDPOINT";
  final String summarizationApiKey = "YOUR_AZURE_SUMMARIZATION_KEY";

  void sendMessage(String text) async {
    if (text.isEmpty) return;

    setState(() {
      messages.add({'text': text, 'isUser': true});
      isTyping = true;
    });

    _controller.clear();

    try {
      String chatbotResponse = await getChatbotResponse(text);
      setState(() {
        messages.add({'text': chatbotResponse, 'isUser': false});
        isTyping = false;
      });
    } catch (e) {
      setState(() {
        messages.add({'text': 'Error getting response.', 'isUser': false});
        isTyping = false;
      });
    }
  }

  Future<String> getChatbotResponse(String prompt) async {
    final response = await http.post(
      Uri.parse(chatbotApiUrl),
      headers: {
        'Content-Type': 'application/json',
        'api-key': chatbotApiKey,
      },
      body: jsonEncode({
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": 100,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      throw Exception("Failed to load chatbot response");
    }
  }

  Future<String> getSummarization(String text) async {
    final response = await http.post(
      Uri.parse(summarizationApiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': summarizationApiKey,
      },
      body: jsonEncode({"documents": [{"id": "1", "text": text}]}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["documents"][0]["summary"];
    } else {
      throw Exception("Failed to get summarization");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Smart Tutor')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubble(text: message['text'], isUser: message['isUser']);
              },
            ),
          ),
          if (isTyping) const TypingIndicator(),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Ask anything..."),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }
}
