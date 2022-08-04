// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/rendering.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Admin/Google%20map/GoogleMap.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';

class AddFarm2 extends StatefulWidget {
  const AddFarm2({Key? key}) : super(key: key);

  @override
  State<AddFarm2> createState() => _AddFarm2State();
}

class _AddFarm2State extends State<AddFarm2> with TickerProviderStateMixin {
  int id = 0;
  bool check = false;
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
    initSelectedItem: List.generate(0, (index) => index),
  );
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }

    setState(() {});
  }

  final _form = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  final RentWeekdays = TextEditingController();
  final RentWeekends = TextEditingController();
  final AdditionalGuestCharge = TextEditingController();
  final CleaningFees = TextEditingController();
  final SecurityDeposit = TextEditingController();
  final AdditionalRule = TextEditingController();
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
              Text("Rent / Fees / Charges",
                  style:
                      TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
              heightSpace(15),
              Text("Rent for Weekdays", style: normalStyle),
              heightSpace(8),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
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
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
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
                        Text("No",
                            textAlign: TextAlign.start, style: normalStyle)
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
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
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
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
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
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5)),
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
                  style:
                      TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
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
                values: List.generate(13, (index) => index),
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
                  style:
                      TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
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
              Text("Additional Rules Information (Optional)",
                  style: normalStyle),
              heightSpace(8),
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5)),
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
              heightSpace(20),
              Text("Property Photos",
                  style:
                      TextStyle(fontFamily: 'NotoSans-Medium', fontSize: 18)),
              Text("Upload Images", style: normalStyle),
              TextButton(
                child:
                    Text("Add Image", style: TextStyle(color: rPrimarycolor)),
                onPressed: () {
                  selectImages();
                },
              ),
              GridView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: imageFileList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
              BouncingWidget(
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    color: rPrimarycolor,
                  ),
                  child: Center(
                    child: Text("Submit", style: buttonStyle),
                  ),
                ),
                onPressed: () {
                  if (_form.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
