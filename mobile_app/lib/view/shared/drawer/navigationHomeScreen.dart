import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/drawerUserController.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/appDrawer.dart';
import 'package:cyberjaya_super_com/view/support/feedbackScreen.dart';
import 'package:cyberjaya_super_com/view/about/aboutScreen.dart';
import 'package:cyberjaya_super_com/view/invite/inviteFriendScreen.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/home/homeScreen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  void initState() {
    drawerIndex = DrawerIndex.Home;
    screenView = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkText,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.Home) {
        setState(() {
          screenView = HomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.NoticeBoard) {
        setState(() {
          screenView = AboutScreen();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
