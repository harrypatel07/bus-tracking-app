import 'package:cyberjaya_super_com/model/news.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/home/homeScreen.dart';
import 'package:cyberjaya_super_com/view/noticeboard/noticeScreen.dart';
import 'package:cyberjaya_super_com/view/services/servicesScreen.dart';
import 'package:cyberjaya_super_com/view/residence/residenceScreen.dart';
import 'package:cyberjaya_super_com/view/emergency/emergencyScreen.dart';
import 'package:cyberjaya_super_com/view/invite/inviteFriendScreen.dart';
import 'package:cyberjaya_super_com/view/about/aboutScreen.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:extended_image/extended_image.dart';

class ListNews extends StatefulWidget {
  List<News> newsList;

  ListNews({Key key, this.newsList}) : super(key: key);

  @override
  _ListNewsState createState() => _ListNewsState(newsList);
}

class _ListNewsState extends State<ListNews> {
  List<News> newsList;

  _ListNewsState(List<News> newsList) {
    this.newsList = newsList;
  }

  @override
  void initState() {
    super.initState();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: newsList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (context, position) {
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                  decoration: BoxDecoration(color: AppTheme.nearlyWhite),
                  //color: Color.fromRGBO(64, 75, 96, .9)),
                  child: Column(children: <Widget>[
                    ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        title: Row(
                          children: <Widget>[
                            ExtendedImage.network(
                              '${newsList[position].urlToImage}',
                              width: 70,
                              height: 50,
                              fit: BoxFit.cover,
                              cache: true,
                              border:
                                  Border.all(color: AppTheme.grey, width: 1.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.zero),
                              //cancelToken: cancellationToken,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Expanded(
                              child: Text('${newsList[position].title}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  )),
                            ),
                          ],
                        ),
                        subtitle: Column(children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Text(
//                                '${newsList[position].author}' +
//                                    " (" +
//                                    '${newsList[position].publishedAt}'
//                                        .substring(0, 10) +
//                                    ")",
//                                style: TextStyle(
//                                  fontSize: 9.0,
//                                  color: Colors.indigo,
//                                ),
//                              )
//                            ],
//                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text('${newsList[position].description}',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black87)),
                              ),
                            ],
                          ),
                        ]),
                        onTap: () {
                          print("tileclicked");
                          launchURL('${newsList[position].url}');
                        })
                  ])),
            );
          }),
    );
  }
}
