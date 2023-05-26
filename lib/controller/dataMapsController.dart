import 'package:flutter/material.dart';

class MapsControllerView extends StatefulWidget {
  const MapsControllerView({Key? key}) : super(key: key);

  @override
  State<MapsControllerView> createState() => _MapsControllerViewState();
}

class _MapsControllerViewState extends State<MapsControllerView> {
  @override
  Widget build(BuildContext context) {
    return const Text("Afficher une carte");
  }
}
