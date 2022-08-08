// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget LogOutSuperAdmin() {
  return StatefulBuilder(
    builder: (context, setState) => Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.teal.shade50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          showDialog(
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
                                textAlign: TextAlign.center,
                                style: TitleStyle)),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text("You want to Log Out.")),
                        thinAppDevider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No",
                                  style: TextStyle(color: Colors.red)),
                            ),
                            Container(width: 1, height: 28, color: rGrey),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Yes",
                                    style: TextStyle(color: Colors.green)))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.black, size: 30),
            widthSpace(10),
            Text("Log Out", style: TextStyle(color: Colors.black, fontSize: 17))
          ],
        ),
      ),
    ),
  );
}
