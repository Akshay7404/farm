import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter_share/flutter_share.dart';

class inviteFriendAdmin extends StatefulWidget {
  const inviteFriendAdmin({Key? key}) : super(key: key);

  @override
  State<inviteFriendAdmin> createState() => _inviteFriendAdminState();
}

class _inviteFriendAdminState extends State<inviteFriendAdmin> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Center(
                  child: Image.asset("assets/image/ic_invite.jpg"),
                ),
                heightSpace(15),
                Text(
                  "Invite your friends",
                  style: bigTitleStyle,
                ),
                heightSpace(15),
                Text(
                  "are you one of those who makes everything at the last moment",
                  style: normalStyle,
                ),
                heightSpace(35),
                BouncingWidget(
                  onPressed: () {
                    share();
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 40, right: 40, top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      color: rPrimarycolor,
                    ),
                    child: Center(
                      child: Text("Share", style: buttonStyle),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
