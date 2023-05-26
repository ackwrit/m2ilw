import 'package:flutter/material.dart';
import 'package:m2ilw/view/custom_path.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //chemin qu'on veut contruire
      clipper: CustomPath(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Samurai.jpg"),
            fit: BoxFit.fill
          )
        )
      ),
    );
  }
}
