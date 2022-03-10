import 'package:flutter/material.dart';
import 'package:voice_journalling/auth/login.dart';
import 'package:voice_journalling/journalling/journal_list.dart';
import 'package:voice_journalling/journalling/speech_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:voice_journalling/walkthrough/walkthrough_screen.dart';

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
      home: SplashScreen(
        seconds: 8,
        navigateAfterSeconds: WalkthroughScreen(),
        title: new Text(
          'Welcome To The Voice Journal App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        image: new Image.asset('assets/logo.png'),
        photoSize: 100.0,
        backgroundColor: Colors.green[50],
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
