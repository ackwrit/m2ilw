import 'package:flutter/material.dart';
import 'package:m2ilw/controller/info_personnel.dart';
import 'package:m2ilw/controller/list_favoris.dart';
import 'package:m2ilw/controller/list_personne.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  //variable
  int indexNavigation = 0;
  PageController controllerNavigation = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/1.5,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: const MyInformation(),
      ),
      appBar: AppBar(),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            indexNavigation = value;
            controllerNavigation.jumpToPage(value);
          });
        },
        currentIndex: indexNavigation,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
            label: "carte"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
            label: "Liste"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoris"
          ),


        ],
      ),
    );
  }

  Widget bodyPage(){
    return PageView(
      controller: controllerNavigation,
      onPageChanged: (value){
        setState(() {
          controllerNavigation.jumpToPage(value);
          indexNavigation = value;
        });
      },
      children: const [
        Text("Afficher une carte"),
        ListPersonne(),
        FavorisViewController(),

      ],
    );
  }
}



