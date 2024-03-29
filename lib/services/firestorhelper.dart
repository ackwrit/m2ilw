//Gestion et intéraction avec la base de donnée
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';

class FirestoreHelper{
  //Attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");



  //Méthode connexion
  Future<MyUtilisateur>connect(String email, String password)async {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      return getUser(uid);
  }


  //Méthode inscription
  Future<MyUtilisateur> register(String email,String password,String nom, String prenom ) async {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
        String id = userCredential.user!.uid;
        Map<String,dynamic> map = {
          "NOM":nom,
          "PRENOM":prenom,
          "MAIL":email,
          "BIRTHDAY":DateTime.now()
        };
        addUser(id, map);
        return getUser(id);
  }

  sendMessage(String texte, MyUtilisateur destinataire, MyUtilisateur sender){
    DateTime time  = DateTime.now();
    Map<String,dynamic> map = {
      "DATE":time,
      "SENDER":sender.id,
      "RECEIVER":destinataire.id,
      "TEXTE":texte
    };
    String uid = time.microsecondsSinceEpoch.toString();
    addMessage(getMessageRef(sender.id, destinataire.id, uid), map);

  }

  String getMessageRef(String emmeteur, String destinaire, String idDate){
    String resultat ="";
    List<String> liste= [destinaire,emmeteur];
    liste.sort((a,b)=>a.compareTo(b));
    for(var x in liste){
      resultat += x+"+";
    }
    resultat = resultat + idDate;
    return resultat;

  }

  addMessage(String uid, Map<String,dynamic> map){
    cloudMessages.doc(uid).set(map);
  }

  addUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
  }

  updateUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).update(map);
  }

  Future<MyUtilisateur> getUser(String uid) async{
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return MyUtilisateur(snapshot);
  }

  //upload des images
Future<String> uploadFiles(String name, String destination, String idUtilisateur, Uint8List datas) async {
    String url = "";
    TaskSnapshot snapshot= await storage.ref("$destination/$idUtilisateur/$name").putData(datas);
    url = await snapshot.ref.getDownloadURL();
    return url;


}


}