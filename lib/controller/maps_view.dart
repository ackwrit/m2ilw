import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:m2ilw/controller/dataMapsController.dart';
import 'package:m2ilw/controller/noDataMapsController.dart';
import 'package:m2ilw/services/location_manager.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: LocationManager().start(),
        builder: (context,position){
          if(position.hasData){
            //s il des coordoonnées gps
            return MapsControllerView(maPosistion: position.data!,);
          }
          else
          {
            return const NoDataMapsController();
          }
        }
    );

  }
}
