// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Home%20Page/BottomNavigationBar.dart';
import 'package:resortbooking/User/Login/LoginScreen.dart';
import 'package:resortbooking/User/Splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortbooking/firebase_options.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {}

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: CheckLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            return SplashScreen();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return BottomNavigationBarMenu(index: 0);
        },
      ),
    );
  }
  
    final storage = FlutterSecureStorage();
  Future<bool> CheckLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) return false;
    return true;
  }
}
