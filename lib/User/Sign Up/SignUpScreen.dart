// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, curly_braces_in_flow_control_structures, sort_child_properties_last

import 'dart:io';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final PhoneNumberController = TextEditingController();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  final _form = GlobalKey<FormState>();
  BuildContext? secondcontax;
  File? image;
  String? imagePath;
  bool _passwordVisible = true;
  @override
  void initState() {
    _passwordVisible = false;
  }
  String? Register;
  GroupController controller = GroupController();
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
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        child: image != null
                            ? Container(
                                height: 250,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(150),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        offset: const Offset(5, 5)),
                                  ],
                                ),
                                child: ClipOval(
                                    child: Image.file(
                                  image!,
                                  fit: BoxFit.fill,
                                )),
                              )
                            : Container(
                                height: 300,
                                width: 500,
                                child: ClipOval(
                                    child: Icon(Icons.person, size: 60)),
                              ),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          child: CircleAvatar(
                            backgroundColor: rPrimarycolor,
                            radius: 20,
                            child: Container(
                                child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            )),
                          ),
                          onTap: () {
                            showGeneralDialog(
                              barrierLabel: "Label",
                              barrierDismissible: true,
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionDuration: Duration(milliseconds: 700),
                              context: context,
                              pageBuilder: (context, anim1, anim2) {
                                return Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 176,
                                    child: Material(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(top: 16),
                                                  child: Text(
                                                    "Choose an action",
                                                    style: TextStyle(
                                                        color: rGrey,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                      onTap: () async {
                                                        await pickCameraImage();
                                                      },
                                                      child: Icon(
                                                        Icons.camera,
                                                        size: 50,
                                                        color: rPrimarycolor,
                                                      )),
                                                  heightSpace(5),
                                                  Text(
                                                    "Camera",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              widthSpace(40),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.photo,
                                                      size: 50,
                                                      color: rPrimarycolor,
                                                    ),
                                                    onTap: () async {
                                                      await pickImage();
                                                    },
                                                  ),
                                                  heightSpace(5),
                                                  Text(
                                                    "Gallery",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      //borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                                );
                              },
                              transitionBuilder:
                                  (context, anim1, anim2, child) {
                                secondcontax = context;
                                return SlideTransition(
                                  position: Tween(
                                          begin: Offset(0, 1),
                                          end: Offset(0, 0))
                                      .animate(anim1),
                                  child: child,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
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
                    child: Text("Your Phone Number", style: normalStyle)),
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
                      keyboardType: TextInputType.phone,
                      textEditingController: PhoneNumberController,
                      hintText: "Enter your phone number",
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter phone number';
                        }
                      },
                    )),
                heightSpace(20),
                CSCPicker(
                  onCountryChanged: (String value) {
                    countryValue = value;
                  },
                  onStateChanged: (value) {
                    stateValue = value;
                  },
                  onCityChanged: (value) {
                    cityValue = value;
                  },
                ),
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
                          SimpleGroupedChips(
                            controller: controller,
                            values: ['User', 'Owner'],
                            itemTitle: ['User', 'Owner'],
                            chipGroupStyle: ChipGroupStyle.minimize(
                              backgroundColorItem: Colors.grey.shade400,
                              selectedColorItem: rPrimarycolor,
                              itemTitleStyle: TextStyle(fontSize: 16),
                            ),
                            onItemSelected: (selected) {
                              Register = selected;  
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BouncingWidget(
                  onPressed: () {
                    if (image == null) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text(
                                  "Please set profile picture",
                                  style: TextStyle(fontFamily: 'NotoSans-Bold'),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(color: rPrimarycolor),
                                      ))
                                ],
                              ));
                    } else {
                      if (_form.currentState!.validate()) {
                        loading
                            ? Signup(
                                EmailController.text, PasswordController.text)
                            : Center(
                                child: CircularProgressIndicator(
                                    color: rPrimarycolor));
                      } 
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
                    TextSpan(
                        text: "Already have account? ", style: normalStyle),
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

  bool loading = true;
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
    final userid = user!.uid;
    Usermodel usermodel = Usermodel();
    UploadTask task = FirebaseStorage.instance
        .ref('ProfilePic')
        .child(userid)
        .child(usermodel.UserId.toString())
        .putFile(image!);

    TaskSnapshot snapshot = await task;
    String? Imageurl = await snapshot.ref.getDownloadURL();

    usermodel.UserId = userid;
    usermodel.ProfilePic = Imageurl;
    usermodel.UserFName = FirstNameController.text;
    usermodel.UserLName = LastNameController.text;
    usermodel.PhoneNumber = PhoneNumberController.text;
    usermodel.Country = countryValue.toString();
    usermodel.State = stateValue.toString();
    usermodel.City = cityValue.toString();
    usermodel.UserEmail = user.email;
    usermodel.Password = PasswordController.text;
    usermodel.type = Register.toString();

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

  // void FarmOwnerSignup(String email, String password) async {
  //   await _auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) => FarmOwnerDetailsToFirestore())
  //       .catchError((e) {
  //     Fluttertoast.showToast(msg: e!.message);
  //   });
  // }

  // FarmOwnerDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? farmowner = _auth.currentUser;
  //   final farmownerid = farmowner!.uid;
  //   FarmOwnermodel farmOwnermodel = FarmOwnermodel();
  //   UploadTask task = FirebaseStorage.instance
  //       .ref('AdminProfilePic')
  //       .child(farmownerid)
  //       .child(farmOwnermodel.FarmOwnerId.toString())
  //       .putFile(image!);

  //   TaskSnapshot snapshot = await task;
  //   String? imageUrl = await snapshot.ref.getDownloadURL();

  //   farmOwnermodel.FarmOwnerId = farmowner.uid;
  //   farmOwnermodel.ProfilePic = imageUrl;
  //   farmOwnermodel.FarmOwnerFName = FirstNameController.text;
  //   farmOwnermodel.FarmOwnerLName = LastNameController.text;
  //   farmOwnermodel.PhoneNumber = PhoneNumberController.text;
  //   farmOwnermodel.Country = countryValue.toString();
  //   farmOwnermodel.State = stateValue.toString();
  //   farmOwnermodel.City = cityValue.toString();
  //   farmOwnermodel.FarmOwnerEmail = farmowner.email;
  //   farmOwnermodel.FarmOwnerPassword = PasswordController.text;

  //   await firebaseFirestore
  //       .collection('farmOwner')
  //       .doc(farmowner.uid)
  //       .set(farmOwnermodel.toMap());

  //   Fluttertoast.showToast(msg: "Account created successfully :) ");

  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => LoginScreen(),
  //       ),
  //       (route) => false);
  //   setState(() {
  //     loading = false;
  //   });
  // }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
