import 'package:flutter/material.dart';

class ImageBubble extends StatelessWidget {
  final String imageUrl;
  final String text;

  const ImageBubble({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ImageBubble extends StatelessWidget {
//   final String imageUrl;
//   final String text;
//
//   const ImageBubble({
//     super.key,
//     required this.imageUrl,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.grey[900],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 imageUrl,
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               text,
//               style: const TextStyle(color: Colors.white70),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.thumb_up, color: Colors.white70),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.thumb_down, color: Colors.white70),
//                   onPressed: () {},
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.copy, color: Colors.white70),
//                   onPressed: () {
//                     // Copy text to clipboard (optional)
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
