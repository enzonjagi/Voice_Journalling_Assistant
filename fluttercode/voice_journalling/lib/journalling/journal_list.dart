// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_journalling/journalling/sample_journalling.dart';
import 'package:voice_journalling/journalling/speech_screen.dart';

import 'list_items.dart';

class JournalHome extends StatefulWidget {
  const JournalHome({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<JournalHome> createState() => _JournalHomeState();
}

class _JournalHomeState extends State<JournalHome> {
  // Should contain a get request to the journals api for all journals
  // and order them by date or id
  List<ListItem> items = [];
  final List dummyList = List.generate(1000, (index) {
    return {
      "id": index,
      "title": "Journal Entry $index",
      "subtitle": "Journal $index"
    };
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text(
          'Journals',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpeechScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(dummyList[index]["id"].toString()),
                backgroundColor: Colors.blueGrey,
              ),
              title: Text(dummyList[index]["title"]),
              subtitle: Text(dummyList[index]["subtitle"]),
              trailing: Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}
