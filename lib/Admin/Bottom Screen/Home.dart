// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/MyFarm/MyFarm.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleSpacing: 0,
          centerTitle: true,
          title: Text(
            "My Farm",
            style:
                TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            InkWell(
              onTap: () => pushScreen(context, () => MyFarm()),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 120,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(8, 8)),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Row(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Image.asset("assets/image/hotel.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Grand Royal Hotel",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Bold', fontSize: 16)),
                            Text(
                                "Featuring a fitness center, Garde Royal Park Hote is located in Sweden, 4.7 km",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Medium',
                                    color: rGrey,
                                    fontSize: 13)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
