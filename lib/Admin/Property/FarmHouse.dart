// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names
import 'dart:developer';

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget FarmHouse() {
  return StatefulBuilder(
    builder: (context, setState) =>
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Guest Capacity", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_guestCapacity,
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
      Text("Swimming Pool", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_Swimmingpoll,
          hintText: "Common / Private",
          validation: (value) {
            if (value!.isEmpty) {
              return 'Common / Private';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Property Size", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_farmsize,
          hintText: "Sq Feet / Sq Yard / Vigha ect.",
          validation: (value) {
            if (value!.isEmpty) {
              return 'Enter Farm Size';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Rent / Fees / Charges",
          style: TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
      heightSpace(15),
      Text("Rent for Weekdays", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_RentWeekdays,
          hintText: "24 Hours Rent",
          keyboardType: TextInputType.phone,
          validation: (value) {
            if (value!.isEmpty) {
              return 'Enter Rent for Weekdays';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Rent for Weekends / Holidays", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_RentWeekends,
          hintText: "24 Hours Rent",
          keyboardType: TextInputType.phone,
          validation: (value) {
            if (value!.isEmpty) {
              return 'Enter for Weekends / Holidays';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Allow additional guests", style: normalStyle),
      SimpleGroupedChips(
        controller: controller,
        values: ['yes', 'no'],
        itemTitle: ['yes', 'no'],
        chipGroupStyle: ChipGroupStyle.minimize(
          backgroundColorItem: Colors.grey.shade400,
          selectedColorItem: rPrimarycolor,
          itemTitleStyle: TextStyle(fontSize: 14),
        ),
        onItemSelected: ((selected) {
          additionalguest = selected;

          if (additionalguest == 'yes') {
            setState(
              () {
                Farmvisible = true;
                AdditionalGuestsCharge();
              },
            );
          } else {
            setState(() {
              Farmvisible = false;
            });
          }
        }),
      ),
      heightSpace(10),
      AdditionalGuestsCharge(),
      Text("Cleaning Fees", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_CleaningFees,
          hintText: "Per Stay Cleaning Fees (If Any)",
          keyboardType: TextInputType.phone,
          validation: (value) {
            if (value!.isEmpty) {
              return 'Enter Cleaning Fees';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Security Deposit", style: normalStyle),
      heightSpace(8),
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
        ]),
        child: appTextField(
          textEditingController: Farm_SecurityDeposit,
          hintText: "Security Deposit (If Any)",
          keyboardType: TextInputType.phone,
          validation: (value) {
            if (value!.isEmpty) {
              return 'Enter Security Fees';
            }
          },
        ),
      ),
      heightSpace(20),
      Text("Facilities & Amenities",
          style: TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
      heightSpace(15),
      SimpleGroupedCheckbox(
        controller: multipleCheckController,
        itemsTitle: [
          "Kichen",
          "Kichen Accessories",
          "Gas Cylinder",
          "Water Filter",
          "Table",
          "Chair",
          "Free Parking",
          "CCTV Camera",
          "Security",
          "Generator",
          "Fire Safety",
          "First Aid",
          "Caretaker / Captain"
        ],
        values: [
          "Kichen",
          "Kichen Accessories",
          "Gas Cylinder",
          "Water Filter",
          "Table",
          "Chair",
          "Free Parking",
          "CCTV Camera",
          "Security",
          "Generator",
          "Fire Safety",
          "First Aid",
          "Caretaker / Captain"
        ],
        groupStyle: GroupStyle(
          activeColor: rPrimarycolor,
          groupTitleStyle: TextStyle(fontFamily: 'NotoSans-Medium'),
        ),
        groupTitle: "Facilities",
        checkFirstElement: false,
        helperGroupTitle: true,
        onItemSelected: (data) {
          setState(() {
            Farm_Facilities_data = data;
          });
        },
        isExpandableTitle: true,
      ),
      heightSpace(10),
      SimpleGroupedCheckbox(
          controller: multipleCheckController,
          itemsTitle: [
            "Air Conditioning",
            "TV",
            "Refrigerator",
            "Microwave",
            "Wi-Fi",
            "Barbecue Area",
            "Garden",
            "Gym",
            "Swimming Pool",
          ],
          values: [
            "Air Conditioning",
            "TV",
            "Refrigerator",
            "Microwave",
            "Wi-Fi",
            "Barbecue Area",
            "Garden",
            "Gym",
            "Swimming Pool",
          ],
          groupStyle: GroupStyle(
            activeColor: rPrimarycolor,
            groupTitleStyle: TextStyle(fontFamily: 'NotoSans-Medium'),
          ),
          groupTitle: "Amenities",
          checkFirstElement: false,
          helperGroupTitle: true,
          onItemSelected: (data) {
            setState(() {
              Farm_Amenities_data = data;
            });
          },
          isExpandableTitle: true),
      heightSpace(20),
      Text("Terms & Rules",
          style: TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
      heightSpace(5),
      SimpleGroupedChips(
        controller: multipleCheckController,
        values: [
          'Smoking Allowed',
          'Non-Veg Allowed',
          'Party Allowed',
          'Alcohol Allowed',
          'Pets Allowed'
        ],
        itemTitle: [
          "Smoking Allowed",
          'Non-Veg Allowed',
          'Party Allowed',
          'Alcohol Allowed',
          'Pets Allowed'
        ],
        onItemSelected: (selected) => setState(() {
          Farm_Terms_and_Ruls = selected;
        }),
        chipGroupStyle: ChipGroupStyle.minimize(
          backgroundColorItem: Colors.grey.shade400,
          selectedColorItem: rPrimarycolor,
          itemTitleStyle: TextStyle(fontSize: 14),
        ),
      ),
      heightSpace(20),
      Text("Additional Rules Information (Optional)", style: normalStyle),
      heightSpace(8),
      Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: Farm_AdditionalRule,
            hintText: "Enter Your Rules & Regulation",
            maxlines: 4,
            validation: (value) {
              if (value!.isEmpty) {
                return 'Enter Additional Rules & Regulation';
              }
            },
          )),
    ]),
  );
}

String? additionalguest;
final Farm_guestCapacity = TextEditingController();
final Farm_numberofbed = TextEditingController();
final Farm_numberofbath = TextEditingController();
final Farm_numberofchair = TextEditingController();
final Farm_Swimmingpoll = TextEditingController();
final Farm_farmsize = TextEditingController();
final Farm_RentWeekdays = TextEditingController();
final Farm_RentWeekends = TextEditingController();
final Farm_AdditionalGuestCharge = TextEditingController();
final Farm_CleaningFees = TextEditingController();
final Farm_SecurityDeposit = TextEditingController();
final Farm_AdditionalRule = TextEditingController();
int id = 0;
List<String> Farm_Facilities_data = [];
List<String> Farm_Amenities_data = [];
List<String> Farm_Terms_and_Ruls = [];
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);

Widget AdditionalGuestsCharge() {
  return Farmvisible
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Additional Guests Charge", style: normalStyle),
            heightSpace(8),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(5, 5)),
              ]),
              child: appTextField(
                textEditingController: Farm_AdditionalGuestCharge,
                hintText: "Cost Per Additional Guest",
                keyboardType: TextInputType.phone,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Additional Guest Charge';
                  }
                },
              ),
            ),
            heightSpace(20),
          ],
        )
      : SizedBox();
}

bool Farmvisible = false;
