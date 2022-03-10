import 'package:flutter/material.dart';
import 'package:voice_journalling/auth/register.dart';
import 'package:voice_journalling/journal_list.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Container(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 130.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset('assets/logo.png'),
              ),
              Spacer(
                flex: 10,
              ),
              TextFormField(
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
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JournalHome()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not registered?'),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      'Click to Register',
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
}
