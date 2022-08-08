// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/User/Common/TextField.dart';

class UserReview extends StatefulWidget {
  const UserReview({Key? key}) : super(key: key);

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
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
          "User Review",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
                      Text("Last Update 21 May, 2022",
                          style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                              color: rGrey,
                              fontSize: 13)),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              "This is located in a great spot to shops and bars, very quite location",
              style: normalStyle,
            ),
            heightSpace(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(2, 2))
                    ]),
                    child: appTextField(
                        textEditingController: response,
                        hintText: "Enter Message"),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.paperPlane,
                        color: rPrimarycolor)),
                IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.trashCan, color: Colors.red))
              ],
            ),
            heightSpace(10),
            thinAppDevider()
          ],
        ),
      ),
    );
  }
}

final response = TextEditingController();
