import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/AddFarm.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/BookingDetails.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/Home.dart';
import 'package:resortbooking/Admin/Bottom%20Screen/Profile.dart';
import 'package:resortbooking/User/Bottom%20Screen/Favorite%20Screen.dart';
import 'package:resortbooking/User/Bottom%20Screen/ProfileScreen.dart';
import 'package:resortbooking/User/Bottom%20Screen/SearchScreen.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBarMenu extends StatefulWidget {
  final index;
  const NavigationBarMenu({Key? key, this.index}) : super(key: key);

  @override
  State<NavigationBarMenu> createState() => _NavigationBarMenuState();
}

class _NavigationBarMenuState extends State<NavigationBarMenu> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _bottomNavigationItems = [
    HomeScreen(),
    AddFarm(),
    BookingHistory_Admin(),
    Profile()
  ];

  late int sindex = widget.index;

  void tapindex(int index) {
    setState(() {
      sindex = index;
    });
  }

  List<PersistentBottomNavBarItem> _navBarsItems(sindex) {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: rPrimarycolor,
          inactiveIcon: Icon(Icons.home),
          inactiveColorPrimary: rGrey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          title: ("Add farm"),
          activeColorPrimary: rPrimarycolor,
          inactiveIcon: Icon(Icons.add),
          inactiveColorPrimary: rGrey),
      PersistentBottomNavBarItem(
          icon: FaIcon(FontAwesomeIcons.calendarWeek, size: 22),
          title: ("Booking Details"),
          activeColorPrimary: rPrimarycolor,
          inactiveIcon: FaIcon(FontAwesomeIcons.calendarWeek, size: 22),
          inactiveColorPrimary: rGrey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: rPrimarycolor,
          inactiveIcon: Icon(Icons.person_outline),
          inactiveColorPrimary: rGrey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        screens: _bottomNavigationItems,
        controller: _controller,
        items: _navBarsItems(sindex),
        confineInSafeArea: true,
        decoration: NavBarDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
