import 'package:flutter/material.dart';
import 'package:m2ilw/model/MyMessage.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/globale.dart';

class MessageBubbleController extends StatefulWidget {
  MyMessage message;
  MyUtilisateur autreUser;
  MessageBubbleController({Key? key , required this.message, required this.autreUser}) : super(key: key);

  @override
  State<MessageBubbleController> createState() => _MessageBubbleControllerState();
}

class _MessageBubbleControllerState extends State<MessageBubbleController> {
  @override
  Widget build(BuildContext context) {
    return bodyPage();
  }


  Widget bodyPage(){
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: WigdetBubble(widget.message.sender == moi.id),
      ),
    );
  }

  List<Widget> WigdetBubble(bool moi) {
    CrossAxisAlignment alignment = moi?CrossAxisAlignment.end:CrossAxisAlignment.start;
    Color colorsBuble = moi?Colors.green : Colors.blue;
    Color textColor = moi?Colors.white : Colors.black;
    return <Widget>[
      Expanded(
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: colorsBuble,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(widget.message.texte,style: TextStyle(color: textColor),),
                ),
              )
            ],

          )
      )
    ];

  }
}
