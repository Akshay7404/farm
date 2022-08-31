// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/PayonFarm.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';
import 'package:resortbooking/User/google%20map/GoogleMap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  User? user = FirebaseAuth.instance.currentUser;

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Payment')
            .where('Uid', isEqualTo: user!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((document) {
                PaymentProoerty paymentProoerty = PaymentProoerty.fromMap(
                    document.data() as Map<String, dynamic>);

                return Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(document['PropertyName'],
                                            style: TextStyle(
                                              fontFamily: 'NotoSans-Bold',
                                            )),
                                        Text(document['selectdate'],
                                            style: TextStyle(
                                                fontFamily: 'NotoSans-Medium',
                                                color: rGrey,
                                                fontSize: 13)),
                                        Text(document['PropertyAddress'],
                                            style: TextStyle(
                                                fontFamily: 'NotoSans-Medium',
                                                fontSize: 13,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            heightSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: rPrimarycolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.directions),
                                        widthSpace(3),
                                        Text("Direction")
                                      ],
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: rPrimarycolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.call),
                                        widthSpace(3),
                                        Text("Call Hotel")
                                      ],
                                    )),
                              ],
                            ),
                            Row(children: [
                              Text("Total amount", style: normalStyle),
                              Spacer(),
                              Text("₹" + document['total']),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Total(document));
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_outlined,
                                      size: 18))
                            ])
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  ),
                );
              }).toList());
        },
      ),
    );
  }

  Widget Total(QueryDocumentSnapshot<Object?> document) {
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
              Text("₹" + document['subtotal'],
                  style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount", style: TextStyle(fontFamily: 'NotoSans-Medium')),
              Text("-₹" + document['Discount'],
                  style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
          thinAppDevider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontFamily: 'NotoSans-Medium')),
              Text("₹" + document['total'],
                  style: TextStyle(fontFamily: 'NotoSans-Bold')),
            ],
          ),
        ],
      ),
    );
  }
}
