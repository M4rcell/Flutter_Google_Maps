
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps/pages/MarkerInformation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  LatLng posicion = LatLng(-16.398584,-71.536896);
  MapType  mapType = MapType.normal;
  BitmapDescriptor iconOwn;
  bool isShowInfo=false;
  
  //para que las imagenes carge antes de todo
   @override
   void initState(){

    getIcons();
   }

   getIcons()async{

     var icons = await BitmapDescriptor.fromAssetImage(
       ImageConfiguration(devicePixelRatio: 2.0),
       'assets/img/driving-pin.png');
       
       //actualizar el icono
       setState(() {
         iconOwn =icons;
       });
   }
  //-16.398584, -71.536896

  @override
  Widget build(BuildContext context) {

    //BitmapDescriptor icono = BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),"assets/img/driving-pin.png");
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Stack(
        children: <Widget>[

          GoogleMap(
            initialCameraPosition: CameraPosition(
              target:posicion,
              zoom: 15       
            ),
             mapType:mapType,
             markers: {
               Marker( 
                 markerId: MarkerId(posicion.toString()),
                 position: posicion,
                 alpha: 0.7,//opacidad dee marcador
                 anchor: const Offset(0.2, 0.2), 
                 draggable: true, //puede mover el marcador,
                 onDragEnd: _onDragEnd, //devuelve una nueva posicion
                 zIndex: 1,
                 //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
                 //icon: iconOwn
                 icon:BitmapDescriptor.fromAsset("assets/img/driving-pin.png"),
                 onTap: () => setState((){this.isShowInfo =! this.isShowInfo ; }),
                 /* infoWindow: InfoWindow(
                   title: "Informacion del Marcador",
                  // snippet: "Latitud : ${posicion.latitude}  & Longuitud : ${posicion.longitude}"
                  onTap: (){
                   
                  }
                 ) */
              ),

              Marker( 
                
                 markerId: MarkerId(posicion.toString()),
                 position: LatLng(-16.388409958978677, -71.54798112809658),
                 alpha: 0.7,//opacidad dee marcador
                 anchor: const Offset(0.2, 0.2), 
                 draggable: true, //puede mover el marcador,
                 onDragEnd: _onDragEnd, //devuelve una nueva posicion
                 zIndex: 2,
                 icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose)
                // icon: iconOwn
              ),
                 
             },
          ),
           
         _speedDial(),

        Visibility(visible:isShowInfo , child: MarkerInformaction( image: "assets/img/cody.jpg", title: "Mi Ubicacion", latLng: this.posicion,))


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

  _onDragEnd(LatLng posicion){

    print("New Posicion : $posicion");

  }
}