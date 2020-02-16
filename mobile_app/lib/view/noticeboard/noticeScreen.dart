import 'package:cyberjaya_super_com/view/home/whatsup/WhatsupScreen.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/appDrawer.dart';
import 'package:cyberjaya_super_com/view/shared/tabIconData.dart';
import 'package:cyberjaya_super_com/view/shared/trainingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class NoticeBoardScreen extends StatefulWidget {
  @override
  _NoticeBoardScreenState createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: AppTheme.nearlyBlue,
          title: Text(
            "Notice Board",
            style: TextStyle(fontSize: 15.0, color: AppTheme.white),
          ),
        ),
        drawer: AppDrawer(),
        body: Container(
          color: AppTheme.nearlyWhite,
        ));
  }
}
