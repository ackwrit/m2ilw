import 'package:flutter/material.dart';
import 'package:m2ilw/services/firestorhelper.dart';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  State<InformationView> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  //variables
  List<bool> selection = [true,false];
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();


  //Fonction
  popUp(){
    showDialog(
        context: context,
        builder: (context){

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amber,
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        ToggleButtons(
            children:  [
              const Text("Connexion"),
              const Text("Inscirption")
            ],
            isSelected: selection,
          onPressed: (value){
              if(value == 0){
                setState(() {
                  selection[0]=true;
                  selection[1]=false;
                });
              }
              else
                {
                  setState(() {
                    selection[0]=false;
                    selection[1]=true;
                  });
                }
          },
        ),

        TextField(
          controller: mail,
          decoration: const InputDecoration.collapsed(
              hintText: "Entrer votre adresse"
          ),

        ),

        TextField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration.collapsed(
              hintText: "Entrer votre password"
          ),


        ),


        (selection[1]==true)?TextField(
          controller: prenom,

          decoration: const InputDecoration.collapsed(
              hintText: "Entrer votre prénom"
          ),


        ):Container(),

        (selection[1]==true)?TextField(
          controller: nom,

          decoration: const InputDecoration.collapsed(
              hintText: "Entrer votre nom"
          ),


        ):Container(),




        ElevatedButton(
            onPressed: (){
              if(selection[0]==false){
                FirestoreHelper().register(mail.text, password.text, nom.text, prenom.text).then((value){
                  //si cela se passe bien
                }).catchError((onError){
                  //S'il y a un problème
                  popUp();

                });
              }
              else
                {
                  FirestoreHelper().connect(mail.text, password.text).then((value){

                  }).catchError((onError){
                    popUp();
                  });
                }

            },
            child: Text("Validation")
        )
      ],
    );
  }
}

