import 'package:flutter/material.dart';
import 'package:m2ilw/model/MyUtilisateur.dart';
class MessageController extends StatefulWidget {
  MyUtilisateur autres;
  MessageController({Key? key,required this.autres}) : super(key: key);

  @override
  State<MessageController> createState() => _MessageControllerState();
}

class _MessageControllerState extends State<MessageController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

