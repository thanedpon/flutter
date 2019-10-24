import 'package:flutter/material.dart';
import 'package:flutterapp/map.dart';
import 'Signup.dart';
import 'HomeScreen.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login';
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'Email Address',
      decoration: InputDecoration(
        hintText: 'อีเมล์',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

      final password = TextFormField(
      autofocus: false,
      // initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'รหัสผ่าน',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

      final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFF58524),
        child: Text('ล็อกอิน', style: TextStyle(color: Colors.white)),
      ),
    );

      final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Signup.tag);
        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFF58524),
        child: Text('สมัครสมาชิก', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'ลืมรหัสผ่าน',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            signupButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}