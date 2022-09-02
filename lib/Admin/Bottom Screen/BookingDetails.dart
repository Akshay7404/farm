// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/temp.dart';
import 'package:resortbooking/Model/PayonFarm.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingHistory_Admin extends StatefulWidget {
  final Usermodel usermodel;

  const BookingHistory_Admin({Key? key, required this.usermodel})
      : super(key: key);

  @override
  State<BookingHistory_Admin> createState() => _BookingHistory_AdminState();
}

class _BookingHistory_AdminState extends State<BookingHistory_Admin> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel model = Usermodel();

  @override
  void initState() {
    model = widget.usermodel;
    super.initState();
  }

  PropertyModel propertyModel = PropertyModel();

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
            style:
                TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Payment').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot1) {
            if (snapshot1.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<PaymentProoerty?> list = snapshot1.data!.docs
                .map((document) => PaymentProoerty.fromMap(
                    document.data() as Map<String, dynamic>))
                .toList();

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                print("id" + "${list[index]?.PropertyId}");
                return list[index]?.PropertyId ==
                        FirebaseAuth.instance.currentUser!.uid
                    ? Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
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
                                    child: Image.network(
                                        "${list[index]?.profileUrl}",
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${list[index]?.Name}',
                                          style: TextStyle(
                                              fontFamily: 'NotoSans-Bold')),
                                      Text("${list[index]?.Email}",
                                          style: normalStyle),
                                      Text("${list[index]?.PhoneNumber}",
                                          style: normalStyle),
                                      Text("${list[index]?.PropertyName}",
                                          style: TextStyle(
                                              fontFamily: 'NotoSans-Medium')),
                                      Text("${list[index]?.selectdate}",
                                          style: TextStyle(
                                              fontFamily: 'NotoSans-Medium',
                                              color: rGrey,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            thinAppDevider(),
                            TextButton(
                                onPressed: () {
                                  pushScreen(context, () => temp());
                                },
                                child: Text("click me"))
                          ],
                        ),
                      )
                    : SizedBox();
              },
            );
          },
        ));
  }

  List<String> docid = [];
  FirebaseFirestore getid = FirebaseFirestore.instance;

  void get() async {
    final QuerySnapshot result = await getid.collection('users').get();
    documents = result.docs;
    documents.forEach((DOC) => docid.add(DOC.id));
    print(docid);
  }

  late final List<DocumentSnapshot> documents;
}
