import 'package:cyberjaya_super_com/view/home/news/newsScreen.dart';
import 'package:cyberjaya_super_com/view/home/whatsup/WhatsupScreen.dart';
import 'package:cyberjaya_super_com/view/shared/tabIconData.dart';
import 'package:cyberjaya_super_com/view/shared/trainingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bottomBarView.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'bustracker/BusTrackerScreen.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/appDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  String pageTitle = "What's up Cyberjaya?";

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    // default page
    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;
//    tabBody = WeatherScreen();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: AppTheme.nearlyBlue,
          title: Text(
            "What's up Cyberjaya?",
            style: TextStyle(fontSize: 15.0, color: AppTheme.white),
          ),
        ),
        drawer: AppDrawer(),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(child: tabBody),
              SizedBox(height: 62, child: getBtmNavBar())
            ],
            mainAxisSize: MainAxisSize.max,
          ),
        ));
  }

  Widget getBtmNavBar() {
    return Container(
        child: BottomBarView(
      tabIconsList: tabIconsList,
      addClick: () {},
      changeIndex: (index) {
        if (index == 0) {
          animationController.reverse().then((data) {
            if (!mounted) return;
            setState(() {
              tabBody = WhatsupScreen();
              pageTitle = "What's up?";
            });
          });
        } else if (index == 1) {
          animationController.reverse().then((data) {
            if (!mounted) return;
            setState(() {
              tabBody =
                  BusTrackerScreen(animationController: animationController);
              pageTitle = "Bus Tracker";
            });
          });
        } else if (index == 2) {
          animationController.reverse().then((data) {
            if (!mounted) return;
            setState(() {
              tabBody = NewsScreen();
              pageTitle = "News Feed";
            });
          });
        }
      },
    ));
  }
}
