// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/DeleteFarmOwner.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmHistoryDetails.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmOwnerDetails extends StatefulWidget {
  final Usermodel usermodel;

  const FarmOwnerDetails({
    Key? key,
    required this.usermodel,
  }) : super(key: key);

  @override
  State<FarmOwnerDetails> createState() => _FarmOwnerDetailsState();
}

class _FarmOwnerDetailsState extends State<FarmOwnerDetails> {
  @override
  late Usermodel user;

  void initState() {
    user = widget.usermodel;

    super.initState();
  }

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
          "Farm Owner Details",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                        Image.network('${user.ProfilePic}', fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                          Text("${user.UserFName} ${user.UserLName}",
                              style: normalStyle),
                          heightSpace(10),
                          Text("E-mail",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                          Text("${user.UserEmail}", style: normalStyle),
                          heightSpace(10),
                          Text("Phome Number",
                              style: TextStyle(fontFamily: 'NotoSans-Medium')),
                          Text("${user.PhoneNumber}", style: normalStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                heightSpace(10),
                Text("City", style: TextStyle(fontFamily: 'NotoSans-Medium')),
                Text("${user.City}", style: normalStyle),
                heightSpace(10),
                Text("State", style: TextStyle(fontFamily: 'NotoSans-Medium')),
                Text("${user.State}", style: normalStyle),
                heightSpace(10),
                Text(
                    "Country", style: TextStyle(fontFamily: 'NotoSans-Medium')),
                Text("${user.Country}", style: normalStyle),
                heightSpace(15),
                Text("Farm History",
                    style: TextStyle(
                        fontFamily: 'NotoSans-Bold', fontSize: 16)),
                heightSpace(10),
                StreamBuilder(
                  stream:
                  FirebaseFirestore.instance.collection('Property').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      controller: controller,
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((document) {
                        PropertyModel propertyModel = PropertyModel.fromMap(
                            document.data() as Map<String, dynamic>);
                        return Column(
                          children: [
                            if (propertyModel.OwnerId == user.UserId)
                              InkWell(
                                child: Showdata(
                                    address: propertyModel.PropertyAddress,
                                    hotelName: propertyModel.PropertyName,
                                    location: propertyModel.PropertyState,
                                    sublocation: propertyModel.PropertyCity,
                                    price: propertyModel.RentWeekDays),
                                onTap: () =>
                                    pushScreen(
                                        context,
                                            () =>
                                            FarmDetails(
                                              propertyModel: propertyModel,
                                            )),
                              )
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
                heightSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal.shade50),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                  data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                          primary: rPrimarycolor)),
                                  child: child!);
                            });

                        if (pickedDate != null) {
                          String formatedate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            BlockUser.text = formatedate.toString();
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.block, color: Colors.black),
                          widthSpace(5),
                          Text("Block User", style: TextStyle(color: Colors
                              .black))
                        ],
                      ),
                    ),
                    DeleteFarmOwner(user)
                  ],
                ),


              ],
            ),
          )),
    );
  }

  DateTime? SelectDate;
  final BlockUser = TextEditingController();
  ScrollController controller = ScrollController();

  Widget Showdata({
    Image? image,
    String? hotelName,
    String? address,
    String? location,
    String? sublocation,
    String? price,
  }) {
    return Container(
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
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${hotelName}",
                      style:
                      TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 16)),
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
                      Row(
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
                          Text(
                            "${sublocation}",
                            style: TextStyle(
                                fontFamily: 'NotoSans-Medium',
                                color: rGrey,
                                fontSize: 13),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
//
