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
            textEditingController: Slipingbeds,
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
          values: List.generate(10, (index) => index),
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
            itemsTitle: ["Wi-Fi", "Barbecue Area", "Garden", "Mosquito net"],
            values: List.generate(4, (index) => index),
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

final Slipingbeds = TextEditingController();
final guestCapacity = TextEditingController();
final RentWeekdays = TextEditingController();
final RentWeekends = TextEditingController();
final AdditionalRule = TextEditingController();
GroupController controller = GroupController();
GroupController multipleCheckController = GroupController(
  isMultipleSelection: true,
  initSelectedItem: List.generate(0, (index) => index),
);
