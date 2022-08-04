// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import '../Common/Color.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {

  final PasswordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Change Password",
                  style: TextStyle(fontFamily: 'NotoSans-Bold',fontSize: 25),
                ),
                heightSpace(7),
                Text(
                  "Enter your new password and confirm your password",
                  style:normalStyle,
                ),
                heightSpace(15),
                Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Text("New Password",
                        style: normalStyle)),
                heightSpace(5),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 25,
                            offset: const Offset(10, 10)),
                      ],
                    ),
                    child: appTextField(
                      textEditingController: PasswordController,
                      hintText: "Enter new password",
                      validation: (value) {
                        if(value!.isEmpty){
                          return 'Please enter new password';
                        }
                      },
                    )
                ),
                heightSpace(15),
                Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Text("Confirm Password",
                        style: normalStyle)),
                heightSpace(5),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 25,
                            offset: const Offset(10, 10)),
                      ],
                    ),
                    child: appTextField(
                      textEditingController: ConfirmPasswordController,
                      hintText: "Enter Confirm Password",
                      validation: (value) {
                        if(value!.isEmpty){
                          return 'Please enter confirm password';
                        }
                      },
                    )
                ),
                heightSpace(15),
                BouncingWidget(
                  onPressed: () {
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40,right: 40,top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: rPrimarycolor,
                    ),
                    child: Center(
                      child: Text("Apply",
                          style: buttonStyle),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
