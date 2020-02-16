import 'package:cyberjaya_super_com/main.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:cyberjaya_super_com/view/home/whatsup/WeatherView.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppTheme.nearlyDarkBlue, HexColor("#6F56E8")],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(68.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppTheme.grey.withOpacity(0.6),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WeatherView(),
//                      SizedBox(height: 22,),
            Text(
              'Data is provided by Malaysian Meteorological Department',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.normal,
                fontSize: 10,
                letterSpacing: 0.0,
                color: AppTheme.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
