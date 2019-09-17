import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/Pages/activityList.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
              keyboardType: TextInputType.emailAddress,
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
        FirebaseUser user = (await _auth.signInWithEmailAndPassword
          (email: _email, password: _password)).user;
            Navigator.push(
                context, MaterialPageRoute(builder: (context)=>ActivityList()));
      }catch(e){
        print(e.message);
      }
      }
  }
}
