// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/SuperAdmin/User%20Panel/DeleteUser.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:intl/intl.dart';


class UserDetails extends StatefulWidget {
  final Usermodel usermodel;
  const UserDetails({Key? key, required this.usermodel}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late Usermodel user;
  @override
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
          "User Details",
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
                    child: Image.network("${user.ProfilePic.toString()}",
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
            Text("Country", style: TextStyle(fontFamily: 'NotoSans-Medium')),
            Text("${user.Country}", style: normalStyle),
            heightSpace(15),
            Text("Booking History",
                style: TextStyle(fontFamily: 'NotoSans-Bold', fontSize: 16)),
            DataTable(
              horizontalMargin: 1,
              columns: [
                DataColumn(
                    label: Text('Hotel Name', overflow: TextOverflow.ellipsis)),
                DataColumn(label: Text('Date')),
                DataColumn(
                    label: Text('Payment Method',
                        overflow: TextOverflow.ellipsis)),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Grand Royal Hotel')),
                  DataCell(Text('05-07-2022 to 09-07-2022')),
                  DataCell(Text('Credit Card')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Queen Hotel')),
                  DataCell(Text('15-07-2022 to 19-07-2022')),
                  DataCell(Text('Paypal')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Blu Feather Hotel')),
                  DataCell(Text('25-07-2022 to 29-07-2022')),
                  DataCell(Text('Pay at hotel')),
                ]),
              ],
            ),
            heightSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.teal.shade50),
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
                        Text("Block User",
                            style: TextStyle(color: Colors.black))
                      ],
                    )),
                DeleteUser(user)
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

}
