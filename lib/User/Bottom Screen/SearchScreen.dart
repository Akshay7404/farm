// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Farm%20Detail/details_farm.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:resortbooking/User/Home%20Page/search_farm.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController = TextEditingController();

  int id = 0;

  final List CountryImg = [
    'assets/image/paris.jpg',
    'assets/image/spain.jpg',
    'assets/image/Vernazza.jpg',
    'assets/image/london.jpeg',
    'assets/image/vanice.jpg',
    'assets/image/diamondhead.jpg',
  ];
  int i = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        offset: Offset(1, 1)),
                  ],
                ),
                child: searchTextField(
                  isReadOnly: true,
                  textEditingController: SearchController,
                  hintText: "Search...",
                  click: () {
                    pushNewScreen(
                      context,
                      screen: SearchFilter(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Popular Destination",
                style:
                    TextStyle(fontSize: 18, fontFamily: 'NotoSans-ExtraBold'),
              ),
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true),
                items: CountryImg.map((e) {
                  i++;
                  return Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(e, fit: BoxFit.fill)));
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                "Best Deals",
                style:
                    TextStyle(fontSize: 18, fontFamily: 'NotoSans-ExtraBold'),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Property')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    controller: controller,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((document) {
                      PropertyModel propertyModel = PropertyModel.fromMap(
                          document.data() as Map<String, dynamic>);

                      return InkWell(
                        child: BestDealCell(
                            address: document['PropertyAddress'],
                            hotelName: document['PropertyName'],
                            price: document['RentWeekDays'],
                            location: document['PropertyCity'],
                            sublocation: document['PropertyState']),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: details_farm(
                                propertyModel: propertyModel,
                                Dis: document['DiscountPrice']),
                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ScrollController controller = ScrollController();
}
