import 'package:flutter/material.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';

class ProfilView extends StatefulWidget {
  MyUtilisateur user;
  ProfilView({Key? key,required this.user}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.user.id,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.user.avatar ?? imageDefault),
              ),
            ),
            Text(widget.user.nomComplet)
          ],
        ),
      ),
    );
  }
}
