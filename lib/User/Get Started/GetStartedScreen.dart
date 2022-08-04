import 'package:flutter/material.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Introduction/IntroductionScreen.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class getStartedScreen extends StatefulWidget {
  const getStartedScreen({Key? key}) : super(key: key);

  @override
  State<getStartedScreen> createState() => _getStartedScreenState();
}

class _getStartedScreenState extends State<getStartedScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.asset("assets/image/ic_get_started.jpg",fit: BoxFit.cover,height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BouncingWidget(
                    onPressed: () {
                      pushReplacmentScreen(context, () => introductionSlider());
                      },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 30,right: 30,bottom: MediaQuery.of(context).size.height * 0.05),
                      decoration: BoxDecoration(
                        color: rPrimarycolor,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 16, fontFamily: "NotoSans-Regular"),),
                      ),
                    ),
                  ),
                )
              ],

            ),
          ),

        ],
      ),
    );
  }
}
