// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import 'package:resortbooking/Model/FarmOwner_model.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/DeleteFarmOwner.dart';
import 'package:resortbooking/SuperAdmin/Farm%20Owner%20Panel/FarmHouseImage.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FarmOwnerDetails extends StatefulWidget {
  final FarmOwnermodel farmmodel;
  const FarmOwnerDetails({Key? key, required this.farmmodel}) : super(key: key);

  @override
  State<FarmOwnerDetails> createState() => _FarmOwnerDetailsState();
}

class _FarmOwnerDetailsState extends State<FarmOwnerDetails> {
  @override
  void initState() {
    farmOwnermodel = widget.farmmodel;
    super.initState();
  }

  late FarmOwnermodel farmOwnermodel;
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
                    child: Image.network(
                        '${farmOwnermodel.ProfilePic.toString()}',
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text(
                          "${farmOwnermodel.FarmOwnerFName} ${farmOwnermodel.FarmOwnerLName}",
                          style: normalStyle),
                      heightSpace(10),
                      Text("E-mail",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("${farmOwnermodel.FarmOwnerEmail}",
                          style: normalStyle),
                      heightSpace(10),
                      Text("Phome Number",
                          style: TextStyle(fontFamily: 'NotoSans-Medium')),
                      Text("${farmOwnermodel.PhoneNumber}", style: normalStyle),
                    ],
                  ),
                ),
              ],
            ),
            Text("City", style: TextStyle(fontFamily: 'NotoSans-Medium')),
            Text("${farmOwnermodel.City}", style: normalStyle),
            heightSpace(10),
            Text("State", style: TextStyle(fontFamily: 'NotoSans-Medium')),
            Text("${farmOwnermodel.Country}", style: normalStyle),
            heightSpace(10),
            Text("Country", style: TextStyle(fontFamily: 'NotoSans-Medium')),
            Text("${farmOwnermodel.State}", style: normalStyle),
            heightSpace(15),
            Text("Farm History",
                style: TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 16)),
            heightSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Farm Name"),
              ],
            ),
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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(document['PropertyName']),
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
                  style: ElevatedButton.styleFrom(primary: Colors.teal.shade50),
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
                      Text("Block User", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
                DeleteFarmOwner()
              ],
            ),
            heightSpace(20),
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5))
                ]),
                child: appTextField(
                    textEditingController: BlockUser, isReadOnly: true))
          ],
        ),
      )),
    );
  }

  DateTime? SelectDate;
  final BlockUser = TextEditingController();
  ScrollController controller = ScrollController();
}
//
