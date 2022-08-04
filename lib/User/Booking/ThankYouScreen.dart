import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Constant.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Common/Style.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:resortbooking/User/Home%20Page/BottomNavigationBar.dart';

class thankYouScreen extends StatefulWidget {
  const thankYouScreen({Key? key}) : super(key: key);

  @override
  State<thankYouScreen> createState() => _thankYouScreenState();
}

class _thankYouScreenState extends State<thankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          heightSpace(MediaQuery.of(context).size.height / 3),
          Center(
            child: Image.asset("assets/image/ic_right.jpg",height: 200,width: 200,),
          ),
          heightSpace(20),
          Text("Thank you!", style: bigTitleStyle,),
          heightSpace(20),
          Text("Your farm has been booked...!", style: TextStyle(fontFamily: 'NotoSans-Medium',fontSize: 16),),
          Align(
            alignment: Alignment.bottomCenter,
            child: BouncingWidget(
              onPressed: () {
                pushReplacmentScreen(context, () => BottomNavigationBarMenu(index: 0,));
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: rPrimarycolor,
                ),
                child: Center(
                  child: Text("Back to home",
                      style: buttonStyle),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
