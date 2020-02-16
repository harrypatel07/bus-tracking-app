import 'package:flutter/material.dart';

class TabIconData {
  String imagePath;
  String selctedImagePath;
  bool isSelected;
  int index;
  AnimationController animationController;
  String title;

  TabIconData(
      {this.imagePath = '',
      this.index = 0,
      this.selctedImagePath = "",
      this.isSelected = false,
      this.animationController,
      this.title = ""});

  static List<TabIconData> tabIconsList = [
    TabIconData(
        imagePath: 'assets/fitness_app/tab_1.png',
        selctedImagePath: 'assets/fitness_app/tab_1s.png',
        index: 0,
        isSelected: true,
        animationController: null,
        title: "What's Up"),
    TabIconData(
        imagePath: 'assets/fitness_app/tab_2.png',
        selctedImagePath: 'assets/fitness_app/tab_2s.png',
        index: 1,
        isSelected: false,
        animationController: null,
        title: "Bus Tracker"),
    TabIconData(
        imagePath: 'assets/fitness_app/tab_3.png',
        selctedImagePath: 'assets/fitness_app/tab_3s.png',
        index: 2,
        isSelected: false,
        animationController: null,
        title: "News"),
  ];
}
