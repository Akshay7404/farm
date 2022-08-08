// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';

class BookingHistory_Admin extends StatefulWidget {
  const BookingHistory_Admin({Key? key}) : super(key: key);

  @override
  State<BookingHistory_Admin> createState() => _BookingHistory_AdminState();
}

class _BookingHistory_AdminState extends State<BookingHistory_Admin> {
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
          "Farm Booking Details",
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
                          style: TextStyle(fontFamily: 'NotoSans-Bold')),
                      Text("AlexiaJane@gmail.com", style: normalStyle),
                      Text("+91 1234567890", style: normalStyle),
                      Text("Grand Royal Hotel",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("05-08-20022 to 07-08-2022",
                          style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                              color: rGrey,
                              fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
            thinAppDevider()
          ],
        ),
      ),
    );
  }
}
