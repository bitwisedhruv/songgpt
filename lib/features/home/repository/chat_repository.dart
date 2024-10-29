import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songgpt/core/enums/message_enums.dart';
import 'package:songgpt/core/providers/firebase_providers.dart';
import 'package:songgpt/core/utils/info.dart';
import 'package:songgpt/features/home/models/chat_model.dart';
import 'package:songgpt/features/home/models/response_model.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    auth: ref.read(authProvider),
    firestore: ref.read(firestoreProvider),
  ),
);

final currentChatIdProvider = StateProvider<String?>((ref) => null);

class ChatRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  ChatRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  Future<String> startNewChatSession() async => const Uuid().v4();

  void _saveMessagetoFirebase({
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String chatId,
    required MessageEnum messageType,
  }) async {
    // users -> uid -> chats(collection) -> chat.id -> message
    final message = ChatMessage(
      senderID: _auth.currentUser!.uid,
      text: text,
      messageType: messageType,
      timeSent: timeSent,
      chatId: chatId,
      messageId: messageId,
    );

    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .set(
          message.toMap(),
        );
  }

  void _saveResponsesToFirebase({
    required Map<String, dynamic> aiResponse,
    required String chatId,
    required String messageId,
    required DateTime timeSent,
  }) async {
    final response = ResponseModel(
      songImageUrl: aiResponse['image_url'],
      songName: aiResponse['song_name'],
      artistName: aiResponse['artist_name'],
      genre: aiResponse['genre'],
      songDuration: aiResponse['duration'],
      endTime: aiResponse['slider_duration'],
      lyrics: aiResponse['lyrics'],
      response: aiResponse['ai_response'],
      timeSent: timeSent,
    );

    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .set(
          response.toMap(),
        );
  }

  Map<String, dynamic> fetchAIResponse(
      {required String prompt, required String chatId}) {
    try {
      var timeSent = DateTime.now();
      var messageId = const Uuid().v4();
      final response = info.firstWhere(
        (entry) => entry['prompt'] == prompt,
        orElse: () => {
          'response': 'I\'m sorry, I cannot answer your prompt',
        },
      );
      final aiResponse = response['response'] as Map<String, dynamic>;

      _saveResponsesToFirebase(
        aiResponse: aiResponse,
        chatId: chatId,
        messageId: messageId,
        timeSent: timeSent,
      );
      return aiResponse;
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String chatId,
  }) async {
    try {
      var timeSent = DateTime.now();

      var messageId = const Uuid().v4();

      _saveMessagetoFirebase(
        text: text,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        chatId: chatId,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream<List<dynamic>> getMessageList(String chatID) {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .doc(chatID)
        .collection('messages')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
      List<dynamic> messages = [];
      for (var document in event.docs) {
        messages.add(ChatMessage.fromMap(
          document.data(),
        ));
        messages.add(ResponseModel.fromMap(
          document.data(),
        ));
      }
      return messages;
    });
  }

  Stream<List<String>> getChatid() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .map((event) {
      List<String> chats = [];
      for (var document in event.docs) {
        chats.add(document.id);
      }
      return chats;
    });
  }
}
