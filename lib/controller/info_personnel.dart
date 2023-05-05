import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/services/firestorhelper.dart';
class MyInformation extends StatefulWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  //variable
  String? urlImage;
  String? nameImage;
  Uint8List? bytesImage;


  //méthode
  popEnregistrement(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text("Choix de l'image"),
            content: Image.memory(bytesImage!),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);

              }, child: const Text("Annuler")
              ),
              TextButton(
                  onPressed: (){
                    FirestoreHelper().uploadFiles(nameImage!, "images/utilisateurs", moi.id, bytesImage!).then((value){
                      setState(() {
                        urlImage = value;
                        moi.avatar = urlImage;
                      });

                      Map<String,dynamic> map = {
                        "AVATAR": moi.avatar
                      };
                      FirestoreHelper().updateUser(moi.id, map);
                      Navigator.pop(context);

                    }).catchError((onError){
                      print("erreur");

                    });

                  },
                  child: const Text("Upload")
              ),
            ],
          );
        }
    );

  }

  popImage() async {
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true
    );
    if(resultat!=null){
      nameImage = resultat.files.first.name;
      bytesImage = resultat.files.first.bytes;
      popEnregistrement();
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Column(

        children: [
          const SizedBox(height: 70,),
          InkWell(
            onTap: (){
              popImage();
            },

            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(moi.avatar!),
            ),
          ),

          Text(moi.nomComplet,style: const TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),


          Text(moi.mail),


        ],

    );
  }
}
