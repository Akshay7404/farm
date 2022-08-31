// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/BookingDetails.dart';
import 'package:resortbooking/Admin/Logout/AdminLogOut.dart';
import 'package:resortbooking/Admin/Pricacy%20Policy/PrivicyPolicyAdmin.dart';
import 'package:resortbooking/Admin/Profile%20Screen/ChangePasswordAdmin.dart';
import 'package:resortbooking/Admin/Profile%20Screen/EditProfileAdmin.dart';
import 'package:resortbooking/Admin/Profile%20Screen/InviteFriend.dart';
import 'package:resortbooking/Admin/User%20Revirws/UserReview.dart';
import 'package:resortbooking/Model/FarmOwner_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Logout/logout.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("UserId", isEqualTo: user!.uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
                padding: EdgeInsets.zero,
                children: snapshot.data!.docs.map((document) {
                  Usermodel loggedInUser = Usermodel.fromMap(
                      document.data() as Map<String, dynamic>);

                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06,
                        left: 30,
                        right: 30),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                child: Container(
                                  height: 250,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            offset: const Offset(2, 3)),
                                      ]),
                                  child: ClipOval(
                                      child: Image.network(
                                    document['ProfilePic'.toString()],
                                    fit: BoxFit.fill,
                                  )),
                                ),
                                radius: 30),
                            widthSpace(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //heightSpace(10),
                                Row(
                                  children: [
                                    Text(document['UserFName'],
                                        style: TextStyle(
                                          fontFamily: 'NotoSans-Bold',
                                          fontSize: 20,
                                        )),
                                    Text(document['UserLName'],
                                        style: TextStyle(
                                          fontFamily: 'NotoSans-Bold',
                                          fontSize: 20,
                                        )),
                                  ],
                                ),
                                Text(document['PhoneNumber'],
                                    style: normalStyle),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: EditProfile_Admin(model: loggedInUser),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.edit, color: rGrey),
                                SizedBox(width: 15),
                                Text("Edit Profile",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: changePasswordAdmin(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.lock, color: rGrey),
                                SizedBox(width: 15),
                                Text("Change Password",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: UserReview(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.reviews, color: rGrey),
                                SizedBox(width: 15),
                                Text("User Reviews",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: BookingHistory_Admin(
                                    usermodel: loggedInUser),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_today, color: rGrey),
                                SizedBox(width: 15),
                                Text("Booking Details",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: inviteFriendAdmin(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.people_alt, color: rGrey),
                                SizedBox(width: 15),
                                Text("Invite Friends",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        InkWell(
                          onTap: () => pushNewScreen(
                            context,
                            screen: Privacy_Policy_Admin(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.privacy_tip, color: rGrey),
                                SizedBox(width: 15),
                                Text("Privacy Policy",
                                    style: TextStyle(
                                        fontFamily: 'NotoSans-Medium')),
                              ],
                            ),
                          ),
                        ),
                        thinAppDevider(),
                        Adminlogout(),
                        thinAppDevider(),
                      ],
                    ),
                  );
                }).toList());
          }),
    );
  }
}
