import 'package:flutter/material.dart';
import 'package:m2ilw/controller/list_messages.dart';
import 'package:m2ilw/globale.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
import 'package:m2ilw/services/firestorhelper.dart';

class MessagerieView extends StatefulWidget {
  MyUtilisateur autrePersonne;
  MessagerieView({Key? key,required this.autrePersonne}) : super(key: key);

  @override
  State<MessagerieView> createState() => _MessagerieViewState();
}

class _MessagerieViewState extends State<MessagerieView> {
  //variable
  TextEditingController messageController = TextEditingController();
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
    return SafeArea(
      bottom: true,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //message qui va être affiché
            Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                    child: MessageController(autres: widget.autrePersonne,),
            ),
            ),
            const Divider(height: 1.5,),
            //message qu'on  tape
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Entrer votre message"
                      ),
                      maxLines: null,

                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        if(messageController.text != ""){
                          String message = messageController.text;
                          FirestoreHelper().sendMessage(message, widget.autrePersonne, moi);
                          setState(() {
                            messageController.text = "";
                          });

                        }


                      },
                      icon: const Icon(Icons.send)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
