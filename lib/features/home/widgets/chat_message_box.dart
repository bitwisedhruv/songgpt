import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/features/home/controller/chat_controller.dart';

class ChatMessageBox extends ConsumerStatefulWidget {
  final String chatId;
  const ChatMessageBox({
    super.key,
    required this.chatId,
  });

  @override
  ConsumerState<ChatMessageBox> createState() => _ChatMessageBoxState();
}

class _ChatMessageBoxState extends ConsumerState<ChatMessageBox> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void sendTextMessage() {
    ref.read(chatControllerProvider).sendTextMessage(
          context: context,
          text: messageController.text.trim(),
          chatId: widget.chatId,
        );
    ref
        .read(chatControllerProvider)
        .fetchAIResponse(messageController.text.trim(), widget.chatId);
    setState(() {
      messageController.text = '';
    });
  }

  InputBorder _border(BuildContext context, {bool isFocused = false}) {
    final color = isFocused
        ? Theme.of(context).colorScheme.primary // Color for focused border
        : Theme.of(context).colorScheme.outline; // Color for enabled border

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: messageController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context)
                  .colorScheme
                  .surface, // Background color for TextField based on theme
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_file,
                  color: Theme.of(context)
                      .iconTheme
                      .color, // Icon color based on theme
                ),
              ),
              hintText: 'Describe your song idea...',
              border: _border(context),
              enabledBorder: _border(context),
              focusedBorder: _border(context, isFocused: true),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
            right: 2,
            left: 2,
          ),
          child: GestureDetector(
            onTap: sendTextMessage,
            child: const CircleAvatar(
              radius: 25,
              // backgroundColor: Colors.black,
              child: Icon(
                Icons.music_note_outlined,
                // color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
