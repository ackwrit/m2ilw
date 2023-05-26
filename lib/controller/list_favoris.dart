import 'package:flutter/material.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/services/firestorhelper.dart';

class FavorisViewController extends StatefulWidget {
  const FavorisViewController({Key? key}) : super(key: key);

  @override
  State<FavorisViewController> createState() => _FavorisViewControllerState();
}

class _FavorisViewControllerState extends State<FavorisViewController> {
  //variable
  List mesFavoris = [];



  //méthode
  buildUser(){
    for(int i=0;i<moi.favoris!.length;i++){
      FirestoreHelper().getUser(moi.favoris![i]).then((value) {
        setState(() {
          mesFavoris.add(value);
        });


      });

    }
  }

  @override
  void initState() {
    buildUser();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: mesFavoris.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 5,mainAxisSpacing: 5),
        itemBuilder: (context,index){
          MyUtilisateur myUser =  mesFavoris[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(myUser.avatar??imageDefault),
                fit: BoxFit.fill
              )
            ),
          );
        }

    );
  }
}
