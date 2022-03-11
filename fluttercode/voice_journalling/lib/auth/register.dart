// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voice_journalling/auth/auth_functions.dart';
import 'package:voice_journalling/auth/login.dart';
import 'package:voice_journalling/auth/validator.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 130.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset('assets/logo.png'),
              ),
              // ignore: prefer_const_constructors
              Spacer(
                flex: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameTextController,
                      decoration: InputDecoration(
                        hintText: 'username',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailTextController,
                      validator: (value) =>
                          Validator.validateEmail(email: value!),
                      decoration: InputDecoration(
                        hintText: 'email',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'password',
                        contentPadding: EdgeInsets.all(10),
                      ),
                      controller: _passwordTextController,
                      obscureText: true,
                      validator: (value) =>
                          Validator.validatePassword(password: value!),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isProcessing = true;
                  });

                  if (_formKey.currentState!.validate()) {
                    User? user = await FireAuth.registerUsingEmailPassword(
                      name: _nameTextController.text,
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );

                    setState(() {
                      _isProcessing = false;
                    });

                    if (user != null) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        ModalRoute.withName('/'),
                      );
                    }
                  }
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Registered?'),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  void setState(Null Function() param0) {}
}
