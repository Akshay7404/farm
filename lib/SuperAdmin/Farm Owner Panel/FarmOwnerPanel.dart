// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmOwnerDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FarmOwnerPanel extends StatefulWidget {
  const FarmOwnerPanel({Key? key}) : super(key: key);

  @override
  State<FarmOwnerPanel> createState() => _FarmOwnerPanelState();
}

class _FarmOwnerPanelState extends State<FarmOwnerPanel> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("type", isEqualTo: 'Owner')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                Usermodel Model =
                Usermodel.fromMap(document.data() as Map<String, dynamic>);

                return InkWell(
                  onTap: () => pushScreen(
                      context,
                          () => FarmOwnerDetails(
                        usermodel: Model,
                      )),
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
                                child: Image.network(
                                    document['ProfilePic'.toString()],
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      document['UserFName'] +
                                          " " +
                                          document['UserLName'],
                                      style: TextStyle(
                                        fontFamily: 'NotoSans-Bold',
                                      )),
                                  Text(document['UserEMail'],
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
                );
              }).toList(),
            );
          }),
    );
  }
}
