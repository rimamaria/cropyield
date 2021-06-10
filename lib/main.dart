import 'dart:async';
import 'package:cropyield/pages/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          accentColor: Colors.green,
        ),
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          '/LoginScreen': (BuildContext context) => new LoginScreen()
        });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ]),
      backgroundColor: Colors.white,
    );
  }
}

