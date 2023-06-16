import 'package:flutter/material.dart';
import 'package:m2ilw/controller/my_animation.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';

class ProfilView extends StatefulWidget {
  MyUtilisateur user;
  ProfilView({Key? key,required this.user}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  //varibale
  bool detail = false;
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
            Text(widget.user.nomComplet),
            const Text("Description"),
            ElevatedButton(onPressed: (){
              setState(() {
                detail = !detail;
              });
            }, child: const Text("Détails"),

            ),
            AnimatedContainer(
                height: detail?MediaQuery.of(context).size.height *0.5:0,
                width: detail?MediaQuery.of(context).size.width:0,
                duration: const Duration(seconds: 3),
              color: Colors.red,
              child: detail?MyAnimation(
                  time: 1,
                  child: const Text("dksjfkldfgjdfkgjdfkxj"),

                ):Container(),
              ),

          ],
        ),
      ),
    );
  }
}
