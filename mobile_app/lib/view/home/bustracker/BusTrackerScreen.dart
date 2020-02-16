import 'package:cyberjaya_super_com/view/shared/titleView.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:cyberjaya_super_com/view/home/bustracker/waterView.dart';
import 'package:cyberjaya_super_com/view/shared/pageTitle.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/shared/tabIconData.dart';
import 'package:cyberjaya_super_com/view/shared/trainingScreen.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/home/bottomBarView.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:cyberjaya_super_com/view/home/bustracker/BusTrackerScreen.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class BusTrackerScreen extends StatefulWidget {
  final AnimationController animationController;

  const BusTrackerScreen({Key key, this.animationController}) : super(key: key);
  @override
  _BusTrackerScreenState createState() => _BusTrackerScreenState();
}

class _BusTrackerScreenState extends State<BusTrackerScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;
  Widget map = null;
  MapController _mapctl = MapController();

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text('Tracking your fav bus'),
          ),
          Flexible(
            child: FlutterMap(
              mapController: _mapctl,
              options: MapOptions(
                center: LatLng(2.9213, 101.6559),
                zoom: 16,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoibXJhZnN5YW0iLCJhIjoiY2swcG0wOGt6MDgwNDNjb3Y1dGNlNWQ3aSJ9.GPPovADETa_cMYcVnOKDMQ',
                    'id': 'mapbox.streets',
                  },
                ),
//                      MarkerLayerOptions(markers: markers)
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
