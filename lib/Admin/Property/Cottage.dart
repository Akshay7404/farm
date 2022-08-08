// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';

Widget Cottage() {
  return StatefulBuilder(
    builder: (context, setState) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Number Of Bedrooms", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: guestCapacity,
            hintText: "Enter Number Of Bedrooms",
            keyboardType: TextInputType.phone,
            validation: (value) {
              if (value!.isEmpty) {
                return 'Enter Number Of Bedrooms';
              }
            },
          ),
        ),
        heightSpace(15),
        Text("Guest Capacity", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
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
        Text("Swimming Pool", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
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
        Text("Property Size", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
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
            textEditingController: RentWeekdays,
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
            textEditingController: RentWeekends,
            hintText: "24 Hours Rent",
            keyboardType: TextInputType.phone,
            validation: (value) {
              if (value!.isEmpty) {
                return 'Enyer foe Weekends / Holidays';
              }
            },
          ),
        ),
        heightSpace(20),
        Text("Allow additional guests", style: normalStyle),
        Row(
          children: [
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
                  Text("Yes", style: normalStyle)
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
                  Text("No", textAlign: TextAlign.start, style: normalStyle)
                ],
              ),
            ),
          ],
        ),
        Text("Additional Guests Charge", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: AdditionalGuestCharge,
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
        Text("Cleaning Fees", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: CleaningFees,
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
            textEditingController: SecurityDeposit,
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
          ],
          values: List.generate(12, (index) => index),
          groupStyle: GroupStyle(
            activeColor: rPrimarycolor,
            groupTitleStyle: TextStyle(fontFamily: 'NotoSans-Medium'),
          ),
          groupTitle: "Facilities",
          checkFirstElement: false,
          helperGroupTitle: true,
          onItemSelected: (data) {
            print(data);
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
            values: List.generate(9, (index) => index),
            groupStyle: GroupStyle(
              activeColor: rPrimarycolor,
              groupTitleStyle: TextStyle(fontFamily: 'NotoSans-Medium'),
            ),
            groupTitle: "Amenities",
            checkFirstElement: false,
            helperGroupTitle: true,
            onItemSelected: (data) {
              print(data);
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
          chipGroupStyle: ChipGroupStyle.minimize(
            backgroundColorItem: Colors.grey.shade400,
            selectedColorItem: rPrimarycolor,
            itemTitleStyle: TextStyle(
              fontSize: 14,
            ),
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
              textEditingController: AdditionalRule,
              hintText: "Enter Your Rules & Regulation",
              maxlines: 4,
              validation: (value) {
                if (value!.isEmpty) {
                  return 'Enter Additional Rules & Regulation';
                }
              },
            )),
      ],
    ),
  );
}

final guestCapacity = TextEditingController();
final numberofbed = TextEditingController();
final numberofbath = TextEditingController();
final numberofchair = TextEditingController();
final Swimmingpoll = TextEditingController();
final farmsize = TextEditingController();
final RentWeekdays = TextEditingController();
final RentWeekends = TextEditingController();
final AdditionalGuestCharge = TextEditingController();
final CleaningFees = TextEditingController();
final SecurityDeposit = TextEditingController();
final AdditionalRule = TextEditingController();
int id = 0;
bool check = false;
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);
