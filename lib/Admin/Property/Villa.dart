// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';

Widget Villa() {
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
            textEditingController: Villa_numberofbed,
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
            textEditingController: Villa_guestCapacity,
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
            textEditingController: Villa_Swimmingpoll,
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
            textEditingController: Villa_size,
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
            textEditingController: Villa_RentWeekdays,
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
            textEditingController: Villa_RentWeekends,
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
            villaadditionalguest = selected;

            if (villaadditionalguest == 'yes') {
              setState(
                () {
                  Villavisible = true;
                  VillaAdditionalGuestsCharge();
                },
              );
            } else {
              setState(() {
                Villavisible = false;
              });
            }
          }),
        ),
        heightSpace(10),
        VillaAdditionalGuestsCharge(),
        Text("Cleaning Fees", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: Villa_CleaningFees,
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
            textEditingController: Villa_SecurityDeposit,
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
              Villa_Facilities = data;
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
                Villa_Amenities = data;
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
            Villa_Terms_and_Ruls = selected;
          }),
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
              textEditingController: Villa_AdditionalRule,
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

final Villa_guestCapacity = TextEditingController();
final Villa_numberofbed = TextEditingController();
final Villa_numberofbath = TextEditingController();
final Villa_numberofchair = TextEditingController();
final Villa_Swimmingpoll = TextEditingController();
final Villa_size = TextEditingController();
final Villa_RentWeekdays = TextEditingController();
final Villa_RentWeekends = TextEditingController();
String? villaadditionalguest;
final Villa_AdditionalGuestCharge = TextEditingController();
final Villa_CleaningFees = TextEditingController();
final Villa_SecurityDeposit = TextEditingController();
final Villa_AdditionalRule = TextEditingController();
List<String> Villa_Facilities = [];
List<String> Villa_Amenities = [];
List<String> Villa_Terms_and_Ruls = [];
int id = 0;
bool check = false;
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);
Widget VillaAdditionalGuestsCharge() {
  return Villavisible
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
                textEditingController: Villa_AdditionalGuestCharge,
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

bool Villavisible = false;
