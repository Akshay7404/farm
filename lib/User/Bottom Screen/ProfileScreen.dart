// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Booking%20history/BookingHistory.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Logout/logout.dart';
import 'package:resortbooking/User/Privacy%20Policy/PrivacyPolicy.dart';
import 'package:resortbooking/User/ProfileScreen/ChangePassword.dart';
import 'package:resortbooking/User/ProfileScreen/EditProfileScreen.dart';
import 'package:resortbooking/User/ProfileScreen/InviteFriend.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          child: Image.asset("assets/image/ic_effiletower.jpeg",
                              fit: BoxFit.fill)),
                    ),
                    radius: 30,
                  ),
                  widthSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //heightSpace(10),
                      Text("Akshay",
                          style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            fontSize: 20,
                          )),
                      Text("+91 1234567890", style: normalStyle),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: EditProfile(),
                      withNavBar: false,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit,
                        color: rGrey,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Edit Profile",
                          style: TextStyle(
                            fontFamily: 'NotoSans-Medium',
                          )),
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
                      screen: changePassword(),
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
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
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
                      screen: inviteFriend(),
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
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                    ],
                  ),
                ),
              ),
              thinAppDevider(),
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: BookingHistory(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.history, color: rGrey),
                      SizedBox(width: 15),
                      Text("Booking History",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                    ],
                  ),
                ),
              ),
              thinAppDevider(),
              InkWell(
                onTap: () => pushNewScreen(
                  context,
                  screen: Privacy_Policy(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.privacy_tip, color: rGrey),
                      SizedBox(width: 15),
                      Text("Privacy Policy",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                    ],
                  ),
                ),
              ),
              thinAppDevider(),
              logout(),
              thinAppDevider(),
            ],
          ),
        ),
      ),
    );
  }
}
