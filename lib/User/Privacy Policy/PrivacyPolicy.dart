// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';


class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {
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
          "Privacy Policy",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Welcome to the privacy notice of The Farm House Booking, Hotels and Resorts.",
                style: normalStyle),
            heightSpace(10),
            Text(
                "The Farm House Booking respects your privacy and is committed to protecting your personal data. This privacy notice sets out information about how we treat your personal data, including when you visit our app.",
                style: normalStyle),
            heightSpace(15),
            Text("Table of Contents",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("1.Important information and who we are",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("2.The data we collect about you",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("3.How your personal data is collected",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("4.How we use your personal data",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("5.Disclosures of your personal data",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("6.Data security",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
            heightSpace(15),
            Text("7.Data retention",
                style: TextStyle(
                    fontFamily: 'NotoSans-bold', color: Colors.black)),
          ],
        ),
      )),
    );
  }
}
