
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerInformaction extends StatefulWidget {

  String title;
  LatLng latLng;
  String image;
 MarkerInformaction( {@required this.title,@required this.latLng,@required this.image}) ;
  @override
  _MarkerInformactionState createState() => _MarkerInformactionState();
}

class _MarkerInformactionState extends State<MarkerInformaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 50,
            width: 50,
            child: ClipOval(child: Image.asset(widget.image,fit: BoxFit.cover,),),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Text(widget.title,style: TextStyle(color: Colors.greenAccent),),
                Text("Latitud ${widget.latLng.latitude}",style: TextStyle(fontSize:12 ,color: Colors.grey),),
                 Text("Longuitud ${widget.latLng.longitude}",style:TextStyle(fontSize:12 ,color: Colors.grey),)
              ],
            ),
          )
          ,
        ],
      ),
      
    );
  }
}