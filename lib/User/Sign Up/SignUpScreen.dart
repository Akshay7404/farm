// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Model/FarmOwner_model.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmOwnerDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Home%20Page/BottomNavigationBar.dart';
import 'package:resortbooking/User/Login/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resortbooking/Model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  bool _passwordVisible = true;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign up', style: bigTitleStyle),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Text("First name", style: normalStyle)),
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
                      textEditingController: FirstNameController,
                      hintText: "Enter first name",
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter first name';
                        }
                      },
                    )),
                SizedBox(height: 15),
                Container(
                    padding: EdgeInsets.only(left: 18),
                    child: Text("Last name", style: normalStyle)),
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
                      textEditingController: LastNameController,
                      hintText: "Enter last name",
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter last name';
                        }
                      },
                    )),
                SizedBox(height: 15),
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
                    textEditingController: EmailController,
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
                SizedBox(height: 15),
                Container(
                    padding: EdgeInsets.only(left: 18),
                    child:
                        Text("Password", style: TextStyle(color: Colors.grey))),
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
                    textEditingController: PasswordController,
                    hintText: "Enter your password",
                    isPassword: _passwordVisible,
                    suffixIcon: IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: rPrimarycolor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 7) {
                        return ' Password Must be more than 7 charater';
                      }
                    },
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text("Register As:",
                        style: TextStyle(
                            fontSize: 17, fontFamily: 'NotoSans-Medium')),
                    widthSpace(10),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              activeColor: rPrimarycolor,
                              value: 1,
                              groupValue: id,
                              onChanged: (index) {
                                setState(() {
                                  id = 1;
                                });
                              }),
                          Text("User",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: 'NotoSans-Medium')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              activeColor: rPrimarycolor,
                              value: 2,
                              groupValue: id,
                              onChanged: (index) {
                                setState(() {
                                  id = 2;
                                });
                              }),
                          Text("Owner",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontFamily: 'NotoSans-Medium')),
                        ],
                      ),
                    ),
                  ],
                ),
                BouncingWidget(
                  onPressed: () {
                    if (_form.currentState!.validate() && id == 1) {
                      Signup(EmailController.text, PasswordController.text);
                    } else if (_form.currentState!.validate() && id == 2) {
                      FarmOwnerSignup(
                          EmailController.text, PasswordController.text);
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
                      child: Text("Sign up", style: buttonStyle),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Already have account?", style: normalStyle),
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontFamily: 'NotoSans-Medium',
                          color: rPrimarycolor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            pushReplacmentScreen(context, () => LoginScreen());
                          })
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int id = 0;
  final _auth = FirebaseAuth.instance;
  void Signup(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {UserDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  UserDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Usermodel usermodel = Usermodel();
    usermodel.UserId = user!.uid;
    usermodel.UserFName = FirstNameController.text;
    usermodel.UserLName = LastNameController.text;
    usermodel.UserEmail = user.email;
    usermodel.Password = PasswordController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(usermodel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

  void FarmOwnerSignup(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => FarmOwnerDetailsToFirestore())
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  FarmOwnerDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? farmowner = _auth.currentUser;
    FarmOwnermodel farmOwnermodel = FarmOwnermodel();
    farmOwnermodel.FarmOwnerId = farmowner!.uid;
    farmOwnermodel.FarmOwnerFName = FirstNameController.text;
    farmOwnermodel.FarmOwnerLName = LastNameController.text;
    farmOwnermodel.FarmOwnerEmail = farmowner.email;
    farmOwnermodel.FarmOwnerPassword = PasswordController.text;

    await firebaseFirestore
        .collection('farmOwnermodel')
        .doc(farmowner.uid)
        .set(farmOwnermodel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :)");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}
