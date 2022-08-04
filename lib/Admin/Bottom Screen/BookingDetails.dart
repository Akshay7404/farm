// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
      body: Container(),
    );
  }
}
