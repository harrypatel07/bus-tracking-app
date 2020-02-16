import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: SizedBox(
                height: 120,
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.714, //1.714
                      child: Image.asset(
                        "assets/images/weather1.png",
                        color: AppTheme.white,
                      ),
                    ),
                    Text(
                      "Hazy\nMorning",
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: AppTheme.white,
                      ),
                    )
                  ],
                )),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: SizedBox(
                height: 120,
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.714, //1.714
                      child: Image.asset(
                        "assets/images/weather1.png",
                        color: AppTheme.white,
                      ),
                    ),
                    Text(
                      "Rain\nAfternoon",
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: AppTheme.white,
                      ),
                    )
                  ],
                )),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: SizedBox(
                height: 120,
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.714, //1.714
                      child: Image.asset(
                        "assets/images/weather1.png",
                        color: AppTheme.white,
                      ),
                    ),
                    Text(
                      "Rain\nNight",
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: AppTheme.white,
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
