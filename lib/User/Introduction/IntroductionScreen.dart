import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:resortbooking/User/Common/Navigators.dart';
import 'package:resortbooking/User/Login/LoginScreen.dart';

class introductionSlider extends StatefulWidget {
  const introductionSlider({Key? key}) : super(key: key);

  @override
  State<introductionSlider> createState() => _introductionSliderState();
}

class _introductionSliderState extends State<introductionSlider> {

  List<Slide> slides = [];

  late Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Plan Your Trips",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSans-Bold",
        ),
        description:
        "Book one of your unique hotel to escap the ordinary",
        styleDescription: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'NotoSans-Regular',
        ),
        pathImage: "assets/image/ic_intro1.png",
        backgroundColor: Colors.red
      ),
    );
    slides.add(
      Slide(
        title: "Find best deals",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSans-Bold",
        ),
        description: "Find deals for any season from cosy country homes to city flats",
        styleDescription: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'NotoSans-Regular',
        ),
        pathImage: "assets/image/ic_intro2.png",
      ),
    );
    slides.add(
      Slide(
        title: "Best travelling all time",
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "NotoSans-Bold",
        ),
        description:
        "Find deals for any sesson from cosy country homes to city flats",
        styleDescription: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: 'NotoSans-Regular',
        ),
        pathImage: "assets/image/ic_intro3.png",
      ),
    );
  }

  void onDonePress() {
    pushReplacmentScreen(context, () => LoginScreen());
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
    log("onTabChangeCompleted, index: $index");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color(0xFF26A69A),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xFF26A69A),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
     "Skip",
      style: TextStyle( color: Color(0xFF26A69A),),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade50),
      overlayColor: MaterialStateProperty.all<Color>(Colors.teal.shade50),
    );
  }

  List<Widget> renderListCustomTabs() {
    return List.generate(
      slides.length,
          (index) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0,top: MediaQuery.of(context).size.height * 0.12),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  slides[index].pathImage!,
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  slides[index].title!,
                  style: slides[index].styleTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  slides[index].description ?? '',
                  style: slides[index].styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroSlider(
      autoScroll: true,
      colorDot: const Color(0xFF26A69A),
      sizeDot: 10.0,
      typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
      autoScrollInterval: Duration(seconds: 3),
      scrollable: true,
      loopAutoScroll: true,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),
      // Tabs
      listCustomTabs: renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        goToTab = refFunc;
      },
      scrollPhysics: const BouncingScrollPhysics(),
      hideStatusBar: false,

      onTabChangeCompleted: onTabChangeCompleted,
        ),
    );
  }
}
