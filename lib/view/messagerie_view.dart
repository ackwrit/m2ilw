import 'package:flutter/material.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';

class MessagerieView extends StatefulWidget {
  MyUtilisateur autrePersonne;
  MessagerieView({Key? key,required this.autrePersonne}) : super(key: key);

  @override
  State<MessagerieView> createState() => _MessagerieViewState();
}

class _MessagerieViewState extends State<MessagerieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text(widget.autrePersonne.nomComplet),
        centerTitle: true,

      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Text("Afficher le chat");
  }
}
