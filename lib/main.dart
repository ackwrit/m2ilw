import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:m2ilw/services/permissionHandler.dart';
import 'package:m2ilw/view/backgroundView.dart';
import 'package:m2ilw/view/information_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionHandler().start();
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
      darkTheme: ThemeData(
        primaryColor: Colors.amber
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundView(),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child:  Stack(
                children:  [
                  const BackgroundView(),
                  bodyPage()
                ],
              )

          ),
        ],
      ),


      backgroundColor: Colors.amber,


    );


  }

  Widget bodyPage(){
    return SingleChildScrollView(
      child: Column(
        children: [
          //Logo
          const SizedBox(height: 30,),
          Image.asset("assets/logo.png",width: 100,height: 100,),
          const SizedBox(height: 10,),

          //Image
          Container(
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25.0),
              image: const DecorationImage(
                image: AssetImage("assets/images.jpg"),
                fit: BoxFit.fill
              )
            ),

          ),
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
                backgroundColor: Colors.purple,
                shape: StadiumBorder()
              ),
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return InformationView();
                      }
                  ));
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
