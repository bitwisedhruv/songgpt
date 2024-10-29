import 'package:flutter/material.dart';

// class MyChatBubble extends StatelessWidget {
//   final String chatText;
//   final String timeSent;
//   const MyChatBubble(
//       {super.key, required this.chatText, required this.timeSent});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width - 45,
//         ),
//         child: Card(
//           elevation: 1,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           color: Colors.white,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 15,
//             vertical: 5,
//           ),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                 ).copyWith(
//                   top: 5,
//                   bottom: 20,
//                 ),
//                 child: Text(
//                   chatText,
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 4,
//                 right: 10,
//                 child: Text(
//                   timeSent,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyChatBubble extends StatelessWidget {
  final String message;
  final String timeSent;
  const MyChatBubble({
    super.key,
    required this.message,
    required this.timeSent,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: isDarkMode ? Colors.white : Colors.black,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  timeSent,
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
