
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  LatLng posicion = LatLng(-16.398584,-71.536896);
  MapType  mapType = MapType.normal;

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
              zoom: 13       
            ),
             mapType:mapType,
          ),
           
         _speedDial(),

        ],
      ),
      
    );
  }

  Widget _speedDial(){

    return Container(
      padding: EdgeInsets.only(bottom: 10.0,right: 10.0),
      child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            elevation: 8.0,
            children: [
              SpeedDialChild(
                label: "NORMAL",
                child: Icon(Icons.room),
                onTap: ()=>setState(()=>mapType= MapType.normal)
              ),

              SpeedDialChild(
                label: "SATELLITE",
                child: Icon(Icons.satellite),
                onTap: ()=>setState(()=>mapType= MapType.satellite)
              ),

              SpeedDialChild(
                label: "HYBRID",
                child: Icon(Icons.compare),
                onTap: ()=>setState(()=>mapType= MapType.hybrid)
              ),

              SpeedDialChild(
                label: "TERRAIN",
                child: Icon(Icons.terrain),
                onTap: ()=>setState(()=>mapType= MapType.terrain)
              )

            ],
          ),
    );
  }
}