import 'package:cyberjaya_super_com/view/home/whatsup/ForecastView.dart';
import 'package:cyberjaya_super_com/view/home/whatsup/SuggestActivityView.dart';
import 'package:cyberjaya_super_com/view/home/whatsup/APIView.dart';
import 'package:cyberjaya_super_com/view/shared/titleView.dart';
import 'package:cyberjaya_super_com/view/shared/workoutView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cyberjaya_super_com/util/appTheme.dart';

class WhatsupScreen extends StatefulWidget {
  const WhatsupScreen({Key key}) : super(key: key);
  @override
  _WhatsupScreenState createState() => _WhatsupScreenState();
}

class _WhatsupScreenState extends State<WhatsupScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    var count = 5;

    listViews.add(Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TitleView(
                titleTxt: 'Cyberjaya',
                fontSize: 33,
              ),
              TitleView(
                titleTxt: '15th May, Thurs',
                fontSize: 17,
              ),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                TitleView(
                  titleTxt: '30`C Hazy',
                  fontSize: 25,
                ),
              ],
            ))
      ],
    ));

    listViews.add(
      ForecastView(),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Activity',
      ),
    );

    listViews.add(
      SuggestActivityView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return listViews[index];
      },
    );
  }
}
