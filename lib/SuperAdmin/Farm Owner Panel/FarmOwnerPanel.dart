// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmOwnerDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';

class FarmOwnerPanel extends StatefulWidget {
  const FarmOwnerPanel({Key? key}) : super(key: key);

  @override
  State<FarmOwnerPanel> createState() => _FarmOwnerPanelState();
}

class _FarmOwnerPanelState extends State<FarmOwnerPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () => pushScreen(context, () => FarmOwnerDetails()),
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
                        child: Image.asset('assets/image/man.png',
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("abcd abcd",
                              style: TextStyle(
                                fontFamily: 'NotoSans-Bold',
                              )),
                          Text("Abcd@gmail.com",
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
