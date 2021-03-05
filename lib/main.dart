import 'package:flutter/material.dart';
import 'package:voice_chat/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Chat App',
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}


