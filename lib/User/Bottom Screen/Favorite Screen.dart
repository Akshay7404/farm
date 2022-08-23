import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:resortbooking/User/Farm%20Detail/details_farm.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
          "Favorite farm list",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Container(
                child: WaterfallFlow.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: EdgeInsets.all(0),
                  gridDelegate:
                      SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          child: BestDealCell(
                              image: Image.asset(
                                "assets/image/ic_effiletower.jpeg",
                                fit: BoxFit.fill,
                              ),
                              hotelName: "Grand royal Hotel",
                              address: "Wembley, London",
                              location: "2.0 km to city",
                              price: "180"),
                          onTap: () {
                            // pushNewScreen(
                            //   context,
                            //   screen: details_farm(),
                            //   withNavBar: false, // OPTIONAL VALUE. True by default.
                            //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            // );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
