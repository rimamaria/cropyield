import 'package:cropyield/pages/settings.dart';
import 'package:cropyield/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, -200),
            child: Container(
              width: 500.0,
              height: 500.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF95E289),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x242f595),
                    offset: Offset(-55, -55),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30, 100),
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Transform.translate(
            offset: Offset(80, 110),
            child: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 26,
                fontFamily: "tepeno",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              color: const Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF95E289),
                ),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => home()));
                },
                child: IconButton(
                    icon: Icon(Icons.home),
                    color: const Color(0xFF95E289),
                    iconSize: 50,
                    onPressed: null),
              ),
            ),
            Container(
              width: 130,
              color: const Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF95E289),
                ),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => profile()));
                },
                child: IconButton(
                    icon: Icon(Icons.person),
                    color: const Color(0xFF95E289),
                    iconSize: 50,
                    onPressed: null),
              ),
            ),
            Container(
              width: 130,
              color: const Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF95E289),
                ),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => settings()));
                },
                child: IconButton(
                    icon: Icon(Icons.settings),
                    color: const Color(0xFF95E289),
                    iconSize: 50,
                    onPressed: null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
