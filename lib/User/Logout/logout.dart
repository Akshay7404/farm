// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resortbooking/User/Login/LoginScreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Widget logout() {
  return StatefulBuilder(
    builder: (context, setState) => InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.19,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.grey.shade300),
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text("Are You Sure?",
                            textAlign: TextAlign.center, style: TitleStyle)),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text("You want to Sign Out.")),
                    thinAppDevider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:
                              Text("No", style: TextStyle(color: Colors.red)),
                        ),
                        Container(width: 1, height: 28, color: rGrey),
                        TextButton(
                            onPressed: () {
                              Logout_user(context);
                            },
                            child: Text("Yes",
                                style: TextStyle(color: Colors.green)))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.logout, color: rGrey),
            SizedBox(width: 15),
            Text("Log Out",
                style: TextStyle(
                  fontFamily: 'NotoSans-Medium',
                )),
          ],
        ),
      ),
    ),
  );
}

final storage = FlutterSecureStorage();
Future Logout_user(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await storage.delete(key: "uid");
  pushScreen(context, () => LoginScreen());
}
