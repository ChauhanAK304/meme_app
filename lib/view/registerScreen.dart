import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/view/loginScreen.dart';
import 'package:meme_app/view/mainScreen.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> signup() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account Created Successfully"))
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
    on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup Failed: ${e.message}"))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
      }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.cyan.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)),
        ),
        body:  Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50,left: 30),
            child: Text("Create\nAccount",style: TextStyle(fontSize: 55),),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.30,
              left: 30,right: 30),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade500,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.black))
                        ,enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black)
                    ),
                        hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                    )),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade500,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black))
                        ,enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade500,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black))
                        ,enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                        )),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Sign Up',style:
                    TextStyle(fontSize: 30,color: Colors.black,
                        fontWeight: FontWeight.w400),),
                    IconButton(onPressed: signup,
                      icon: Icon(Icons.arrow_forward,size: 40,color: Colors.black,),
                    )],

                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(

                    children: [
                    TextButton(onPressed: (){},
                        child: Text('Sign in',
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.w400,color: Colors.black),))
                  ],)

                ],
              ),


            ),
          )
        ],
        ),

      );

  }
}
