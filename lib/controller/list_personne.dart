import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/services/firestorhelper.dart';

class ListPersonne extends StatelessWidget {
  const ListPersonne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().cloudUsers.snapshots(),
        builder: (context,snap){
            if(!snap.hasData){
              return const CircularProgressIndicator();
            }
            else
              {
                List documents = snap.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context,index){
                    MyUtilisateur lesAutres = MyUtilisateur(documents[index]);
                    return Card(
                      elevation: 5.0,
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(

                        title: Text(lesAutres.nom),
                      ),
                    );

                  },

                );
              }
        }
    );
  }
}
