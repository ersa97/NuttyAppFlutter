import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/Pages/home.dart';

class LoginPage extends StatefulWidget {
  final FirebaseUser user;

  const LoginPage({Key key, this.user}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _users;

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formkey,
          child: Column(
            children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return "Please Type in Your Email";
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'email'
              ),
            ),
              TextFormField(
                validator: (input){
                  if(input.length < 6){
                    return "Password need to be 6 character long";
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'password'
                ),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign In'),
              )
            ],
          )),
    );
  }

  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try {
         await _auth.signInWithEmailAndPassword(email: _email, password: _password);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }catch(e){
        print(e.message);
      }
      }
  }
}
