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
  Completer<GoogleMapController> controllerMaps = Completer();

  @override
  void initState() {
    Map<String,dynamic> map ={
      "GPS":widget.maPosistion
    };
    FirestoreHelper().updateUser(moi.id, map);
    initCamera = CameraPosition(target: LatLng(widget.maPosistion.latitude, widget.maPosistion.longitude),zoom: 15);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: initCamera,
      myLocationEnabled: true,
      onMapCreated: (controller){
          controllerMaps.complete(controller);
      },
    );
  }
}
