// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/User%20Panel/UserDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('type', isEqualTo: 'User')
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
                  onTap: () =>
                      pushScreen(
                          context,
                              () =>
                              UserDetails(
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
                                  Text(document['UserFName'],
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
                        thinAppDevider(),

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
