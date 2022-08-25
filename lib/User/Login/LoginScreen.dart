// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Home%20Page/NavigationBar.dart';
import 'package:resortbooking/Admin/Property/Cottage.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/HomeScreen/SuperAdminHome.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Forgot%20Password/ForgotPassword.dart';
import 'package:resortbooking/User/Home%20Page/BottomNavigationBar.dart';
import 'package:resortbooking/User/Sign%20Up/SignUpScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final email_control = TextEditingController();
  final pass_control = TextEditingController();
  final _form = GlobalKey<FormState>();
  String Admin_email = "admin@gmail.com";
  String Admin_Pass = "1234567";
  String owner_email = "owner@gmail.com";
  String owner_Pass = "1234567";
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: bigTitleStyle),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Your email",
                          style: TextStyle(color: Colors.grey))),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 25,
                            offset: Offset(10, 10)),
                      ],
                    ),
                    child: appTextField(
                      textEditingController: email_control,
                      hintText: "Enter your email",
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        if (value.isValidEmail()) {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Password",
                          style: TextStyle(color: Colors.grey))),
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
                      textEditingController: pass_control,
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
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          pushScreen(context, () => ForgotPassword());
                        },
                        child:
                            Text("Forgot Your Password?", style: normalStyle),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  BouncingWidget(
                    onPressed: () {
                      SignIn(email_control.text, pass_control.text);
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        color: rPrimarycolor,
                      ),
                      child: Center(
                        child: Text("Log in", style: buttonStyle),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: normalStyle),
                        SizedBox(width: 3),
                        GestureDetector(
                          onTap: () {
                            pushScreen(context, () => SignUpScreen());
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                              color: rPrimarycolor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool loading = true;
  final storage = FlutterSecureStorage();
  String? errorMessage;
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> SignIn(String email, String password) async {
    if (_form.currentState!.validate()) {
      try {
        UserCredential credential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        await storage.write(key: "uid", value: credential.user?.uid);
        User? user = await _auth.currentUser;

        await _firestore.collection('users').doc(user!.uid).get().then((val) {
          Usermodel loggedInUser =
              Usermodel.fromMap(val.data() as Map<String, dynamic>);

          loggedInUser.type == "Owner"
              ? pushScreen(context, () => NavigationBarMenu(index: 0))
              : pushScreen(context, () => BottomNavigationBarMenu(index: 0));
          ;
        });

        Fluttertoast.showToast(msg: "Login Sucessfully");
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
    setState(() {
      loading = false;
    });
  }
}
