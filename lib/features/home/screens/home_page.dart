import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/features/home/controller/chat_controller.dart';
import 'package:songgpt/features/home/repository/chat_repository.dart';
// import 'package:songgpt/features/home/widgets/ai_chat_bubble.dart';
import 'package:songgpt/features/home/widgets/chat_list.dart';
import 'package:songgpt/features/home/widgets/chat_message_box.dart';
import 'package:songgpt/features/home/widgets/drawer.dart';
// import 'package:songgpt/features/home/widgets/my_chat_bubble.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(chatControllerProvider).startNewChatSession();
  }

  @override
  Widget build(BuildContext context) {
    final chatId = ref.watch(currentChatIdProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Song'),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: chatId != null
          ? Column(
              children: [
                const Expanded(
                  // child: ChatScreen(chatID: chatId),
                  child: ChatScreen(),
                ),
                ChatMessageBox(
                  chatId: chatId,
                ),
              ],
            )
          : const Scaffold(),
    );
  }
}
