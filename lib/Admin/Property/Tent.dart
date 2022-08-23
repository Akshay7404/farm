// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';

Widget Tent() {
  return StatefulBuilder(
    builder: (context, setState) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Number Of Slipingbed", style: normalStyle),
        heightSpace(8),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 20, offset: Offset(5, 5)),
          ]),
          child: appTextField(
            textEditingController: Tent_Slipingbeds,
            hintText: "Enter Number Of Slipingbed",
            keyboardType: TextInputType.phone,
            validation: (value) {
              if (value!.isEmpty) {
                return 'Enter Number Of Slipingbed';
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
            textEditingController: Tent_guestCapacity,
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
            textEditingController: Tent_RentWeekdays,
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
            textEditingController: Tent_RentWeekends,
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
        Text("Facilities & Amenities",
            style: TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
        heightSpace(15),
        SimpleGroupedCheckbox(
          controller: multipleCheckController,
          itemsTitle: [
            "Kichen",
            "Kichen Accessories",
            "Bathroom",
            "Gas Cylinder",
            "Table",
            "Chair",
            "Free Parking",
            "Generator",
            "Fire Safety",
            "First Aid",
          ],
          values: [
            "Kichen",
            "Kichen Accessories",
            "Bathroom",
            "Gas Cylinder",
            "Table",
            "Chair",
            "Free Parking",
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
              Tent_Facilities = data;
            });
          },
          isExpandableTitle: true,
        ),
        heightSpace(10),
        SimpleGroupedCheckbox(
            controller: multipleCheckController,
            itemsTitle: ["Wi-Fi", "Barbecue Area", "Garden", "Mosquito net"],
            values: ["Wi-Fi", "Barbecue Area", "Garden", "Mosquito net"],
            groupStyle: GroupStyle(
              activeColor: rPrimarycolor,
              groupTitleStyle: TextStyle(fontFamily: 'NotoSans-Medium'),
            ),
            groupTitle: "Amenities",
            checkFirstElement: false,
            helperGroupTitle: true,
            onItemSelected: (data) {
              setState(() {
                Tent_Amenities = data;
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
          onItemSelected: (selected) {
            setState(() {
              Tent_Terms_and_Ruls = selected;
            });
          },
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
              textEditingController: Tent_AdditionalRule,
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

final Tent_Slipingbeds = TextEditingController();
final Tent_guestCapacity = TextEditingController();
final Tent_RentWeekdays = TextEditingController();
final Tent_RentWeekends = TextEditingController();
final Tent_AdditionalRule = TextEditingController();
List<String> Tent_Facilities = [];
List<String> Tent_Amenities = [];
List<String> Tent_Terms_and_Ruls = [];
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);
