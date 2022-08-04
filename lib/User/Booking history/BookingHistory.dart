// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';
import 'package:resortbooking/User/google%20map/GoogleMap.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
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
          "History",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/image/hotel.jpg',
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Grand Royal Hotel",
                                style: TextStyle(
                                  fontFamily: 'NotoSans-Bold',
                                )),
                            Text("29-07-2022 to 30-07-2022",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Medium',
                                    color: rGrey,
                                    fontSize: 13)),
                            Text("Wembly, London 2.0 k to city",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Medium',
                                    fontSize: 13)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox.fromSize(
                            size: Size(50, 50),
                            child: ClipOval(
                              child: Material(
                                  color: Colors.grey.shade300,
                                  child: InkWell(
                                    onTap: () =>
                                        pushScreen(context, () => GMap()),
                                    child: Center(
                                      child: FaIcon(
                                          FontAwesomeIcons.locationArrow),
                                    ),
                                  )),
                            ),
                          ),
                          heightSpace(5),
                          Text("Direction", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      widthSpace(40),
                      Column(
                        children: [
                          SizedBox.fromSize(
                            size: Size(50, 50),
                            child: ClipOval(
                              child: Material(
                                  color: Colors.grey.shade300,
                                  child: InkWell(
                                    onTap: CallHotel,
                                    child: Center(
                                      child: FaIcon(FontAwesomeIcons.phone),
                                    ),
                                  )),
                            ),
                          ),
                          heightSpace(5),
                          Text("Call hotel", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  heightSpace(20),
                  Row(children: [
                    Text("Total amount", style: normalStyle),
                    Spacer(),
                    Text("\$170"),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) => Total());
                        },
                        icon: Icon(Icons.arrow_forward_ios_outlined, size: 18))
                  ])
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }

  Widget Total() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Text("Payment Summary",
              style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
          heightSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: TextStyle(fontFamily: 'NotoSans-Medium')),
              Text("\$180", style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount", style: TextStyle(fontFamily: 'NotoSans-Medium')),
              Text("- \$10", style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
          thinAppDevider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontFamily: 'NotoSans-Medium')),
              Text("\$170", style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
        ],
      ),
    );
  }
}
