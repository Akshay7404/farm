// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Booking/FarmBooking.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Farm%20Detail/details_farm.dart';
import 'package:resortbooking/User/Farm%20Detail/photos.dart';
import 'package:resortbooking/User/Farm%20Detail/reviews.dart';
import 'package:resortbooking/User/google%20map/GoogleMap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FarmHouseDetails.dart';
import 'VillaDetails.dart';

final List HotelImg = [
  'assets/image/bath.jpg',
  'assets/image/dinner.jpg',
  'assets/image/hall.jpg',
  'assets/image/pool.jpg',
  'assets/image/room.jpg',
];
bool ShowText = false;

Widget FarmDetails(PropertyModel propertyModel) {
  return StatefulBuilder(
    builder: (context, setState) => SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("${propertyModel.PropertyName}",
                    style:
                        TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 20)),
                Expanded(
                  child: Text("\₹${propertyModel.RentWeekDays}",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'NotoSans-Bold',
                      )),
                )
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Icon(Icons.location_on, color: rPrimarycolor),
                Text(
                  "${propertyModel.PropertyCity}",
                  overflow: TextOverflow.ellipsis,
                  style: normalStyle,
                ),
                widthSpace(3),
                Text(
                  "${propertyModel.PropertyState}",
                  overflow: TextOverflow.ellipsis,
                  style: normalStyle,
                ),
              ],
            ),
            heightSpace(5),
            thinAppDevider(),
            heightSpace(5),
            Text("Address",
                style: TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 16)),
            SizedBox(width: 3),
            Text("${propertyModel.PropertyAddress}",
                maxLines: ShowText ? 8 : 1, style: normalStyle),
            InkWell(
              onTap: () {
                setState(() {
                  ShowText = !ShowText;
                });
              },
              child: Row(children: [
                ShowText
                    ? Text(
                        "less",
                        style: TextStyle(color: rPrimarycolor),
                      )
                    : Text("read more", style: TextStyle(color: rPrimarycolor))
              ]),
            ),
            heightSpace(20),
            if (propertyModel.PropertyType == 'Villa')
              Villa_Details(propertyModel),
            if (propertyModel.PropertyType == 'Farm House')
              FarmHouse_Details(propertyModel),
            SizedBox(height: 20),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 25,
                      offset: const Offset(10, 10)),
                ],
              ),
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("8.8",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'NotoSans-Bold',
                              color: rPrimarycolor,
                            )),
                        SizedBox(width: 10),
                        Text(
                          "Overall Rating",
                          style: TextStyle(fontFamily: 'NotoSans-Medium'),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Room",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                        ),
                        Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.9,
                              valueColor: AlwaysStoppedAnimation(rPrimarycolor),
                              minHeight: 5,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Services",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                        ),
                        Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.8,
                              valueColor: AlwaysStoppedAnimation(rPrimarycolor),
                              minHeight: 5,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Location",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                        ),
                        Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.6,
                              valueColor: AlwaysStoppedAnimation(rPrimarycolor),
                              minHeight: 5,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Price",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                        ),
                        Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              valueColor: AlwaysStoppedAnimation(rPrimarycolor),
                              minHeight: 5,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            heightSpace(20),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Photo",
                    style:
                        TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
                Spacer(),
                InkWell(
                  onTap: () => pushScreen(context, () => Photos()),
                  child: Text(
                    "View All ",
                    style: TextStyle(
                        fontFamily: 'NotoSans-Bold', color: rPrimarycolor),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Row(
              children: [
                Text("Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'NotoSans-Bold',
                    )),
                Spacer(),
                InkWell(
                  onTap: () => pushScreen(context, () => reviews()),
                  child: Text(
                    "View All ",
                    style: TextStyle(
                        fontFamily: 'NotoSans-Bold', color: rPrimarycolor),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/image/person.jpg',
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Alexia jane",
                                style: TextStyle(
                                  fontFamily: 'NotoSans-Bold',
                                )),
                            Text("Last Update 21 May, 2022",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Medium',
                                    color: rGrey,
                                    fontSize: 13)),
                            Text("(8.0)",
                                style: TextStyle(
                                    fontFamily: 'NotoSans-Bold', fontSize: 16)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                      "This is located in a great spot to shops and bars, very quite location",
                      style: normalStyle),
                ],
              ),
            ),
            Divider(),
            Text("Rent & Fees",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            if (propertyModel.PropertyType == 'Villa' ||
                propertyModel.PropertyType == 'Cottage' ||
                propertyModel.PropertyType == 'Farm House')
              RentAndFees(propertyModel),
            heightSpace(10),
            Text("Features",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            Text("Amenities",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            if (propertyModel.PropertyType == 'Villa')
              Villa_Amenities(propertyModel),
            // if (propertyModel.PropertyType == 'Tent') Tent_Amenities(),
            // if (propertyModel.PropertyType == 'Cottage') Cottage_Amenities(),
            if (propertyModel.PropertyType == 'Farm House')
              Farm_Amenities(propertyModel),
            heightSpace(10),
            Text("Facilities",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            if (propertyModel.PropertyType == 'Villa')
              Villa_Facilities(propertyModel),
            //   if (propertyModel.PropertyType == 'Tent') Tent_Facilities(),
            //   if (propertyModel.PropertyType == 'Cottage') Cottage_Facilities(),
            if (propertyModel.PropertyType == 'Farm House')
              Farm_Facilities(propertyModel),
            heightSpace(10),
            Text("Guidelines & Rules",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            if (propertyModel.PropertyType == 'Villa')
              Villa_Guidelines(propertyModel),
            // if (propertyModel.PropertyType == 'Tent') Tent_Guidelines(),
            // if (propertyModel.PropertyType == 'Cottage') Cottage_Guidelines(),
            if (propertyModel.PropertyType == 'Farm House')
              Farm_Guidelines(propertyModel),
            heightSpace(10),
            Text("Terms & Condition",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            Terms_condition(),
            heightSpace(10),
            Text("Canclellation Policy",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            CancleFarm(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox.fromSize(
                      size: Size(50, 50),
                      child: ClipOval(
                        child: Material(
                            color: Colors.grey.shade300,
                            child: InkWell(
                              onTap: () => pushScreen(context, () => GMap()),
                              child: Center(
                                child: FaIcon(FontAwesomeIcons.locationArrow),
                              ),
                            )),
                      ),
                    ),
                    heightSpace(5),
                    Text("Direction", style: TextStyle(fontSize: 14)),
                  ],
                ),
                widthSpace(40),
                Column(
                  children: [
                    SizedBox.fromSize(
                      size: Size(50, 50),
                      child: ClipOval(
                        child: Material(
                            color: Colors.grey.shade300,
                            child: InkWell(
                              onTap: CallHotel,
                              child: Center(
                                child: FaIcon(FontAwesomeIcons.phone),
                              ),
                            )),
                      ),
                    ),
                    heightSpace(5),
                    Text("Call hotel", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Center(
              child: BouncingWidget(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.teal.shade300),
                    child: Text("Book now", style: buttonStyle),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => farmBooking(
                        property: propertyModel,
                      ),
                    ));
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget Villa_Details(PropertyModel propertyModel) {
  return Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Icon(Icons.home, size: 30),
            Text("Type"),
            Text("${propertyModel.PropertyType}", style: normalStyle),
            heightSpace(10),
            Icon(Icons.bed, size: 30),
            Text("Bedrooms"),
            Text("${propertyModel.NumberOfBed}", style: normalStyle),
          ],
        ),
      ),
      Expanded(
          child: Column(
        children: [
          FaIcon(FontAwesomeIcons.arrows),
          Text("Farm size"),
          Text("${propertyModel.PropertySize}", style: normalStyle),
        ],
      )),
      Expanded(
          child: Column(
        children: [
          Icon(Icons.person, size: 30),
          Text("Guest Capacity"),
          Text("${propertyModel.GuestCapacity}", style: normalStyle),
          heightSpace(10),
          FaIcon(FontAwesomeIcons.personSwimming),
          Text("Swimming pool"),
          Text("${propertyModel.SwimmingPool}", style: normalStyle),
        ],
      )),
    ],
  );
}

Widget Terms_condition() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Terms_condition_item("Any Breakages will be charged separately."),
      Terms_condition_item("Do not Damage flower and trees."),
      Terms_condition_item(
          "Do not spit anyware and do not throw garbage anyware."),
      Terms_condition_item(
          "Do not garbage in the bath and do not wash with shop-shampoo."),
      Terms_condition_item("Do not go in to the house with wet clothes."),
      Terms_condition_item(
          "While leaving, fill the garbage bag and put it outside."),
      Terms_condition_item("Be Careful not to damage electric item."),
    ],
  );
}

Widget Terms_condition_item(String Title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Flexible(child: Text(Title, style: normalStyle))
    ],
  );
}

Widget CancleFarm() {
  return Column(
    children: [
      CancleFarm_item(
          "in case of canclellation before the day, 0% amount will be refunded"),
      heightSpace(5),
      CancleFarm_item(
          "in case of canclellation before 3 day, 75% amount will be refunded"),
      heightSpace(5),
      CancleFarm_item(
          "in case of canclellation before 7 day, 90% amount will be refunded")
    ],
  );
}

Widget CancleFarm_item(String Title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Flexible(child: Text(Title, style: normalStyle))
    ],
  );
}

CallHotel() async {
  var url = Uri.parse("tel:9228217792");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget Facilities() {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Facilities_item("CCTV Camera"),
          Facilities_item("Kichen"),
          Facilities_item("Kichen Accessories"),
          Facilities_item("Security")
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Facilities_item("Chair"),
          Facilities_item("Free Parking"),
          Facilities_item("Ges Cylinder")
        ],
      ),
    )
  ]);
}

Widget Facilities_item(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: normalStyle)
    ],
  );
}
