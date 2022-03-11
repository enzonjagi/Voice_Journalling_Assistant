import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:voice_journalling/auth/login.dart';
import 'package:voice_journalling/journalling/journal_list.dart';
import 'package:voice_journalling/journalling/speech_screen.dart';
import 'package:voice_journalling/walkthrough/walkthrough_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        navigateAfterSeconds: const WalkthroughScreen(),
        image: Image.asset('assets/logo.png'),
        photoSize: 100.0,
        backgroundColor: Colors.green[50],
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
