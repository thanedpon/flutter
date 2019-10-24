import 'package:flutter/material.dart';
import 'package:flutterapp/Login.dart';

class Signup extends StatefulWidget {
  static String tag = 'Signup';
  @override
  SignupPageState createState() => new SignupPageState();
}

class SignupPageState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 175,
              height: 175,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage('assets/human.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 0.1],
                    colors: [
                      Color(0xFFF58524),
                      Color(0xFFF92B7F),
                    ],
                  ),
                  border: Border.all(
                    width: 4.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      ),
                    onPressed: () {},
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "ชื่อ",
                labelStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "อีเมล์",
                labelStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "รหัสผ่าน",
                labelStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )
              ),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFF58524),
                    Color(0xFFF92B7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "ลงทะเบียน",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginPage.tag);
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
    // final regis = Padding(
    //   padding: EdgeInsets.all(12.0),
    //   child: Text(
    //     'Register',
    //     style: TextStyle(fontSize: 36.0, color:Colors.white),
    //   ),
    // );

    // final body = Container(
    //   width:  MediaQuery.of(context).size.width,
    //   padding: EdgeInsets.all(28.0),
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(colors: [
    //       Colors.blue,
    //       Colors.lightBlueAccent,
    //     ]),
    //   ),
    //   child: Column(
    //     children: <Widget>[regis],
    //   ),
    // );

    // return Scaffold(
    //   body:body,
    // );
  }
}