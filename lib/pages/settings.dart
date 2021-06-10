import 'package:cropyield/pages/loginScreen.dart';
import 'package:cropyield/pages/profile.dart';
import 'package:cropyield/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

// ignore: camel_case_types
class _settingsState extends State<settings> {
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
              Icons.settings,
              size: 50,
            ),
          ),
          Transform.translate(
            offset: Offset(80, 110),
            child: Text(
              "Account Settings",
              style: TextStyle(
                fontSize: 26,
                fontFamily: "tepeno",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            //height: 100,
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Padding(
                  //padding: const EdgeInsets.symmetric(vertical: .0),
                   TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5.0),
                          child: Text(
                            "Change Password",
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                      User currentUser = firebaseAuth.currentUser;
                      currentUser
                          .updatePassword("newpassword")
                          .then((value) {})
                          .catchError((err) {});
                    },
                  ),
              //  ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Sign Out",
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                //),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              color: Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF95E289),
                ),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => home()));
                },
                child: IconButton(
                    icon: Icon(Icons.home),
                    color: const Color(0xFF7aff8c),
                    iconSize: 50,
                    onPressed: null),
              ),
            ),
            Container(
              width: 130,
              color: Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF95E289),
                ),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => profile()));
                },
                child: IconButton(
                    icon: Icon(Icons.person),
                    color: Color(0xFF95E289),
                    iconSize: 50,
                    onPressed: null),
              ),
            ),
            Container(
              width: 130,
              color: Color(0xFF95E289),
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Color(0xff95E289),
                onPressed: () {
                  // send to login screen
                  Navigator.of(context).push(MaterialPageRoute(
                      // ignore: missing_required_param
                      builder: (context) => settings()));
                },
                child: IconButton(
                    icon: Icon(Icons.settings),
                    iconSize: 50,
                    color: Color(0xFF95E289),
                    onPressed: null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
