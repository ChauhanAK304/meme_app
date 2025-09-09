import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meme_app/view/loginScreen.dart';
import 'package:meme_app/view/mainScreen.dart';
import 'package:meme_app/view/wrapper.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

   Timer(Duration(seconds: 5), (){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrapper(),
     ));
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 4), borderRadius: BorderRadius.circular(10)),
              height: 275,child: Image.network("https://files.idyllic.app/files/static/3596503?width=750&optimizer=image")),
           SizedBox(height: 30,),
           Center(child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
            child: Text("Making your life funnier," ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          )),
          Text(" one tap at a time.",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

        ],
      )),
    );
  }
}
