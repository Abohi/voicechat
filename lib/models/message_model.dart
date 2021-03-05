import 'package:flutter/material.dart';

class Message {
  final String recipientName;
  final String message;
  final String createdAt;
  final String receiverName;
  final bool isMe;

  const Message({
    @required this.recipientName,
    @required this.message,
    @required this.receiverName,
    this.createdAt,
    this.isMe
  });


}