// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Booking/FarmBooking.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Farm%20Detail/details.dart';
import 'package:like_button/like_button.dart';
import 'package:resortbooking/User/Booking/FarmBooking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class details_farm extends StatefulWidget {
  final PropertyModel propertyModel;
  final String Dis;

  const details_farm({
    Key? key,
    required this.propertyModel,
    required this.Dis,
  }) : super(key: key);

  @override
  State<details_farm> createState() => _details_farmState();
}

class _details_farmState extends State<details_farm> {
  static final _containerHeight = 500.0;
  var _fromTop = -_containerHeight;
  ScrollController _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;
  bool BackToTop = false;
  @override
  void initState() {
    super.initState();
    property = widget.propertyModel;
    DiscountPrice = widget.Dis;
    
    _controller = ScrollController()
      ..addListener(() {
        _listener();
      });
  }

  String? str;
  String? DiscountPrice;
  PropertyModel property = PropertyModel();
  Usermodel _usermodel = Usermodel();
  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    setState(() {});
  }

  User? user = FirebaseAuth.instance.currentUser;
  Usermodel usermodel = Usermodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            controller: _controller,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    leadingWidth: 65,
                    leading: Container(
                      padding: EdgeInsets.only(left: 9),
                      child: CircleAvatar(
                          backgroundColor: Colors.black26,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  Icon(Icons.arrow_back, color: Colors.white))),
                    ),
                    actions: [
                      CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: LikeButton(
                            padding: EdgeInsets.only(left: 9, top: 7),
                            likeBuilder: (bool isLiked) {
                              return FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: isLiked ? rPrimarycolor : Colors.grey,
                              );
                            },
                          )),
                      widthSpace(9)
                    ],
                    toolbarHeight: 100,
                    expandedHeight: MediaQuery.of(context).size.height - 30,
                    floating: false,
                    pinned: true,
                    flexibleSpace: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/image/hotel.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Hide(),
                      ],
                    )),
              ];
            },
            body: FarmDetails(property, DiscountPrice)));
  }

  Widget Hide() {
    return Opacity(
      opacity: 0 + (-_fromTop / _containerHeight),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlurryContainer(
              width: 330,
              height: 180,
              blur: 3,
              color: Colors.black12,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${property.PropertyName}",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Flexible(
                          child: Text("${property.PropertyAddress}",
                              style: TextStyle(
                                  fontFamily: 'NotoSans-Medium',
                                  color: Colors.white),
                              overflow: TextOverflow.ellipsis),
                        ),
                        Icon(Icons.location_on, color: rPrimarycolor, size: 16),
                        Text("${property.PropertyCity}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white)),
                        widthSpace(3),
                        Text("${property.PropertyState}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white)),
                        Expanded(
                          child: Text("\₹${property.RentWeekDays}",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        RatingBar.builder(
                            itemSize: 18,
                            glow: false,
                            allowHalfRating: true,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: rPrimarycolor),
                            onRatingUpdate: (rating) {
                              print(rating);
                            }),
                        SizedBox(width: 5),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: BouncingWidget(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: rPrimarycolor),
                            child: Text(
                              "Book now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => farmBooking(
                                property: property, Dis: DiscountPrice!,
                              ),
                            ));
                          }),
                    ),
                  ],
                ),
              ),
            ),
            heightSpace(15),
            InkWell(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('More Details',
                        style: TextStyle(
                            fontFamily: 'NotoSans-Medium',
                            color: Colors.white)),
                    widthSpace(5),
                    FaIcon(FontAwesomeIcons.angleDown,
                        size: 18, color: Colors.white),
                  ],
                ),
              ),
            ),
            heightSpace(30)
          ],
        ),
      ),
    );
  }
}
