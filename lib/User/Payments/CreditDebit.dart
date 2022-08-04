// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:intl/intl.dart';
import 'package:resortbooking/User/Booking/ThankYouScreen.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';

class CreditDebit_Card extends StatefulWidget {
  const CreditDebit_Card({Key? key}) : super(key: key);

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
    super.initState();
  }

  bool Check = false;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Card Number",
                  style: TextStyle(fontSize: 18, fontFamily: 'NotoSans-Bold')),
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
               // margin: EdgeInsets.all(15),
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
                          flex:0,
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                          child: Text("I agree with the Privacy Terms. By completing this booking, I agree with the Booking Conditions.",
                              style: normalStyle,maxLines: 5,),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              heightSpace(10),
              BouncingWidget(
                onPressed: () {
                  if(Check == true)
                    {
                      pushScreen(context, () => thankYouScreen());
                    }
                  else{
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
            ],
          ),
        ),
      ),
    );
  }
}
