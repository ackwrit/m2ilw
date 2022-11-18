import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:  bodyPage()

      ),
      backgroundColor: Colors.amber,


    );


  }

  Widget bodyPage(){
    return SingleChildScrollView(
      child: Column(
        children: [
          //Logo
          Image.asset("assets/logo.png",width: 100,height: 100,),
          const SizedBox(height: 10,),

          //Image
          Image.asset("assets/images.jpg"),
          const SizedBox(height: 10,),

          //Text d'information
          const Text("La ligue des justiciers",
          style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 10,),


          //Bouton cliquable
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: StadiumBorder()
              ),
                onPressed: (){
                  print("J'ai cliqué");
                },
                child: const Text("Bienvenue",
                style: TextStyle(fontSize: 25),
                )
            ),
          ),
        ],
      ),
    );
  }
}
