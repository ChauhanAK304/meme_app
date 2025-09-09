import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/controller/fetchMeme.dart';
import 'package:meme_app/controller/saveMyData.dart';
import 'package:meme_app/view/profileScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final user=FirebaseAuth.instance.currentUser;

  String imgUrl = "";
  int memeNo = 0;
  int targetMeme = 100;
  bool isLoading = true;

  // Real Meme API URL
  final String memeApiUrl = 'https://meme-api.com/gimme';

  @override
  void initState() {
    super.initState();
    initMemeState();
  }

  Future<void> initMemeState() async {
    int? storedMemeNo = await SaveMyData.fetchData();
    memeNo = storedMemeNo ?? 0;

    if (memeNo > 500) {
      targetMeme = 1000;
    } else if (memeNo > 100) {
      targetMeme = 500;
    }

    await updateImg();
  }

  Future<void> updateImg() async {
    setState(() {
      isLoading = true;
    });

    final memeData = await FetchMeme.getMemeData(memeApiUrl);

    if (memeData != null && memeData['url'] != null) {
      setState(() {
        imgUrl = memeData['url'];
        isLoading = false;
      });
    } else {
      setState(() {
        imgUrl = "";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile(),));
          }, icon: Icon(Icons.account_circle,size: 45,color: Colors.black,))
          
        ],

        backgroundColor: Colors.amber,


      ),
      backgroundColor: Colors.limeAccent.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 15),
            Text(
              "Meme #$memeNo",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              "Target $targetMeme Memes",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            isLoading
                ? SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
                : Image.network(
              imgUrl,
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                memeNo++;
                await SaveMyData.saveData(memeNo);
                await updateImg(); //
              },
              child:  SizedBox(
                height: 50,
                width: 150,
                child: Center(
                  child: Text(
                    "More Fun!!",
                    style: TextStyle(fontSize: 25,color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,),
             Text(
              "APP CREATED BY",
              style: TextStyle(fontSize: 20),
            ),
             Text(
              "AKSHAY CHAHUHAN",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}