// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmOwnerPanel.dart';
import 'package:resortbooking/SuperAdmin/HomeScreen/LogOut.dart';
import 'package:resortbooking/SuperAdmin/Setting/Setting.dart';
import 'package:resortbooking/SuperAdmin/User%20Panel/UserPanel.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/main.dart';

class SuperAdminHome extends StatefulWidget {
  const SuperAdminHome({Key? key}) : super(key: key);

  @override
  State<SuperAdminHome> createState() => _SuperAdminHomeState();
}

class _SuperAdminHomeState extends State<SuperAdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleSpacing: 0,
          centerTitle: true,
          title: const Text(
            "Admin",
            style:
                TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
          ),
        ),
        drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('UserId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                    padding: EdgeInsets.zero,
                    children: snapshot.data!.docs.map(
                      (document) {
                        Usermodel model = Usermodel.fromMap(
                            document.data() as Map<String, dynamic>);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 280,
                              decoration: BoxDecoration(color: rPrimarycolor),
                              child: DrawerHeader(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 5,
                                                offset: const Offset(5, 5)),
                                          ]),
                                      child: ClipOval(
                                          child: Image.network(
                                              "${model.ProfilePic}",
                                              fit: BoxFit.fill)),
                                    ),
                                    heightSpace(5),
                                    Text(
                                      "${model.UserEmail}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'NotoSans-Medium',
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Button("User", Icons.person, () {
                              setState(() {
                                main = UserPanel();
                                Navigator.pop(context);
                              });
                            }),
                            Button("Farm Owner", Icons.home, () {
                              setState(() {
                                main = FarmOwnerPanel();
                                Navigator.pop(context);
                              });
                            }),
                            Button("Setting", Icons.settings, () {
                              pushScreen(context, () => Setting(model: model));
                            }),
                            LogOutSuperAdmin()
                          ],
                        );
                      },
                    ).toList());
              },
            )),
        body: main);
  }

  Widget main = Center(
      child: StatefulBuilder(
    builder: (context, setState) => Center(
      child: Image.asset("assets/image/welcome.png", height: 150),
    ),
  ));

  Widget Button(String Title, IconData icon, Function() ontap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: ontap,
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            widthSpace(10),
            Text(
              Title,
              style: TextStyle(fontSize: 17, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
