import 'package:flutter/material.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  //variable
  int indexNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            indexNavigation = value;
          });
        },
        currentIndex: indexNavigation,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
            label: "Liste"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_sharp),
              label: "Favoris"
          ),
        ],
      ),
    );
  }

  Widget bodyPage(){
    return Text("Page vide");
  }
}


