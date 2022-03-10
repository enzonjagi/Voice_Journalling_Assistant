import 'package:flutter/material.dart';
import 'package:voice_journalling/sample_journalling.dart';
import 'package:voice_journalling/speech_screen.dart';

import 'list_items.dart';

class JournalHome extends StatefulWidget {
  const JournalHome({Key? key}) : super(key: key);

  @override
  State<JournalHome> createState() => _JournalHomeState();
}

class _JournalHomeState extends State<JournalHome> {
  // Should contain a get request to the journals api for all journals
  // and order them by date or id
  List<ListItem> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        leading: Icon(Icons.record_voice_over),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          )
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        /*child: ListView.builder(
            itemCount: items.length,
            // confirm how this should work
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('This'),
                subtitle: Text('That'),
              );
            },
          ),*/
        child: Center(
            child: SingleChildScrollView(
          child: Container(),
        )),
      ),
    );
  }
}
