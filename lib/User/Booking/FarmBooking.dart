// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Payments/Paypal.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:intl/intl.dart';
import '../Payments/CreditDebit.dart';
import '../Payments/PayOnFarm.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class farmBooking extends StatefulWidget {
  final PropertyModel property;

  const farmBooking({Key? key, required this.property}) : super(key: key);

  @override
  State<farmBooking> createState() => _farmBookingState();
}

class _farmBookingState extends State<farmBooking> {
  PropertyModel propertyModel = PropertyModel();

  @override
  void initState() {
    propertyModel = widget.property;
    getCurrentUser();
    
    super.initState();
  }

  String? prifix;
  List? contacts;
  final TextEditingController SelectDatecontroller = TextEditingController();

  final List HotelImg = [
    'assets/image/bath.jpg',
    'assets/image/dinner.jpg',
    'assets/image/hall.jpg',
    'assets/image/pool.jpg',
    'assets/image/room.jpg',
  ];
  int i = -1;
  late String dateCount;
  late String range;

  Widget select_date() {
    return SfDateRangePicker(
      showActionButtons: true,
      enablePastDates: false,
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
        if (range == null || SelectDatecontroller.text == null) {
          Fluttertoast.showToast(msg: "Please Select Date");
        } else {
          setState(() {
            SelectDatecontroller.text = range.toString();
            Navigator.pop(context);
          });
        }
      },
    );
  }

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
  User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;
  late Map<String, dynamic> userMap2;

  void getCurrentUser() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final User? user = FirebaseAuth.instance.currentUser;
    final uuid = user!.uid;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("UserId", isEqualTo: uuid)
        .get()
        .then((value) {
      setState(() {
        userMap2 = value.docs[0].data();
        isLoading = false;
      });
      print(userMap2);
    });
  }

  late String dateTime;

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
          "Book Farm House",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2,
                disableCenter: true,
                autoPlay: true,
              ),
              items: HotelImg.map((e) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(e, fit: BoxFit.fill)),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${propertyModel.PropertyName}",
                    style: TextStyle(fontSize: 20, fontFamily: 'NotoSans-Bold'),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: rPrimarycolor,
                        size: 16,
                      ),
                      Text("${propertyModel.PropertyCity}",
                          style: TextStyle(
                            fontFamily: 'NotoSans-Medium',
                          )),
                      widthSpace(3),
                      Text("${propertyModel.PropertyCity}",
                          style: TextStyle(
                            fontFamily: 'NotoSans-Medium',
                          )),
                      Expanded(
                        child: Text("\₹${propertyModel.RentWeekDays}",
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontFamily: 'NotoSans-Bold')),
                      )
                    ],
                  ),
                  heightSpace(15),
                  Text(
                    "Select Date",
                    style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold'),
                  ),
                  heightSpace(10),
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15,
                              offset: Offset(1.5, 1)),
                        ],
                      ),
                      child: appTextField(
                        textEditingController: SelectDatecontroller,
                        hintText: "Select Date",
                        isReadOnly: true,
                        suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: rGrey,
                            )),
                        click: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) =>
                                  SfDateRangePicker(
                                    showActionButtons: true,
                                    enablePastDates: false,
                                    allowViewNavigation: true,
                                    navigationMode:
                                        DateRangePickerNavigationMode.scroll,
                                    navigationDirection:
                                        DateRangePickerNavigationDirection
                                            .vertical,
                                    selectionColor: rPrimarycolor,
                                    rangeSelectionColor: Colors.teal.shade100,
                                    endRangeSelectionColor: rPrimarycolor,
                                    startRangeSelectionColor: rPrimarycolor,
                                    onSelectionChanged: onSelectionChanged,
                                    monthViewSettings:
                                        DateRangePickerMonthViewSettings(
                                            dayFormat: 'EEE',
                                            blackoutDates: [
                                          // DateTime.parse(dateTime
                                          //     .split(' ')
                                          //     .first
                                          //     .toString()
                                          //     .trim()),
                                          // DateTime.parse(dateTime
                                          //     .split(' ')
                                          //     .last
                                          //     .toString()
                                          //     .trim())
                                        ]),
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                    initialSelectedRange: PickerDateRange(
                                      DateTime.now()
                                          .subtract(const Duration(days: 0)),
                                      DateTime.now()
                                          .add(const Duration(days: 0)),
                                    ),
                                    cancelText: 'CANCEL',
                                    confirmText: 'OK',
                                    onCancel: () {
                                      SelectDatecontroller.text = "";
                                      Navigator.pop(context);
                                    },
                                    onSubmit: (Object) async {
                                      if (range == null ||
                                          SelectDatecontroller.text == null) {
                                        Fluttertoast.showToast(
                                            msg: "Please Select Date");
                                      } else {
                                        setState(() {
                                          SelectDatecontroller.text =
                                              range.toString();
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                  ));
                        },
                      )),
                  heightSpace(30),
                  Text("Payment Summary",
                      style:
                          TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
                  heightSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("\₹${propertyModel.RentWeekDays}",
                          style: TextStyle(fontFamily: 'NotoSans-Bold')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("- \$10",
                          style: TextStyle(fontFamily: 'NotoSans-Bold')),
                    ],
                  ),
                  thinAppDevider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("\$170",
                          style: TextStyle(fontFamily: 'NotoSans-Bold')),
                    ],
                  ),
                  heightSpace(30),
                  Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold'),
                  ),
                  heightSpace(15),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: rPrimarycolor)),
                    child: Row(
                      children: [
                        widthSpace(10),
                        Icon(Icons.credit_card, color: rGrey),
                        widthSpace(15),
                        Text("Credit card/debit card",
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'NotoSans-Medium')),
                        Spacer(),
                        Radio(
                            activeColor: rPrimarycolor,
                            value: 1,
                            groupValue: id,
                            onChanged: (index) {
                              setState(() {
                                id = 1;
                              });
                            }),
                      ],
                    ),
                  ),
                  heightSpace(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: rPrimarycolor)),
                    child: Row(
                      children: [
                        widthSpace(10),
                        Image.asset(
                          "assets/image/ic_visa.png",
                          height: 26,
                        ),
                        widthSpace(15),
                        Text("Pay on farm",
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'NotoSans-Medium')),
                        Spacer(),
                        Radio(
                            activeColor: rPrimarycolor,
                            value: 2,
                            groupValue: id,
                            onChanged: (index) {
                              setState(() {
                                id = 2;
                              });
                            }),
                      ],
                    ),
                  ),
                  heightSpace(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: rPrimarycolor)),
                    child: Row(
                      children: [
                        widthSpace(10),
                        Image.asset(
                          "assets/image/ic_paypal.png",
                          height: 26,
                        ),
                        widthSpace(15),
                        Text("Paypal",
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'NotoSans-Medium')),
                        Spacer(),
                        Radio(
                            activeColor: rPrimarycolor,
                            value: 3,
                            groupValue: id,
                            onChanged: (index) {
                              setState(() {
                                id = 3;
                              });
                            }),
                      ],
                    ),
                  ),
                  heightSpace(30),
                  BouncingWidget(
                    onPressed: () async {
                      if (id == 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreditDebit_Card(),
                        ));
                      } else if (id == 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PayOnFarm()));
                      } else if (id == 3) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Paypal()));
                      } else {
                        showToast(text: "Please select payment method");
                      }

                      FirebaseFirestore.instance
                          .collection('users')
                          .doc("${user!.uid}")
                          .update({
                        'selectdate': SelectDatecontroller.text,
                      });
                      dateTime = userMap2['selectdate'];
                      print(dateTime);
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        color: rPrimarycolor,
                      ),
                      child: Center(
                        child: Text("Confirm Payment", style: buttonStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightSpace(100),
          ],
        ),
      ),
    );
  }
}
