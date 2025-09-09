import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueAccent,
      ),
      body: Center(

        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w500,color: Colors.black),),
            SizedBox(height: 10,),
            CircleAvatar(
              child: Icon(Icons.account_circle,size: 100,color: Colors.deepOrangeAccent,),
              radius: 80,

              backgroundColor: Colors.greenAccent,
              
            ),
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [Icon(Icons.account_circle,size: 40,color: Colors.blueAccent,),
                SizedBox(width: 20,),
                Text("My Account",style: TextStyle(fontSize: 30,color: Colors.black),),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black,)],
              ),

            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [Icon(Icons.notifications_on_sharp,size: 40,color: Colors.blueAccent,),
                  SizedBox(width: 20,),
                  Text("Notification",style: TextStyle(fontSize: 30,color: Colors.black),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black,)],
              ),

            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [Icon(Icons.settings,size: 40,color: Colors.blueAccent,),
                  SizedBox(width: 20,),
                  Text("Settings",style: TextStyle(fontSize: 30,color: Colors.black),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black,)],
              ),

            ),SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [Icon(Icons.help,size: 40,color: Colors.blueAccent,),
                  SizedBox(width: 20,),
                  Text("Help Center",style: TextStyle(fontSize: 30,color: Colors.black),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black,)],
              ),

            ),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(right: 15,left: 15),
              child: Row(
                children: [Icon(Icons.logout_outlined,size: 40,color: Colors.blueAccent,),
                  SizedBox(width: 20,),
                  Text("Log Out",style: TextStyle(fontSize: 30,color: Colors.black),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,size: 30,color: Colors.black,)],
              ),

            ),
            SizedBox(height: 60,)
          ],
        ),
        ),
      );

  }
}
