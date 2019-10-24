import 'package:flutter/material.dart';
import 'package:flutterapp/map.dart';


class HomePage extends StatefulWidget {
  static String tag = 'Home';
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo2.png'),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(MapScreen.tag);
        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFF58524),
        child: Text('แผนที่', style: TextStyle(color: Colors.white)),
      ),
    );

   return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}