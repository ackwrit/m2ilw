import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m2ilw/services/firestorhelper.dart';
import 'dart:io';
import 'package:lottie/lottie.dart';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  State<InformationView> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> with TickerProviderStateMixin {
  //variables
  late AnimationController myAnimationController;
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
          //déterminer sur quel plateforme on est
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: const Text("Erreur"),
              content : Lottie.network("https://assets10.lottiefiles.com/packages/lf20_ge2cws3x.json"),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("OK")
                )
              ],

            );
          }
          else
            {
              return AlertDialog(
                title: const Text("Erreur"),
                content : Lottie.network("https://assets10.lottiefiles.com/packages/lf20_ge2cws3x.json"),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text("OK")
                  )
                ],

              );
            }

        }
    );
  }

  popUpReussi(){
    showDialog(
        context: context,
        builder: (context){
          //déterminer sur quel plateforme on est
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: const Text("Réussi"),
              content : Column(
                children: [
                  Lottie.network("https://assets7.lottiefiles.com/packages/lf20_p1laie4m.json"),
                  //barre de chargement
                  LinearProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(Colors.green),
                    value: myAnimationController.value,
                  ),
                ],
              ),


            );
          }
          else
          {
            return AlertDialog(
              title: const Text("Réussie"),
              content : Lottie.network("https://assets7.lottiefiles.com/packages/lf20_p1laie4m.json"),


            );
          }

        }
    );

  }

  @override
  void initState() {
    myAnimationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 50),

    )..addListener(() {
      setState(() {

      });
    });
    super.initState();
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
              Text("Connexion"),
              Text("Inscirption")
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
                  print("passage");
                  popUpReussi();
                }).catchError((onError){
                  print(onError.toString());
                  //S'il y a un problème
                  if(onError == null){
                    popUpReussi();
                  }
                  else{
                    popUp();
                  }


                });
              }
              else
                {
                  FirestoreHelper().connect(mail.text, password.text).then((value){
                      popUpReussi();
                  }).catchError((onError){
                    if(onError == null){
                      popUpReussi();
                    }
                    else
                      {
                        popUp();
                      }

                  });
                }

            },
            child: Text("Validation")
        )
      ],
    );
  }
}

