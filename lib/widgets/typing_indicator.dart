import 'package:flutter/material.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text(
            'AI is typing...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class TypingIndicator extends StatelessWidget {
//   const TypingIndicator({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           SizedBox(width: 12),
//           Text(
//             'AI is typing...',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }
