// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Style.dart';

class reviews extends StatefulWidget {
  const reviews({Key? key}) : super(key: key);

  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reviews(20)",
                style:
                    TextStyle(fontSize: 18, fontFamily: 'NotoSans-ExtraBold')),
            Container(
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
                            Text("(8.0)",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Bold', fontSize: 16)),
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
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "Replay",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold', color: rPrimarycolor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
