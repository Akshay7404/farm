// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resortbooking/Model/PayonFarm.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/User/Booking/ThankYouScreen.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:resortbooking/User/Booking/ThankYouScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PayOnFarm extends StatefulWidget {
  final String date;
  const PayOnFarm({Key? key, required this.date}) : super(key: key);

  @override
  State<PayOnFarm> createState() => _PayOnFarmState();
}

class _PayOnFarmState extends State<PayOnFarm> {
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final PhoneController = TextEditingController();
  final _form = GlobalKey<FormState>();
  String? selectdate;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    selectdate = widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          "Pay On Farm",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 25,
                          offset: Offset(10, 10)),
                    ],
                  ),
                  child: appTextField(
                    textEditingController: NameController,
                    hintText: "Enter your name",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                    },
                  )),
              heightSpace(15),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 25,
                          offset: Offset(10, 10)),
                    ],
                  ),
                  child: appTextField(
                    textEditingController: EmailController,
                    hintText: "Enter your email",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                    },
                  )),
              heightSpace(15),
              Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 25,
                          offset: Offset(10, 10)),
                    ],
                  ),
                  child: appTextField(
                    keyboardType: TextInputType.phone,
                    textEditingController: PhoneController,
                    hintText: "Enter your phone number",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone number';
                      }
                    },
                  )),
              Text("${selectdate}"),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BouncingWidget(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        AddPayOnFarmtoFirestore();
                        pushScreen(context, () => thankYouScreen());
                      } else {
                        null;
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(32)),
                        color: rPrimarycolor,
                      ),
                      child: Center(
                        child: Text("Submit", style: buttonStyle),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String payment = "Pay on Farm";
  void AddPayOnFarmtoFirestore() async {
    await FirebaseFirestore.instance
        .collection('Property')
        .doc(user!.uid)
        .get()
        .then((value) {
      PropertyModel model =
          PropertyModel.fromMap(value.data() as Map<String, dynamic>);

      PaymentProoerty addpayonfarm = PaymentProoerty(
          Name: NameController.text,
          Email: EmailController.text,
          PhoneNumber: PhoneController.text,
          selectdate: selectdate,
          PaymentMethod: payment,
          PropertyName: model.PropertyName,
          PropertyAddress: model.PropertyAddress,
          PropertyPhone: model.PhoneNumber);

      FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Payment')
          .add(addpayonfarm.toMap());

      Fluttertoast.showToast(msg: "Pay on farm successfully :) ");
    });
  }
}
