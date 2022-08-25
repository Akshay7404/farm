// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Home%20Page/NavigationBar.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Home%20Page/BottomNavigationBar.dart';
import 'package:resortbooking/User/Login/LoginScreen.dart';
import 'package:resortbooking/User/Splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resortbooking/firebase_options.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SuperAdmin/HomeScreen/SuperAdminHome.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e);
  }

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
          FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get()
              .then(
            (value) {
              Usermodel usermodel =
                  Usermodel.fromMap(value.data() as Map<String, dynamic>);
              print(usermodel.type);
              usermodel.type == "Owner"
                  ? pushScreen(context, () => NavigationBarMenu(index: 0))
                  : pushScreen(
                      context, () => BottomNavigationBarMenu(index: 0));
            },
          );
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;
  final storage = FlutterSecureStorage();
  Future<bool> CheckLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) return false;
    return true;
  }
}

var uuid = Uuid();
