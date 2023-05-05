

import 'package:cloud_firestore/cloud_firestore.dart';

class MyMessage{
  //attributs
  late String id;
  late String receiver;
  late String sender;
  late String texte;
  late DateTime timeMessage;





  //constructeur
  MyMessage(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    receiver = map["RECEIVER"];
    sender = map["SENDER"];
    texte = map["TEXTE"];
    Timestamp stamp = map["DATE"];
    timeMessage = stamp.toDate();
  }


}