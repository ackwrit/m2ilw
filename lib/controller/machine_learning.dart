import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class MLearningController extends StatefulWidget {
  const MLearningController({Key? key}) : super(key: key);

  @override
  State<MLearningController> createState() => _MLearningControllerState();
}

class _MLearningControllerState extends State<MLearningController> {

  LanguageIdentifier identifier = LanguageIdentifier(confidenceThreshold: 0.7);
  String langue ="";
  TextEditingController textController = TextEditingController();

  checkLangue() async{
    if(textController.text != null)  {
      langue = await identifier.identifyLanguage(textController.text);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Entrer votyre texte"
          ),
        ),
        ElevatedButton(onPressed: (){
          checkLangue();

        },
            child: const Text("Determiner une langue")
        ),

        Text(langue)
      ],
    );
  }
}
