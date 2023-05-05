import 'dart:io';

import 'package:permission_handler/permission_handler.dart';


class PermissionHandler{


  //initlialiser
  start() async {
    if(Platform.isIOS){
      PermissionStatus photo = await Permission.photos.status;
      checkPermissionPhoto(photo);
    }
    else
      {
        PermissionStatus storage = await Permission.storage.status;
        checkPermissionStorage(storage);
      }
  }


  //méthode qui font vérifier l'état des permissions
  Future <PermissionStatus>checkPermissionPhoto(PermissionStatus photo) async{
    switch(photo){
      case PermissionStatus.permanentlyDenied : return Future.error("L'utilisateur ne souhaite pas qu'on accéde à ses données personnlles");
      case PermissionStatus.denied : return Permission.photos.request().then((value) => checkPermissionPhoto(photo));
      case PermissionStatus.restricted : return Permission.photos.request().then((value) => checkPermissionPhoto(photo));
      case PermissionStatus.limited : return Future.error("l'utilisateur a donné son accord");
      case PermissionStatus.granted : return Future.error("l'utilisateur a donné son accord");
    }

  }

  Future<PermissionStatus>checkPermissionStorage(PermissionStatus storage) async{
    switch(storage){
      case PermissionStatus.permanentlyDenied : return Future.error("L'utilisateur ne souhaite pas qu'on accéde à ses données personnlles");
      case PermissionStatus.denied : return Permission.storage.request().then((value) => checkPermissionStorage(storage));
      case PermissionStatus.restricted : return Permission.storage.request().then((value) => checkPermissionStorage(storage));
      case PermissionStatus.limited : return Future.error("l'utilisateur a donné son accord");
      case PermissionStatus.granted : return Future.error("l'utilisateur a donné son accord");
    }
  }
}