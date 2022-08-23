// ignore_for_file: prefer_const_constructors

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resortbooking/Admin/Property/Tent.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/User/Booking/FarmBooking.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';
import 'package:resortbooking/User/Farm%20Detail/details_farm.dart';
import 'package:resortbooking/User/Farm%20Detail/photos.dart';
import 'package:resortbooking/User/Farm%20Detail/reviews.dart';
import 'package:resortbooking/User/google%20map/GoogleMap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFarm extends StatefulWidget {
  final PropertyModel propertyModel;
  const MyFarm({Key? key, required this.propertyModel}) : super(key: key);

  @override
  State<MyFarm> createState() => _MyFarmState();
}

class _MyFarmState extends State<MyFarm> {
  final List HotelImg = [
    'assets/image/bath.jpg',
    'assets/image/dinner.jpg',
    'assets/image/hall.jpg',
    'assets/image/pool.jpg',
    'assets/image/room.jpg',
  ];
  int i = -1;
  FirebaseFirestore storage = FirebaseFirestore.instance;

  @override
  void initState() {
    propertyModel = widget.propertyModel;
    super.initState();
  }

  late PropertyModel propertyModel;
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
          "My Farm",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
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
                      : Text("read more",
                          style: TextStyle(color: rPrimarycolor))
                ]),
              ),
              heightSpace(20),
              if (propertyModel.PropertyType == 'Villa') Villa_Details(),
              if (propertyModel.PropertyType == 'Cottage') Cottage_Details(),
              if (propertyModel.PropertyType == 'Tent') Tent_Details(),
              if (propertyModel.PropertyType == 'Farm House') FarmHouse_Details(),
              SizedBox(height: 20),
              Text("Rent & Fees",
                  style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
              heightSpace(5),
              if (propertyModel.PropertyType == 'Villa' ||
                  propertyModel.PropertyType == 'Cottage' ||
                  propertyModel.PropertyType == 'Farm House')
                RentAndFees(),
              if (propertyModel.PropertyType == 'Tent') Tent_RentAndFees(),
              heightSpace(10),
              Text("Features",
                  style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
              heightSpace(5),
              Text("Amenities",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              if (propertyModel.PropertyType == 'Villa') Villa_Amenities(),
              if (propertyModel.PropertyType == 'Tent') Tent_Amenities(),
              if (propertyModel.PropertyType == 'Cottage') Cottage_Amenities(),
              if (propertyModel.PropertyType == 'Farm House') Farm_Amenities(),
              heightSpace(10),
              Text("Facilities",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              if (propertyModel.PropertyType == 'Villa') Facilities(),
              if (propertyModel.PropertyType == 'Tent') Tent_Facilities(),
              if (propertyModel.PropertyType == 'Cottage') Cottage_Facilities(),
              if (propertyModel.PropertyType == 'Farm House') Farm_Facilities(),
              heightSpace(10),
              Text("Guidelines & Rules",
                  style: TextStyle(fontSize: 16, fontFamily: 'NotoSans-Bold')),
              heightSpace(5),
              if (propertyModel.PropertyType == 'Villa') Villa_Guidelines(),
              if (propertyModel.PropertyType == 'Tent') Tent_Guidelines(),
              if (propertyModel.PropertyType == 'Cottage') Cottage_Guidelines(),
              if (propertyModel.PropertyType == 'Farm House') Farm_Guidelines(),
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
              Center(
                child: BouncingWidget(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.teal.shade300),
                      child: Text("Direction", style: buttonStyle),
                    ),
                    onPressed: () {
                      pushNewScreen(
                        context,
                        screen: GMap(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Villa_Details() {
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

  Widget FarmHouse_Details() {
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

  Widget Cottage_Details() {
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

  Widget Tent_Details() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Icon(Icons.home, size: 30),
              Text("Type"),
              Text("${propertyModel.PropertyType}", style: normalStyle),
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Icon(Icons.person, size: 30),
            Text("Guest Capacity"),
            Text("${propertyModel.GuestCapacity}", style: normalStyle),
          ],
        )),
      ],
    );
  }

  Widget Cottage_Guidelines() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![0]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![1]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![2]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![3]}"),
          ],
        ),
      )
    ]);
  }

  Widget Tent_Guidelines() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![0]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![1]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![2]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![3]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![4]}"),
          ],
        ),
      )
    ]);
  }

  Widget Villa_Guidelines() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![0]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![1]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![2]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![3]}"),
          ],
        ),
      )
    ]);
  }

  Widget Farm_Guidelines() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![0]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![1]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Guidelines_itm("${propertyModel.Terms_and_Ruls![2]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![3]}"),
            Guidelines_itm("${propertyModel.Terms_and_Ruls![4]}"),
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

  Widget Tent_RentAndFees() {
    return Column(children: [
      RentAndFees_item("24 Hours:", "${propertyModel.RentWeekDays}"),
      RentAndFees_item("Weekends:", "${propertyModel.RentWeekEnds}"),
    ]);
  }

  Widget RentAndFees() {
    return Column(children: [
      RentAndFees_item("24 Hours:", "${propertyModel.RentWeekDays}"),
      RentAndFees_item("Weekends:", "${propertyModel.RentWeekEnds}"),
      RentAndFees_item("Security Deposit:", "${propertyModel.SecurityDeposit}"),
      RentAndFees_item(
          "Allow Additional Guests:", "${propertyModel.AdditionalGuests}"),
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

  Widget Farm_Amenities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![0]}"),
            Amenities_item("${propertyModel.Amenities![1]}"),
            Amenities_item("${propertyModel.Amenities![2]}"),
            Amenities_item("${propertyModel.Amenities![3]}")
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![4]}"),
            Amenities_item("${propertyModel.Amenities![5]}"),
            Amenities_item("${propertyModel.Amenities![6]}"),
            Amenities_item("${propertyModel.Amenities![7]}"),
            Amenities_item("${propertyModel.Amenities![8]}"),
          ],
        ),
      )
    ]);
  }

  Widget Villa_Amenities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![0]}"),
            Amenities_item("${propertyModel.Amenities![1]}"),
            Amenities_item("${propertyModel.Amenities![2]}"),
            Amenities_item("${propertyModel.Amenities![3]}")
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![4]}"),
            Amenities_item("${propertyModel.Amenities![5]}"),
            Amenities_item("${propertyModel.Amenities![6]}"),
            Amenities_item("${propertyModel.Amenities![7]}"),
            Amenities_item("${propertyModel.Amenities![8]}"),
          ],
        ),
      )
    ]);
  }

  Widget Cottage_Amenities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![0]}"),
            Amenities_item("${propertyModel.Amenities![1]}"),
            Amenities_item("${propertyModel.Amenities![2]}"),
            Amenities_item("${propertyModel.Amenities![3]}")
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![4]}"),
            Amenities_item("${propertyModel.Amenities![5]}"),
            Amenities_item("${propertyModel.Amenities![6]}"),
            Amenities_item("${propertyModel.Amenities![7]}"),
            Amenities_item("${propertyModel.Amenities![8]}"),
          ],
        ),
      )
    ]);
  }

  Widget Tent_Amenities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![0]}"),
            Amenities_item("${propertyModel.Amenities![1]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Amenities_item("${propertyModel.Amenities![2]}"),
            Amenities_item("${propertyModel.Amenities![3]}")
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

  Widget Farm_Facilities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![0]}"),
            Facilities_item("${propertyModel.Facilities![1]}"),
            Facilities_item("${propertyModel.Facilities![2]}"),
            Facilities_item("${propertyModel.Facilities![3]}"),
            Facilities_item("${propertyModel.Facilities![4]}"),
            Facilities_item("${propertyModel.Facilities![5]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![6]}"),
            Facilities_item("${propertyModel.Facilities![7]}"),
            Facilities_item("${propertyModel.Facilities![8]}"),
            Facilities_item("${propertyModel.Facilities![9]}"),
            Facilities_item("${propertyModel.Facilities![10]}"),
            Facilities_item("${propertyModel.Facilities![11]}"),
            Facilities_item("${propertyModel.Facilities![12]}"),
          ],
        ),
      )
    ]);
  }

  Widget Villa_Facilities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![0]}"),
            Facilities_item("${propertyModel.Facilities![1]}"),
            Facilities_item("${propertyModel.Facilities![2]}"),
            Facilities_item("${propertyModel.Facilities![3]}"),
            Facilities_item("${propertyModel.Facilities![4]}"),
            Facilities_item("${propertyModel.Facilities![5]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![6]}"),
            Facilities_item("${propertyModel.Facilities![7]}"),
            Facilities_item("${propertyModel.Facilities![8]}"),
            Facilities_item("${propertyModel.Facilities![9]}"),
            Facilities_item("${propertyModel.Facilities![10]}"),
            Facilities_item("${propertyModel.Facilities![11]}"),
            Facilities_item("${propertyModel.Facilities![12]}"),
          ],
        ),
      )
    ]);
  }

  Widget Cottage_Facilities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![0]}"),
            Facilities_item("${propertyModel.Facilities![1]}"),
            Facilities_item("${propertyModel.Facilities![2]}"),
            Facilities_item("${propertyModel.Facilities![3]}"),
            Facilities_item("${propertyModel.Facilities![4]}"),
            Facilities_item("${propertyModel.Facilities![5]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![6]}"),
            Facilities_item("${propertyModel.Facilities![7]}"),
            Facilities_item("${propertyModel.Facilities![8]}"),
            Facilities_item("${propertyModel.Facilities![9]}"),
            Facilities_item("${propertyModel.Facilities![10]}"),
            Facilities_item("${propertyModel.Facilities![11]}"),
          ],
        ),
      )
    ]);
  }

  Widget Tent_Facilities() {
    return Row(children: [
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![0]}"),
            Facilities_item("${propertyModel.Facilities![1]}"),
            Facilities_item("${propertyModel.Facilities![2]}"),
            Facilities_item("${propertyModel.Facilities![3]}"),
            Facilities_item("${propertyModel.Facilities![4]}"),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Facilities_item("${propertyModel.Facilities![5]}"),
            Facilities_item("${propertyModel.Facilities![6]}"),
            Facilities_item("${propertyModel.Facilities![7]}"),
            Facilities_item("${propertyModel.Facilities![8]}"),
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
}
