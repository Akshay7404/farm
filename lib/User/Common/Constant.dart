import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Color.dart';

SizedBox appDevider() {
  return SizedBox(
      child: Divider(
    color: rGrey,
    thickness: 1,
  ));
}

SizedBox thinAppDevider() {
  return SizedBox(
      child: Divider(
    color: rGrey,
    thickness: 0.3,
  ));
}

Widget heightSpace(double space) {
  return SizedBox(
    height: space,
  );
}

Widget widthSpace(double space) {
  return SizedBox(
    width: space,
  );
}

Widget BestDealCell({
  Image? image,
  String? hotelName,
  String? address,
  String? location,
  String? sublocation,
  String? price,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 10, offset: Offset(8, 8)),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: image,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${hotelName}",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold', fontSize: 16)),
                    Text("${address}",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Medium',
                            color: rGrey,
                            fontSize: 13),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: rPrimarycolor,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                "${location}",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Medium',
                                    color: rGrey,
                                    fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                              ),
                              widthSpace(3),
                              Flexible(
                                child: Text(
                                  "${sublocation}",
                                  style: TextStyle(
                                      fontFamily: 'NotoSans-Medium',
                                      color: rGrey,
                                      fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text("\₹" + "${price}",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: rPrimarycolor,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: rPrimarycolor,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: rPrimarycolor,
                          size: 16,
                        ),
                        Icon(
                          Icons.star,
                          color: rPrimarycolor,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 16,
                        ),
                        // Expanded(
                        //   child: Text(
                        //     "/per night",
                        //     textAlign: TextAlign.end,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(color: Colors.grey.shade500),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

const String appDateFormat = "dd-MM-yyyy";

Future<DateTime?> datePickerPopup(BuildContext context,
    {DateTime? startingDate, DateTime? endDate}) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: startingDate == null ? DateTime.now() : startingDate,
      lastDate: endDate == null ? DateTime(2025) : endDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: rPrimarycolor, // header background color
              // header text color
              // onSurface: Colors.green, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  primary: rPrimarycolor // button text color
                  ),
            ),
          ),
          child: child!,
        );
      });
}

String formatDate({String fomat = appDateFormat, DateTime? dateTime}) {
  if (dateTime != null) {
    return DateFormat(fomat).format(dateTime);
  } else {
    return "Invalid date found";
  }
}

void showToast(
    {required String text, ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: Colors.black12,
      textColor: Colors.black,
      fontSize: 16.0);
}
