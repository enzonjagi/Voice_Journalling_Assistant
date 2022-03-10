import 'package:flutter/material.dart';
import 'package:voice_journalling/auth/login.dart';
import 'package:voice_journalling/journal_list.dart';
import 'package:voice_journalling/speech_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Journal',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
