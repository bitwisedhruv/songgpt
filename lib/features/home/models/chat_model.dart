import 'package:songgpt/core/enums/message_enums.dart';

class ChatMessage {
  final String senderID;
  final String text;
  final MessageEnum messageType;
  final DateTime timeSent;
  final String chatId;
  final String messageId;
  ChatMessage({
    required this.senderID,
    required this.text,
    required this.messageType,
    required this.timeSent,
    required this.chatId,
    required this.messageId,
  });

  ChatMessage copyWith({
    String? senderID,
    String? text,
    MessageEnum? messageType,
    DateTime? timeSent,
    String? chatId,
    String? messageId,
  }) {
    return ChatMessage(
      senderID: senderID ?? this.senderID,
      text: text ?? this.text,
      messageType: messageType ?? this.messageType,
      timeSent: timeSent ?? this.timeSent,
      chatId: chatId ?? this.chatId,
      messageId: messageId ?? this.messageId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderID': senderID,
      'text': text,
      'messageType': messageType.type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'chatId': chatId,
      'messageId': messageId,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      senderID: map['senderID'] as String,
      text: map['text'] as String,
      messageType: (map['messageType'] as String).toEnum(),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      chatId: map['chatId'] as String,
      messageId: map['messageId'] as String,
    );
  }

  @override
  String toString() {
    return 'ChatMessage(senderID: $senderID, text: $text, messageType: $messageType, timeSent: $timeSent, chatId: $chatId, messageId: $messageId)';
  }

  @override
  bool operator ==(covariant ChatMessage other) {
    if (identical(this, other)) return true;

    return other.senderID == senderID &&
        other.text == text &&
        other.messageType == messageType &&
        other.timeSent == timeSent &&
        other.chatId == chatId &&
        other.messageId == messageId;
  }

  @override
  int get hashCode {
    return senderID.hashCode ^
        text.hashCode ^
        messageType.hashCode ^
        timeSent.hashCode ^
        chatId.hashCode ^
        messageId.hashCode;
  }
}
