import 'package:flutter/material.dart';
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
  bool isMenuOpen = false;

  void sendMessage(String text) {
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'text': text,
        'isUser': true,
      });
      isTyping = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.add({
          'text':
          'Imagine yourself on an idyllic island in the middle of the vast ocean, where turquoise waters and powdery white sand surround you. This perfect vacation spot is a tropical paradise that offers a blend of tranquility and adventure.',
          'imageUrl': 'https://via.placeholder.com/300',
          'isUser': false,
        });
        isTyping = false;
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return message.containsKey('imageUrl')
                        ? ImageBubble(
                      imageUrl: message['imageUrl'],
                      text: message['text'],
                    )
                        : ChatBubble(
                      text: message['text'],
                      isUser: message['isUser'],
                    );
                  },
                ),
              ),
              if (isTyping) const TypingIndicator(),
              _buildInputArea(),
            ],
          ),
          _buildFloatingMenu(), // Menu Positioned on Top
        ],
      ),
    );
  }

  // Floating Button with Popup Menu on Top of Everything
  Widget _buildFloatingMenu() {
    return Positioned(
      bottom: 100, // Keeps button above input field
      right: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isMenuOpen)
            Positioned(
              bottom: 60,
              child: Column(
                children: [
                  _buildVerticalOption(
                    icon: Icons.picture_as_pdf,
                    label: 'Create PDF',
                    onTap: () {
                      // Handle Create PDF functionality
                      setState(() {
                        isMenuOpen = false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildVerticalOption(
                    icon: Icons.summarize,
                    label: 'Summarize Data',
                    onTap: () {
                      // Handle Summarize Data functionality
                      setState(() {
                        isMenuOpen = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          // Plus Button on Top
          FloatingActionButton(
            backgroundColor: Colors.grey[900],
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
            mini: true,
            child: Icon(
              isMenuOpen ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Input Field with Blur Effect (Glassmorphic Design)
  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          // Input Field with Glassmorphic Effect
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur Effect
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), // Translucent color
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Ask anything...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                          style: const TextStyle(color: Colors.black),
                          onSubmitted: sendMessage,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.mic, color: Colors.black54),
                        onPressed: () {
                          // Trigger voice input functionality
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Plus Button beside Input Field
          FloatingActionButton(
            backgroundColor: Colors.grey[900],
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
            mini: true,
            child: Icon(
              isMenuOpen ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Vertical Option Builder
  Widget _buildVerticalOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[800],
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

