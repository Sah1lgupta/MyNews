
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/provider/auth_provider.dart';
import 'package:pingolearn/ui/authentication_screen.dart';
import 'package:pingolearn/ui/news_list.dart';
import 'package:pingolearn/widgets/custom_font.dart';
import 'package:provider/provider.dart';

import 'resources/custom_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (context) => MyToggleModel(),
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MyNews'),
    );
  }
}

class MyHomePage extends StatefulWidget {



  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  User? currentUser = FirebaseAuth.instance.currentUser;





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: CustomColors.litegray,

      appBar: currentUser != null ? AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Transform.rotate(
                    angle: 7 , // Angle in radians for 45 degrees rotation
                    child: Icon(Icons.navigation),
                  ),
                ),
                SizedBox(width: 4,),
                Text('IN',style: TextStyle(fontSize: 18,fontFamily: 'Poppins'),),
              ],
            )
          ],
        ),
      ) : AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.litegray,
        elevation: 0.0,
        title: CustomFont(text: '${widget.title}', color: CustomColors.blue,),
      ),
      body: currentUser!=null ? NewsList(): AuthScreen(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}