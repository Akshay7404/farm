// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';

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
            textEditingController: Cottage_numberofbed,
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
            textEditingController: Cottage_guestCapacity,
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
            textEditingController: Cottage_Swimmingpoll,
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
            textEditingController: Cottage_size,
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
            textEditingController: Cottage_RentWeekdays,
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
            textEditingController: Cottage_RentWeekends,
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
            cottageadditionalguest = selected;

            if (cottageadditionalguest == 'yes') {
              setState(
                () {
                  Cottagevisible = true;
                  CottageAdditionalGuestsCharge();
                },
              );
            } else {
              setState(() {
                Cottagevisible = false;
              });
            }
          }),
        ),
        heightSpace(10),
        CottageAdditionalGuestsCharge(),
        Text("Cleaning Fees", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: Cottage_CleaningFees,
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
            textEditingController: Cottage_SecurityDeposit,
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
              Cottage_Facilities = data;
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
                Cottage_Amenities = data;
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
            Cottage_Terms_and_Ruls = selected;
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
              textEditingController: Cottage_AdditionalRule,
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

String? cottageadditionalguest;
final Cottage_guestCapacity = TextEditingController();
final Cottage_numberofbed = TextEditingController();
final Cottage_numberofbath = TextEditingController();
final Cottage_numberofchair = TextEditingController();
final Cottage_Swimmingpoll = TextEditingController();
final Cottage_size = TextEditingController();
final Cottage_RentWeekdays = TextEditingController();
final Cottage_RentWeekends = TextEditingController();

final Cottage_AdditionalGuestCharge = TextEditingController();
final Cottage_CleaningFees = TextEditingController();
final Cottage_SecurityDeposit = TextEditingController();
final Cottage_AdditionalRule = TextEditingController();
List<String> Cottage_Facilities = [];
List<String> Cottage_Amenities = [];
List<String> Cottage_Terms_and_Ruls = [];
int id = 0;
bool check = false;
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);
Widget CottageAdditionalGuestsCharge() {
  return Cottagevisible
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
                textEditingController: Cottage_AdditionalGuestCharge,
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

bool Cottagevisible = false;
