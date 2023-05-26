import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2ilw/controller/message_bubble.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyMessage.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/services/firestorhelper.dart';
class MessageController extends StatefulWidget {
  MyUtilisateur autres;
  MessageController({Key? key,required this.autres}) : super(key: key);

  @override
  State<MessageController> createState() => _MessageControllerState();
}

class _MessageControllerState extends State<MessageController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreHelper().cloudMessages.snapshots(),
        builder: (context,snap){
            List? documents = snap.data?.docs;
            if(documents == null){
               return Container();
            }
            else
              {
                return ListView.builder(
                  itemCount: documents.length,
                    itemBuilder: (context,index){
                    MyMessage message = MyMessage(documents[index]);
                    if(message.sender == moi.id && message.receiver == widget.autres.id || message.sender == widget.autres.id && message.receiver == moi.id){
                      return MessageBubbleController(message: message, autreUser: widget.autres);
                    }
                    else {
                      return Container();
                    }


                    }
                );

              }

        }
    );
  }
}

