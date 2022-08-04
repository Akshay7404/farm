// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  late String Area;
  List<String> AreaList = [
    "Area 1",
    "Area 2",
    "Area 3",
    "Area 4",
    "Area 5",
    "Area 6",
    "Area 7",
    "Area 8",
    "Area 9",
    "Area 10",
    "Area 11",
    "Area 12",
    "Area 13",
  ];
  final TextEditingController SelectDatecontroller = TextEditingController();
  final TextEditingController SearchNameController = TextEditingController();

  final TextEditingController SelectAreaController = TextEditingController();
  late String dateCount;
  late String range;
  @override
  void initState() {
    dateCount = '';
    range = '';
    super.initState();
  }

  String? selectedValue;

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        range =
            DateFormat('dd-MM-yyyy').format(args.value.startDate).toString() +
                ' to ' +
                DateFormat('dd-MM-yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
        dateCount = args.value.length.toString();
      }
    });
  }

  int id = 0;
  RangeValues _currentRangeValues = const RangeValues(100, 100000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleSpacing: 0,
          title: Text(
            "Search Farm House",
            style:
                TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(5, 5)),
                          ],
                        ),
                        child: appTextField(
                            textEditingController: SearchNameController,
                            hintText: "Search by name")),
                    SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(5, 5)),
                          ],
                        ),
                        child: AreaItem()),
                    SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(5, 5)),
                          ],
                        ),
                        child: appTextField(
                          textEditingController: SelectDatecontroller,
                          hintText: "Select Date",
                          isReadOnly: true,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                color: rGrey,
                              )),
                          click: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    select_date());
                          },
                        )),
                    SizedBox(height: 20),
                    appDevider(),
                    Row(
                      children: [
                        Text("Price",
                            style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                            )),
                        Spacer(),
                        Text("RS. 100 - RS. 100000",
                            style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                            )),
                      ],
                    ),
                    SizedBox(height: 40),
                    RangeSlider(
                      activeColor: rPrimarycolor,
                      inactiveColor: Colors.grey,
                      values: _currentRangeValues,
                      min: 100,
                      max: 100000,
                      divisions: 1000,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Expanded(
                          child: Text(
                            "Price Low to High",
                            style: TextStyle(
                              fontFamily: 'NotoSans-Medium',
                            ),
                          ),
                        ),
                        Radio(
                          activeColor: rPrimarycolor,
                          groupValue: id,
                          onChanged: (index) {
                            setState(() {
                              id = 2;
                            });
                          },
                          value: 2,
                        ),
                        Expanded(
                          child: Text("Price High to Low",
                              style: TextStyle(
                                fontFamily: 'NotoSans-Medium',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    appDevider(),
                    SizedBox(height: 15),
                    Text("Filter By Ratings",
                        style: TextStyle(
                          fontFamily: 'NotoSans-Medium',
                        )),
                    SizedBox(height: 5),
                    RatingBar.builder(
                        glow: true,
                        unratedColor: Colors.black12,
                        allowHalfRating: true,
                        glowColor: rPrimarycolor,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, index) =>
                            Icon(Icons.star, color: rPrimarycolor),
                        onRatingUpdate: (rating) {
                          print(rating);
                        }),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                    child: Text("Reset",
                        style: TextStyle(
                          fontFamily: 'NotoSans-Medium',
                          fontSize: 18,
                          color: rPrimarycolor,
                        )),
                    onPressed: () {}),
                Spacer(),
                Expanded(
                  child: BouncingWidget(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.teal.shade300,
                          ),
                          child: Center(
                              child: Text(
                            "Apply Filter",
                            style: buttonStyle,
                          ))),
                      onPressed: () {}),
                ),
              ],
            )
          ]),
        ));
  }

  Widget select_date() {
    return SfDateRangePicker(
      showActionButtons: true,
      allowViewNavigation: true,
      navigationMode: DateRangePickerNavigationMode.scroll,
      navigationDirection: DateRangePickerNavigationDirection.vertical,
      selectionColor: rPrimarycolor,
      rangeSelectionColor: Colors.teal.shade100,
      endRangeSelectionColor: rPrimarycolor,
      startRangeSelectionColor: rPrimarycolor,
      onSelectionChanged: onSelectionChanged,
      monthViewSettings: DateRangePickerMonthViewSettings(dayFormat: 'EEE'),
      selectionMode: DateRangePickerSelectionMode.range,
      initialSelectedRange: PickerDateRange(
        DateTime.now().subtract(const Duration(days: 0)),
        DateTime.now().add(const Duration(days: 0)),
      ),
      cancelText: 'CANCEL',
      confirmText: 'OK',
      onCancel: () {
        SelectDatecontroller.text = "";
        Navigator.pop(context);
      },
      onSubmit: (Object) async {
        setState(() {
          SelectDatecontroller.text = range.toString();
          Navigator.pop(context);
        });
      },
    );
  }

  Widget AreaItem() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        hint: Text('Select Area', style: textfieldStyle),
        items: AreaList.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14),
              ),
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
