// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/SuperAdmin/User%20Panel/UserDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () => pushScreen(context, () => UserDetails()),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/image/person.jpg',
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Alexia jane",
                              style: TextStyle(
                                fontFamily: 'NotoSans-Bold',
                              )),
                          Text("Alexiajane@gmail.com",
                              style: TextStyle(
                                  fontFamily: 'NotoSans-Medium',
                                  color: rGrey,
                                  fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                thinAppDevider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
