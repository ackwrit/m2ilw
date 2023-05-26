import 'package:flutter/material.dart';

class NoDataMapsController extends StatefulWidget {
  const NoDataMapsController({Key? key}) : super(key: key);

  @override
  State<NoDataMapsController> createState() => _NoDataMapsControllerState();
}

class _NoDataMapsControllerState extends State<NoDataMapsController> {
  @override
  Widget build(BuildContext context) {
    return const Text("Il n'affiche pas la carte");
  }
}
