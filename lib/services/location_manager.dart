
import 'package:geolocator/geolocator.dart';

class LocationManager {

    Future<Position>start() async {
    //vérifier si activer son gps
      bool enabled = await Geolocator.isLocationServiceEnabled();
      //vérification des permssions
      LocationPermission permission = await Geolocator.checkPermission();
      return enabled ? handlePermission() : resultatPermission(permission);
    }

   Future <Position>handlePermission() async {
      LocationPermission permission = await Geolocator.checkPermission();
      return await resultatPermission(permission);

    }

    Future<Position> resultatPermission(LocationPermission permission) async{
      switch(permission){
        case LocationPermission.deniedForever : return errorString("L'accès est toujours refusé");
        case LocationPermission.denied : return await Geolocator.requestPermission().then((newPermission) => resultatPermission(newPermission));
        case LocationPermission.unableToDetermine : return await Geolocator.requestPermission().then((newPermission) => resultatPermission(newPermission));
        case LocationPermission.whileInUse: return await Geolocator.getCurrentPosition();
        case LocationPermission.always : return await Geolocator.getCurrentPosition();

      }
    }

    Future<Position> errorString(String err) async {
      return await Future.error(err);
    }
}