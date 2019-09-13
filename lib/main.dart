import 'package:flutter/material.dart';
import 'package:test_flutter/Pages/Setup/welcome.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }

}


  class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
      return new SplashScreen(
        seconds: 8, navigateAfterSeconds:
      new AfterSplash(),
        title: new Text('Welcome to Nutty App',
        style: new TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),),
        image: new Image.asset('assets/images/NUTTY LOGO.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
      );
    }
  }

  class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('WELCOME'),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Text('Hi Professor!!',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
        ),),
      ),
    );
  }

  }


