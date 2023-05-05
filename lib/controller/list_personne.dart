import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/services/firestorhelper.dart';
import 'package:m2ilw/view/messagerie_view.dart';

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
                    if(lesAutres.id == moi.id){
                      return const SizedBox();
                    }
                    else {
                      return Card(
                        elevation: 5.0,
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context){
                                  return MessagerieView(autrePersonne: lesAutres,);
                                }
                            ));
                          },
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(lesAutres.avatar!),
                          ),

                          title: Text(lesAutres.nomComplet),
                          subtitle: Text(lesAutres.mail),
                        ),
                      );
                    }

                  },

                );
              }
        }
    );
  }
}
