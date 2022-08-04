import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:resortbooking/User/Bottom%20Screen/Favorite%20Screen.dart';
import 'package:resortbooking/User/Bottom%20Screen/ProfileScreen.dart';
import 'package:resortbooking/User/Bottom%20Screen/SearchScreen.dart';
import 'package:resortbooking/User/Common/Color.dart';


class BottomNavigationBarMenu extends StatefulWidget {
  final index;
  const BottomNavigationBarMenu({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavigationBarMenu> createState() => _BottomNavigationBarMenuState();
}

class _BottomNavigationBarMenuState extends State<BottomNavigationBarMenu> {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _bottomNavigationItems = [
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen()
    ];

  late int sindex = widget.index;

  void tapindex(int index)
  {
    setState(() {
      sindex = index;
    });
  }

  List<PersistentBottomNavBarItem> _navBarsItems(sindex) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search,),
        title: ("Search"),
        activeColorPrimary: rPrimarycolor,
        inactiveIcon: Icon(Icons.search,),
        inactiveColorPrimary: rGrey
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite,),
        title: ("Favorite"),
        activeColorPrimary: rPrimarycolor,
        inactiveIcon: Icon(Icons.favorite_border,),
          inactiveColorPrimary: rGrey
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person,),
          title: ("Profile"),
          activeColorPrimary: rPrimarycolor,
          inactiveIcon: Icon(Icons.person_outline,),
          inactiveColorPrimary: rGrey
      ),
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
        decoration: NavBarDecoration(boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),]),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: false,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
