import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:songgpt/features/home/repository/chat_repository.dart';

final chatControllerProvider = Provider(
  (ref) => ChatController(
    chatRepository: ref.read(
      chatRepositoryProvider,
    ),
    ref: ref,
  ),
);

class ChatController {
  final ChatRepository _chatRepository;
  final Ref _ref;

  ChatController({
    required ChatRepository chatRepository,
    required Ref ref,
  })  : _chatRepository = chatRepository,
        _ref = ref;

  Future<void> startNewChatSession() async {
    final chatId =
        await _ref.read(chatRepositoryProvider).startNewChatSession();
    _ref.read(currentChatIdProvider.notifier).state = chatId;
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String chatId,
  }) {
    _chatRepository.sendTextMessage(
      context: context,
      text: text,
      chatId: chatId,
    );
  }

  void fetchAIResponse(
    final String prompt,
    final String chatId,
  ) {
    _chatRepository.fetchAIResponse(
      prompt: prompt,
      chatId: chatId,
    );
  }

  Stream<List<dynamic>> getChatStream(String chatID) {
    return _chatRepository.getMessageList(chatID);
  }

  Stream<List<String>> getChatid() {
    return _chatRepository.getChatid();
  }
}
