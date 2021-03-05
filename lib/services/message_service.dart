import 'package:voice_chat/models/message_model.dart';

class MessageService{
  List<Message> messageList = [Message(message: "hi Whatsup",recipientName: "Evans",receiverName: "Lady Shirl",createdAt: "10ms",isMe: true),
    Message(message: "I am fine and you",recipientName: "Lady Shirl",receiverName: "Evans",createdAt: "10ms",isMe: false),
    Message(message: "hi Whatsup",recipientName: "Evans",receiverName: "Lady Shirl",createdAt: "10ms",isMe: true)
  ];
}