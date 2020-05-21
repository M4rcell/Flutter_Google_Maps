
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  LatLng posicion = LatLng(-16.398584,-71.536896);

  //-16.398584, -71.536896
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Stack(
        children: <Widget>[

          GoogleMap(
            initialCameraPosition: CameraPosition(
              target:posicion,
              zoom: 20 )
          )

        ],
      ),
      
    );
  }
}