// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/AddFarm2.dart';
import 'package:resortbooking/Admin/Google%20map/GoogleMap.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';

class AddFarm extends StatefulWidget {
  const AddFarm({Key? key}) : super(key: key);

  @override
  State<AddFarm> createState() => _AddFarmState();
}

class _AddFarmState extends State<AddFarm> {
  final name_control = TextEditingController();
  final mobile_control = TextEditingController();
  final property_control = TextEditingController();
  final address_control = TextEditingController();
  final guestCapacity = TextEditingController();
  final numberofbed = TextEditingController();
  final numberofbath = TextEditingController();
  final numberofchair = TextEditingController();
  final Swimmingpoll = TextEditingController();
  final farmsize = TextEditingController();
  List<String> AreaList = [
    "Farm House",
    "Villa",
    "Service Apartment",
    "Resort",
    "Cottage",
    "Tent"
  ];
  String? selectedValue;
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
          "Add Farm",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your Property Details", style: TitleStyle),
                heightSpace(10),
                Text("Enter your name", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 25,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: name_control,
                    hintText: 'Full name',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      }
                    },
                  ),
                ),
                heightSpace(10),
                Text("Enter Your Mobile Number", style: normalStyle),
                widthSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: mobile_control,
                    hintText: 'Mobile Number',
                    keyboardType: TextInputType.number,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Mobile Number';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Property Information",
                    style:
                        TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
                heightSpace(15),
                Text("Property Name", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 25,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: property_control,
                    hintText: 'Farm House / Villa Name',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Property Name';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Row(
                  children: [
                    Text("Property Address", style: normalStyle),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: GMap_Address(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ).then((value) {
                          if (value != null) {
                            setState(() {
                              address_control.text = value;
                            });
                          }
                        });
                      },
                      child: Text("Pick From Map",
                          style: TextStyle(
                              color: rPrimarycolor,
                              fontFamily: 'NotoSans-Medium')),
                    )
                  ],
                ),
                heightSpace(8),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ]),
                    child: appTextField(
                      textEditingController: address_control,
                      hintText: 'Address',
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Property Address';
                        }
                      },
                    )),
                heightSpace(20),
                Text("Types of Property", style: normalStyle),
                heightSpace(8),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ]),
                    child: AreaItem()),
                heightSpace(20),
                Text("Guest Capacity", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: guestCapacity,
                    hintText: "Enter Number Of Guest Allowed",
                    keyboardType: TextInputType.phone,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Guest Capacity';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Number Of Beds", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: numberofbed,
                    hintText: "Enter Number Of Beds",
                    keyboardType: TextInputType.phone,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Number Of Beds';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Number Of Bathrooms", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: numberofbath,
                    hintText: "Enter Number Of Bathrooms",
                    keyboardType: TextInputType.phone,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Number Of Bathrooms';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Number Of Chairs", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: numberofchair,
                    hintText: "Enter Number Of Chairs",
                    keyboardType: TextInputType.phone,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Number Of Chairs';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Swimming Pool", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: Swimmingpoll,
                    hintText: "Common / Private",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Common / Private';
                      }
                    },
                  ),
                ),
                heightSpace(20),
                Text("Farm Size", style: normalStyle),
                heightSpace(8),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
                  ]),
                  child: appTextField(
                    textEditingController: farmsize,
                    hintText: "Sq Feet / Sq Yard / Vigha ect.",
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Farm Size';
                      }
                    },
                  ),
                ),
                BouncingWidget(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: rPrimarycolor,
                    ),
                    child: Center(
                      child: Text("Next", style: buttonStyle),
                    ),
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      pushScreen(context, () => AddFarm2());
                    } else
                      null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget AreaItem() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        hint: Text('Select Property', style: textfieldStyle),
        items: AreaList.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 14)),
            )).toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 50,
        buttonWidth: MediaQuery.of(context).size.width * 0.94,
        itemHeight: 40,
        buttonPadding: EdgeInsets.only(left: 20, right: 10),
      ),
    );
  }
}
