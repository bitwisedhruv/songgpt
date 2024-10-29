// import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:songgpt/core/providers/firebase_providers.dart';
import 'package:songgpt/core/utils/info.dart';
// import 'package:songgpt/core/utils/loader.dart';
// import 'package:songgpt/features/home/controller/chat_controller.dart';
import 'package:songgpt/features/home/widgets/ai_chat_bubble.dart';
import 'package:songgpt/features/home/widgets/my_chat_bubble.dart';

// class ChatScreen extends ConsumerStatefulWidget {
//   final String chatID;
//   const ChatScreen({super.key, required this.chatID});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends ConsumerState<ChatScreen> {
//   bool _isAITyping = false;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<dynamic>>(
//       stream: ref.watch(chatControllerProvider).getChatStream(widget.chatID),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Loader();
//         }
//         // if (snapshot.hasError) {
//         //   return Center(
//         //     child: Text(
//         //       'Error: ${snapshot.error?.toString()}',
//         //     ),
//         //   );
//         // }
//         return ListView.builder(
//           itemCount: snapshot.data!.length,
//           itemBuilder: (BuildContext context, int index) {
//             final messageData = snapshot.data![index];
//             // debugPrint(messageData);
//             final auth = ref.read(authProvider);
//             final timeSent = DateFormat.Hm().format(messageData.timeSent);

//             if (messageData.senderID == auth.currentUser!.uid) {
//               return MyChatBubble(
//                 chatText: messageData.text,
//                 timeSent: timeSent,
//               );
//             }
//             if (_isAITyping) {
//               setState(() {
//                 _isAITyping = true;
//               });

//               Timer(
//                 const Duration(seconds: 2),
//                 () => AIChatBubble(
//                   imageUrl: messageData.songImageurl,
//                   songTitle: messageData.songName,
//                   artist: messageData.artistName,
//                   genre: messageData.genre,
//                   sliderDuration: messageData.endTime,
//                   duration: messageData.songDuration,
//                   lyrics: messageData.lyrics,
//                   response: messageData.response,
//                   timeSent: timeSent,
//                   isGenerating: true,
//                 ),
//               );
//               setState(() {
//                 _isAITyping = false;
//               });
//             }
//             return AIChatBubble(
//               imageUrl: messageData.songImageurl,
//               songTitle: messageData.songName,
//               artist: messageData.artistName,
//               genre: messageData.genre,
//               sliderDuration: messageData.endTime,
//               duration: messageData.songDuration,
//               lyrics: messageData.lyrics,
//               response: messageData.response,
//               timeSent: timeSent,
//             );
//           },
//         );
//       },
//     );
//   }

//   // void onSendMessage() {
//   //   setState(() {
//   //     _isAITyping = true;
//   //   });
//   //   Timer(const Duration(seconds: 2), () {
//   //     setState(() {
//   //       _isAITyping = false;
//   //     });
//   //   });
//   // }
// }
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) {
        final messageData = info[index];
        if (messageData['isMe'] == true) {
          return MyChatBubble(
            message: messageData['prompt'].toString(),
            timeSent: messageData['timeSent'].toString(),
          );
        }
        return AIChatBubble(
          imageUrl: messageData['image_url'].toString(),
          songTitle: messageData['song_name'].toString(),
          artist: messageData['artist_name'].toString(),
          genre: messageData['genre'].toString(),
          sliderDuration: messageData['slider_duration'] as double,
          duration: messageData['duration'].toString(),
          lyrics: messageData['lyrics'].toString(),
          response: messageData['ai_response'].toString(),
          timeSent: messageData['timeSent'].toString(),
        );
      },
    );
  }
}
