import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/services/firestorhelper.dart';

class MapsControllerView extends StatefulWidget {
  Position maPosistion;
  MapsControllerView({Key? key ,required this.maPosistion}) : super(key: key);

  @override
  State<MapsControllerView> createState() => _MapsControllerViewState();
}

class _MapsControllerViewState extends State<MapsControllerView> {
  //variables
  late CameraPosition initCamera;
  LatLng tourEiffel = const LatLng(47.53956475343463, -0.48398994206471);
  Completer<GoogleMapController> controllerMaps = Completer();
  Set<Marker> myMarkers = Set();

  @override
  void initState() {
    Map<String,dynamic> map ={
      "GPS":widget.maPosistion
    };
    FirestoreHelper().updateUser(moi.id, map);
    initCamera = CameraPosition(target: LatLng(widget.maPosistion.latitude, widget.maPosistion.longitude),zoom: 12);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    myMarkers.add(
        Marker(
            markerId: const MarkerId("0"),
          position: tourEiffel,
          infoWindow: const InfoWindow(
            title: 'tour Eiffel',
            snippet: 'la dame fer'
          )
        ),
    );
    return GoogleMap(
        initialCameraPosition: initCamera,
      myLocationEnabled: true,
      markers: myMarkers,
      onMapCreated: (controller) async{
          String newStyle = await DefaultAssetBundle.of(context).loadString("lib/services/mapStyle.json");
          controller.setMapStyle(newStyle);
          controllerMaps.complete(controller);
      },
    );
  }
}
