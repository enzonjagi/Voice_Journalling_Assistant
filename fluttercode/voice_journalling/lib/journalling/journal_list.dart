// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voice_journalling/journalling/speech_screen.dart';
import 'package:timeago/timeago.dart';

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
  late DateTime _date;
  late String _datetime;
  final _auth = FirebaseAuth.instance;
  //check who is the current user
  late User? user;
  @override
  void initState() {
    // TODO: implement initState
    user = _auth.currentUser;
    super.initState();
  }

  final Stream<QuerySnapshot> _journalsStream =
      FirebaseFirestore.instance.collection('journals').snapshots();

  void logout() {
    _auth.signOut();
    Navigator.pop(context);
  }

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
              logout();
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
      body: StreamBuilder(
          stream: _auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.hasData) {
              return StreamBuilder<QuerySnapshot>(
                stream: _journalsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        _date = data['date'].toDate();
                        _datetime = '' +
                            _date.year.toString() +
                            '-' +
                            _date.month.toString() +
                            '-' +
                            _date.day.toString();
                        if (data['user_email'] != user!.email.toString()) {
                          return Visibility(
                            visible: false,
                            child: Text(
                              'Not your journal',
                            ),
                          );
                        }
                        return Card(
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.read_more),
                              onPressed: () {
                                //Opens a single journal entry
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JournalScreen(
                                            text: data['text'],
                                            date: _datetime,
                                          )),
                                );
                              },
                            ),
                            minVerticalPadding: 20,
                            title: Text(_datetime),
                            subtitle: Text(data['text']),
                            /*trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        //TODO Delete the journal entry from firebase
                      },
                    ),*/
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: Text(
                      'Tap + icon to add a new journal entry',
                    ),
                  );
                },
              );
            }
            return Text('Loading user...');
          }),
    );
  }
}

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key, required this.text, required this.date})
      : super(key: key);
  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO work on the custom journal interface
      appBar: AppBar(
        title: Text(
          date,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
