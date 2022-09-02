// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:fluttertoast/fluttertoast.dart%20%20';
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
      body: Form(
        key: _form,
        child: Center(
          child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forgot Your Password?", style: bigTitleStyle),
                  SizedBox(height: 20),
                  Text(
                    "Enter your email to receive an email to reset your Password",
                    style: normalStyle,
                  ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Your email", style: normalStyle)),
                  SizedBox(height: 5),
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
                      textEditingController: email_control,
                      hintText: "Enter your email",
                      validation: (value) {
                        if (value != null) {
                          if (value.isValidEmail()) {
                            return null;
                          } else {
                            return 'Please enter valid email';
                          }
                        } else {
                          return 'Invalid email found';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  BouncingWidget(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        email_check();
                        ForgotPassword();
                      } else {
                        null;
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        color: rPrimarycolor,
                      ),
                      child: Center(
                        child: Text("Send", style: buttonStyle),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  bool emailvalid = false;
  bool passvalid = false;
  final email_control = TextEditingController();

  final _form = GlobalKey<FormState>();

  void email_check() {
    setState(() {
      emailvalid = _form.currentState!.validate();
    });
  }

  Future ForgotPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email_control.text);
      Fluttertoast.showToast(msg: 'Reset password link has sent your mail');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
