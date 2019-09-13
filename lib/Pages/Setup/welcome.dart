import 'package:flutter/material.dart';
import 'package:test_flutter/Pages/Setup/signIn.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(child: Image.asset('assets/images/NUTTY LOGO.png'),)
          ,RaisedButton(
            onPressed: signIn,
            child: Text ('Sign In',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
      RaisedButton(
        onPressed: signUp,
        child: Text ('Sign Up',style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    ),),
    )],
      ),
    );
  }


  void signIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}
void signUp(){

}
