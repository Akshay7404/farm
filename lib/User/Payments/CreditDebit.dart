// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:intl/intl.dart';
import 'package:resortbooking/Model/PayonFarm.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Booking/ThankYouScreen.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreditDebit_Card extends StatefulWidget {
  final String date;
  final PropertyModel propertyModel;
  final disprise;
  final subtotal;
  final total;

  const CreditDebit_Card({
    Key? key,
    required this.date,
    required this.propertyModel,
    this.disprise,
    this.subtotal,
    this.total,
  }) : super(key: key);

  @override
  State<CreditDebit_Card> createState() => _CreditDebit_CardState();
}

class _CreditDebit_CardState extends State<CreditDebit_Card> {
  final TextEditingController CreditDebit_CardController =
      TextEditingController();
  final TextEditingController ExpDateController = TextEditingController();
  final TextEditingController CvvController = TextEditingController();

  @override
  void initState() {
    ExpDateController.text = "";
    selectdate = widget.date;
    property = widget.propertyModel;
    disamt = widget.disprise;
    subtotal = widget.subtotal;
    total = widget.total;

    super.initState();
  }

  var disamt;
  var subtotal;
  var total;
  PropertyModel property = PropertyModel();
  User? user = FirebaseAuth.instance.currentUser;
  String? selectdate;
  bool Check = false;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Card Number",
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'NotoSans-Bold')),
                SizedBox(height: 10),
                TextFormField(
                  controller: CreditDebit_CardController,
                  cursorColor: rPrimarycolor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "1000 2000 3000 4000",
                      prefixIcon: Icon(Icons.credit_card, color: rGrey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: rPrimarycolor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: rPrimarycolor))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter card number.';
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: ExpDateController,
                        cursorColor: rPrimarycolor,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "Exp. Date",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: rPrimarycolor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: rPrimarycolor))),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime(2101),
                              builder: (context, child) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: rPrimarycolor)),
                                    child: child!);
                              });

                          if (pickedDate != null) {
                            String formatedate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              ExpDateController.text = formatedate.toString();
                            });
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Expire date';
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: CvvController,
                        cursorColor: rPrimarycolor,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "CVV",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: rPrimarycolor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: rPrimarycolor))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter CVV';
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset("assets/image/ic_visa.png", height: 50),
                    SizedBox(width: 8),
                    Image.asset("assets/image/Mastercardlogo.png", height: 35),
                  ],
                ),
                heightSpace(10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Acknowledgement",
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'NotoSans-Bold')),
                      heightSpace(15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: Check,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.Check = value!;
                                  });
                                },
                                activeColor: rPrimarycolor,
                              ),
                            ),
                          ),
                          widthSpace(15),
                          Expanded(
                            child: Text(
                              "I agree with the Privacy Terms. By completing this booking, I agree with the Booking Conditions.",
                              style: normalStyle,
                              maxLines: 5,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                heightSpace(10),
                BouncingWidget(
                  onPressed: () {
                    if (_form.currentState!.validate() && Check == true) {
                      AddCredit_DebitonFirestore();

                      pushScreen(context, () => thankYouScreen());
                    } else {
                      showToast(text: "Please check Acknowledgement");
                    }
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.teal.shade300,
                      ),
                      child: Center(
                          child: Text("Add Credit card / Add Debit card",
                              style: buttonStyle))),
                ),
                heightSpace(20),
                Text("${selectdate}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String payment = "Credit card/Debit card";

  void AddCredit_DebitonFirestore() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      Usermodel model = Usermodel.fromMap(value.data() as Map<String, dynamic>);

      PaymentProoerty AddCreditDebit = PaymentProoerty(
          PaymentMethod: payment,
          selectdate: selectdate,
          Email: model.UserEmail,
          Name: model.UserFName,
          PhoneNumber: model.PhoneNumber,
          PropertyAddress: property.PropertyAddress,
          PropertyName: property.PropertyName,
          PropertyPhone: property.PhoneNumber,
          subtotal: subtotal.toString(),
          Discount: disamt.toString(),
          total: total.toString(),
          PropertyId: property.OwnerId,
          Uid: model.UserId,
          profileUrl: model.ProfilePic);

      FirebaseFirestore.instance
          .collection('Payment')
          .add(AddCreditDebit.toMap());

      Fluttertoast.showToast(msg: "Payment Successfully :) ");
    });
  }
}
