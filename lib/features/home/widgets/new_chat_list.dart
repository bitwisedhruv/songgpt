import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/core/utils/info.dart';
// import 'package:songgpt/features/home/controller/chat_controller.dart';

// class ChatList extends ConsumerStatefulWidget {
//   const ChatList({super.key});

//   @override
//   ConsumerState<ChatList> createState() => _ChatListState();
// }

// class _ChatListState extends ConsumerState<ChatList> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: ref.watch(chatControllerProvider).getChatid(),
//       builder: (context, snapshot) {
//         return ListView.builder(
//           itemCount: snapshot.data!.length,
//           itemBuilder: (context, index) {
//             final chatId = snapshot.data![index];
//             return ListTile(
//               title: Text(
//                 chatId,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//               trailing: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.red,
//                   )),
//               onTap: () {},
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Column(
          children: [
            ListTile(
              title: Text(chat),
              trailing: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            const Divider(
              thickness: 0.1,
            ),
          ],
        );
      },
    );
  }
}
