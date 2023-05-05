import 'package:flutter/material.dart';
import 'package:m2ilw/globale.dart';
class MyInformation extends StatefulWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  @override
  Widget build(BuildContext context) {
    return  Column(

        children: [
          const SizedBox(height: 70,),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(moi.avatar!),
          ),

          Text(moi.nomComplet,style: const TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),


          Text(moi.mail),


        ],

    );
  }
}
