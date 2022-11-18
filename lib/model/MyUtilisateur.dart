import 'package:cloud_firestore/cloud_firestore.dart';

class MyUtilisateur {
  //Attributs
  late String id;
  late String nom;
  late String prenom;
  late String mail;
  String? avatar;
  late DateTime birhday;


  int get age {
    return DateTime.now().year - birhday.year;
  }

  //Constructeurs
  MyUtilisateur.empty(){
    id= "";
    nom ="";
    prenom ="";
    mail="";
    avatar="";
    birhday = DateTime.now();
  }


 MyUtilisateur(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    String? avatarProvisoire;
    avatarProvisoire = map["AVATAR"];
    (avatar == null)?"https://firebasestorage.googleapis.com/v0/b/m2ilw-54738.appspot.com/o/1078454.jpg?alt=media&token=d98a3413-9484-4f3c-b20f-cd341257ebf9":avatarProvisoire;
    Timestamp timestamp = map["BIRTHDAY"];
    birhday = timestamp.toDate();
}





  //méthode





}