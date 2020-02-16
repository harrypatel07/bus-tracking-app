import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/appDrawer.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: AppTheme.nearlyBlue,
          title: Text(
            "Emergency",
            style: TextStyle(fontSize: 15.0, color: AppTheme.white),
          ),
        ),
        drawer: AppDrawer(),
        body: Container(
          color: AppTheme.nearlyWhite,
        ));
  }
}
