import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/home/homeScreen.dart';
import 'package:cyberjaya_super_com/view/noticeboard/noticeScreen.dart';
import 'package:cyberjaya_super_com/view/services/servicesScreen.dart';
import 'package:cyberjaya_super_com/view/residence/residenceScreen.dart';
import 'package:cyberjaya_super_com/view/emergency/emergencyScreen.dart';
import 'package:cyberjaya_super_com/view/invite/inviteFriendScreen.dart';
import 'package:cyberjaya_super_com/view/about/aboutScreen.dart';
import 'package:cyberjaya_super_com/view/shared/drawer/appDrawer.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'package:cyberjaya_super_com/model/news.dart';
import 'package:cyberjaya_super_com/view/home/news/listNews.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var dio = Dio();
  List<News> newsList;

  @override
  void initState() {
    getCyberjayaNews();
    super.initState();
  }

  Future<List<News>> getCyberjayaNews() async {
    dio.transformer = FlutterTransformer(); // replace dio default transformer

    String newsAPI =
        "https://newsapi.org/v2/everything?q=cyberjaya&sortBy=publishedAt&apiKey=e61cecb3dcf94a44b8db0279867b1c28";
    try {
      Response response = await dio.get(newsAPI);

      if (response.statusCode == 200) {
        Map data = json.decode(response.toString());
        newsList =
            (data['articles'] as List).map((i) => News.fromJson(i)).toList();
        return newsList;
      } else {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(response.data['message']),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Text('News'),
          ),
          Flexible(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    //filterCard(),
                    new FutureBuilder<List<News>>(
                        future: getCyberjayaNews(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<News>> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return ListNews(newsList: newsList);
                          }
                          return Center(child: CircularProgressIndicator());
                        })
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
