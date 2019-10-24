import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:ffi';


class MapScreen extends StatefulWidget {
  static String tag = 'Map';
  @override
  MapState createState() => MapState();
}

class MapState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  // static const LatLng _center = const LatLng(13.8761526, 100.4099434);
  MapType _currentMapType = MapType.normal;

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  Set<Marker> markers = Set();
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // Marker _marker = new Marker(position: LatLng(13.8761526, 100.4099434));
  //map
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // final MarkerId markerId = MarkerId(markerIdVal);

  //create vatiable for set value
  static double latication;
  static double longcation;

  static double notilat;
  static double notilng;

  static int localat;
  static int localng;
  bool isData = false;

  fetchjson() async {
    // var response = await http.get("https://fall-api.herokuapp.com/api/Elders/2/fall",
    //   headers: {"Accept": "application/json"},
    //   );
    var response = await http.get(
      "http://3c9adb7e.ngrok.io/elder/4/fall",
      headers: {"Accept": "application/json"},
    );

    // var responsedata = await http.get("https://glacial-reef-86829.herokuapp.com/elder/4/fall",
    //   headers: {"Accept": "application/json"},
    //   );

      if (response.statusCode == 200) {
        print("In Condition");
        // String responseBodydata = responsedata.body;
        // var responsedataJSON = json.decode(responseBodydata);
        // var resdata = responsedataJSON[0];
        // print("resdata $resdata");
        // localat = resdata['lat'];
        // localng = resdata['lng'];
        // print("###############");
        // print("localat $localat");
        // print("localng $localng");



        String responseBody = response.body;
        print("responseBody: $responseBody");
        var responseJSON = json.decode(responseBody);
        print("responseJSON $responseJSON");
        var res = responseJSON[0];
        print("responseJSONtoList $res");

        notilat = res['latitude'];
        notilng = res['longitude'];

        notilat = res['lat'];
        notilng = res['lng'];
        
        print("notilat $notilat");
        print("notilng $notilng");

        Marker newmarker = Marker(
          markerId: MarkerId('location'),
          position: LatLng(notilat, notilng),
        );

        setState(() {
          markers.clear();
          markers.add(newmarker);

        });

        //LatLng _center = LatLng(latication, longcation);
        // Marker marker = Marker(
        //   markerId: MarkerId('My location $count'),
        //   position: _center
        // );


      } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
      }
  }

  // get token firebase
  @override
  void initState() {
    super.initState();
    fetchjson();
    _firebaseMessaging.getToken().then((token){
      print("Token is : ");
      // print(token);
      print(token);
    });
  }

  // Set<Marker> markers() {
  //   return <Marker>[
  //     Marker(
  //       position: LatLng(notilat, notilng),
  //       markerId: MarkerId('location'),
  //       infoWindow: InfoWindow(
  //         title: 'My Location',
  //       ),
  //     ),
  //   ].toSet();
  // }

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(14.04489, 100.6734),
                zoom: 18.0,
              ),
              mapType: _currentMapType,
              markers: markers,
              ),
          ],
        ),
      ),
    );
  }
}


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