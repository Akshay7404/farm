// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class EditProfile_Admin extends StatefulWidget {
  const EditProfile_Admin({Key? key}) : super(key: key);

  @override
  State<EditProfile_Admin> createState() => _EditProfile_AdminState();
}

class _EditProfile_AdminState extends State<EditProfile_Admin> {
  BuildContext? secondcontax;
  File? image;
  String? imagePath;

  final UserNameController = TextEditingController();
  final EmailController = TextEditingController();
  final PhoneNumberController = TextEditingController();
  final DateController = TextEditingController();
  final AddressController = TextEditingController();

  final _form = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontFamily: 'NotoSans-Bold', color: Colors.black),
        ),
        titleSpacing: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                      child: Image.asset(
                                    "assets/image/ic_effiletower.jpeg",
                                    fit: BoxFit.fill,
                                  )),
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
                                                    margin: EdgeInsets.only(
                                                        top: 16),
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
                  heightSpace(30),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("User Name", style: normalStyle)),
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
                        textEditingController: UserNameController,
                        hintText: "Enter your name",
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                        },
                      )),
                  heightSpace(15),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Your email", style: normalStyle)),
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
                  heightSpace(15),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Phone number", style: normalStyle)),
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
                        textEditingController: PhoneNumberController,
                        hintText: "Enter your phone number",
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                        },
                      )),
                  heightSpace(15),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Date of Birth",
                          style: TextStyle(color: Colors.grey))),
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
                      textEditingController: DateController,
                      hintText: "Enter your birth of date",
                      isReadOnly: true,
                      click: () async {
                        var dateToday = DateTime.now();
                        datePickerPopup(context, startingDate: dateToday)
                            .then((value) {
                          if (value != null) {
                            DateController.text = formatDate(dateTime: value);
                            print("${DateController.text}");
                          }
                        });
                      },
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your birth of date';
                        }
                      },
                    ),
                  ),
                  heightSpace(15),
                  Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text("Address",
                          style: TextStyle(color: Colors.grey))),
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
                      textEditingController: AddressController,
                      hintText: "Enter your address",
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  BouncingWidget(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                      } else {
                        null;
                      }
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        color: rPrimarycolor,
                      ),
                      child: Center(
                        child: Text("Update", style: buttonStyle),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}