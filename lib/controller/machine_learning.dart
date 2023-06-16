import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class MLearningController extends StatefulWidget {
  const MLearningController({Key? key}) : super(key: key);

  @override
  State<MLearningController> createState() => _MLearningControllerState();
}

class _MLearningControllerState extends State<MLearningController> {

  LanguageIdentifier identifier = LanguageIdentifier(confidenceThreshold: 0.3);
  String langue ="";
  String multiple = "";
  TextEditingController textController = TextEditingController();

  checkLangue() async{
    if(textController.text != null)  {
      String phrase = await identifier.identifyLanguage(textController.text);
      setState(() {
        langue = phrase;
      });



    }



  }

  multipleLange() async {
    multiple = "";
    String phrase = textController.text;
    if(phrase == "") return ;
    final multipleL = await identifier.identifyPossibleLanguages(phrase);
    if(multipleL.isEmpty){
      setState(() {
        multiple = "Nous n'avons trouvé de langues";
      });

    }else{
      for(var lang in multipleL){
        setState(() {
          multiple += "${lang.languageTag}, avec une confiance de ${lang.confidence * 100}%";
        });
      }
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

        ElevatedButton(onPressed: (){
          multipleLange();

        },
            child: const Text("Determiner plusieurs langues")
        ),

        Text(langue),
        Text(multiple)
      ],
    );
  }
}
