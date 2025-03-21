import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey[800],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
//
// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isUser;
//
//   const ChatBubble({
//     super.key,
//     required this.text,
//     required this.isUser,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isUser ? Colors.blueAccent : Colors.grey[800],
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(12),
//             topRight: const Radius.circular(12),
//             bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
//             bottomRight: isUser ? Radius.zero : const Radius.circular(12),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // import 'package:flutter/material.dart';
// //
// // class ChatBubble extends StatelessWidget {
// //   final String text;
// //   final bool isUser;
// //   final DateTime timestamp;
// //
// //   const ChatBubble({
// //     super.key,
// //     required this.text,
// //     required this.isUser,
// //     required this.timestamp,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Align(
// //       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
// //         padding: const EdgeInsets.all(12),
// //         decoration: BoxDecoration(
// //           color: isUser ? Colors.blueAccent : Colors.grey[800],
// //           borderRadius: BorderRadius.only(
// //             topLeft: const Radius.circular(12),
// //             topRight: const Radius.circular(12),
// //             bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
// //             bottomRight: isUser ? Radius.zero : const Radius.circular(12),
// //           ),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               text,
// //               style: const TextStyle(color: Colors.white),
// //             ),
// //             const SizedBox(height: 4),
// //             Text(
// //               _formatTimestamp(timestamp),
// //               style: const TextStyle(fontSize: 10, color: Colors.white70),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   String _formatTimestamp(DateTime time) {
// //     return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
// //   }
// // }
