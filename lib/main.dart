import 'package:flutter/material.dart';
import 'package:flutterapp/HomeScreen.dart';
import 'map.dart';
import 'Login.dart';
import 'Signup.dart';
import 'HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MapScreen.tag: (context) => MapScreen(),
    Signup.tag: (context) => Signup(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginPage(),
      routes: routes,
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _firebaseMessaging.getToken().then((token){
//       print("Token is here see me now: ");
//       // print(token);
//       print(token);
//     });

//   }


  
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }









// import 'dart:async';
// import 'dart:convert';
// import 'dart:ffi';


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Completer<GoogleMapController> _controller = Completer();

//   //final String url = "https://glacial-reef-86829.herokuapp.com/elder/4/fall";
//   static double _data_lat;
//   static double _data_lng;


//   static const LatLng _center = const LatLng(13.8761526, 100.4099434);


//   void _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

//   @override
//   void initState() {
//     super.initState();
//     this.FetchJSON();
//     _firebaseMessaging.getToken().then((token){
//       print("Token is here see me now: ");
//       // print(token);
//       print(token);
//     });
//   }

//   FetchJSON() async{
//     var response = await http.get(
//       "https://glacial-reef-86829.herokuapp.com/elder/4/fall",
//       headers: {"Accept": "application/json"}
//     );
    
//     if (response.statusCode == 200) {
//       print("In Condition");
//       var dataResponse = json.decode(response.body);
//       print('body: [${response.body}]');
//       //var datajson = json.decode(dataResponse[0]);

//       // _data_lat = dataResponse['lat'];
//       // _data_lng = dataResponse['lng'];

//       // print("Latitude: $_data_lat");
//       // print("longitude: $_data_lng");
//     } else {
//       print('Something went wrong. \nResponse Code: ${response.statusCode}');
//     }
//     print(response.body);
//     print("2");


//     // setState(() {
//     //   var datajson = json.decode(response.body);
//     //     _data_lat = datajson['lat'];
//     //     _data_lng = datajson['lng'];
//     // });

//   }


//   Set<Marker> ewtcMarker() {
//     return <Marker>[
//       Marker(
//         position: _center,
//         markerId: MarkerId('location'),
//         infoWindow: InfoWindow(
//           title: 'My Location',
//         ),
//       ),
//     ].toSet();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           myLocationEnabled: true,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 18.0,
//           ),
//           mapType: MapType.normal,
//           markers: ewtcMarker(),   
//         ),
//       ),
//     );
//   }
// }