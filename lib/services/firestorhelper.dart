//Gestion et intéraction avec la base de donnée
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';

class FirestoreHelper{
  //Attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");



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

  addUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
  }

  Future<MyUtilisateur> getUser(String uid) async{
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return MyUtilisateur(snapshot);
  }


}