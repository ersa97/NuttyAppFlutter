import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter/Pages/Setup/welcome.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


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
                onPressed: SignUp,
                child: Text('Sign In'),
              )
            ],
          )),
    );
  }



  void SignUp() async {
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = (await _auth.createUserWithEmailAndPassword
          (email: _email, password: _password)).user;
        user.sendEmailVerification();
        Toast.show("we have sent out an email for you to verify", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    Navigator.push
      (context, MaterialPageRoute(builder: (context)=>WelcomePage()));
    }catch(e){
    print(e.message);
    }
  }
  }
}
