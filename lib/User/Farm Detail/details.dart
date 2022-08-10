// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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

final List HotelImg = [
  'assets/image/bath.jpg',
  'assets/image/dinner.jpg',
  'assets/image/hall.jpg',
  'assets/image/pool.jpg',
  'assets/image/room.jpg',
];
bool ShowText = false;
Widget FarmDetails() {
  return StatefulBuilder(
    builder: (context, setState) => SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Grand Royal Hotel",
                    style:
                        TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 20)),
                Expanded(
                  child: Text("\$180",
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
                Text("Wembley, London", style: normalStyle),
                Icon(
                  Icons.location_on,
                  color: rPrimarycolor,
                ),
                Text(
                  "2.0 km to city",
                  overflow: TextOverflow.ellipsis,
                  style: normalStyle,
                ),
                Expanded(
                  child: Text(
                    "/per night",
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: normalStyle,
                  ),
                )
              ],
            ),
            heightSpace(5),
            thinAppDevider(),
            heightSpace(5),
            Text("Summary",
                style: TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 16)),
            SizedBox(width: 3),
            Text(
                "Featuring a fitness center, Garde Royal Park Hote is located in Sweden, 4.7 km frome National Museum Garde Royal Park Hote is located in Sweden, 4.7 km frome National MuseumGarde Royal Park Hote is located in Sweden, 4.7 km frome National Museum",
                maxLines: ShowText ? 8 : 2,
                style: normalStyle),
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
            Container(
                child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(Icons.home, size: 30),
                      Text("Type"),
                      Text("Farm House", style: normalStyle),
                      heightSpace(10),
                      Icon(Icons.bed, size: 30),
                      Text("Bedrooms"),
                      Text("2 Bedrooms", style: normalStyle)
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Icon(Icons.person, size: 30),
                    Text("Guest Capacity"),
                    Text("15 Guests", style: normalStyle),
                    heightSpace(10),
                    FaIcon(FontAwesomeIcons.sink),
                    heightSpace(3),
                    Text("Bath Rooms"),
                    Text("2 Full", style: normalStyle)
                  ],
                ))
              ],
            )),
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
            Text("Details",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            Details(),
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
            RentAndFees(),
            heightSpace(10),
            Text("Features",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            Text("Amenities",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Amenities(),
            heightSpace(10),
            Text("Facilities",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Facilities(),
            heightSpace(10),
            Text("Guidelines & Rules",
                style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
            heightSpace(5),
            Guidelines(),
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
                      builder: (context) => farmBooking(),
                    ));
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget Guidelines() {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Guidelines_itm("No Alcohal Party"),
          Guidelines_itm("No Smokking"),
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Guidelines_itm("No pats"),
          Guidelines_itm("Non-veg not allowed")
        ],
      ),
    )
  ]);
}

Widget Guidelines_itm(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Flexible(child: Text(Title, style: normalStyle))
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

Widget Details() {
  return Column(
    children: [
      Details_item("Type:", "Farm Type"),
      Details_item("Size:", "400 Var"),
      Details_item("BathRooms:", "2"),
      Details_item("Beds:", "2"),
      Details_item("Guests:", "15"),
      Details_item("Swimming Pool:", "Private"),
      Details_item("Extra Beds:", "3")
    ],
  );
}

Widget Details_item(String Title, String SubTitle) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: TextStyle(fontWeight: FontWeight.w400)),
      widthSpace(3),
      Text(SubTitle, style: normalStyle)
    ],
  );
}

Widget RentAndFees() {
  return Column(children: [
    RentAndFees_item("24 Hours:", "RS.4500"),
    RentAndFees_item("Weekends:", "RS.6500"),
    RentAndFees_item("Security Deposit:", "RS.2000"),
    RentAndFees_item("Allow Additional Guests:", "Yes"),
  ]);
}

Widget RentAndFees_item(String Title, String SubTitle) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: TextStyle(fontWeight: FontWeight.w400)),
      widthSpace(3),
      Text(SubTitle, style: normalStyle)
    ],
  );
}

Widget Amenities() {
  return Row(children: [
    Expanded(
      child: Column(
        children: [
          Amenities_item("Air Conditioning"),
          Amenities_item("Garden")
        ],
      ),
    ),
    Expanded(
      child: Column(
        children: [
          Amenities_item("Refrigerator"),
          Amenities_item("Swimming pool")
        ],
      ),
    )
  ]);
}

Widget Amenities_item(String Title) {
  return Row(
    children: [
      Icon(Icons.arrow_forward_ios, color: rPrimarycolor, size: 15),
      Text(Title, style: normalStyle)
    ],
  );
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
