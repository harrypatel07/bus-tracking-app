import 'package:cyberjaya_super_com/util/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:cyberjaya_super_com/view/home/homeScreen.dart';
import 'package:cyberjaya_super_com/view/noticeboard/noticeScreen.dart';
import 'package:cyberjaya_super_com/view/services/servicesScreen.dart';
import 'package:cyberjaya_super_com/view/residence/residenceScreen.dart';
import 'package:cyberjaya_super_com/view/emergency/emergencyScreen.dart';
import 'package:cyberjaya_super_com/view/invite/inviteFriendScreen.dart';
import 'package:cyberjaya_super_com/view/about/aboutScreen.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);
  Widget currentPage = HomeScreen();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  AnimationController iconAnimationController;

  List<DrawerList> drawerList;
  static DrawerIndex screenIndex;
  Function(DrawerIndex) callBackIndex;

  @override
  void initState() {
    iconAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 10));

    setdDrawerListArray();
    super.initState();
  }

  void setdDrawerListArray() {
    drawerList = [
      DrawerList(
        index: DrawerIndex.Home,
        labelName: 'Home',
        icon: new Icon(Icons.home),
      ),
      DrawerList(
        index: DrawerIndex.NoticeBoard,
        labelName: 'Notice Board',
        icon: new Icon(Icons.chat),
      ),
      DrawerList(
        index: DrawerIndex.Services,
        labelName: 'Services',
        isAssetsImage: true,
        imageName: "assets/images/supportIcon.png",
      ),
      DrawerList(
        index: DrawerIndex.Residence,
        labelName: 'Residence',
        icon: new Icon(Icons.account_balance),
      ),
      DrawerList(
        index: DrawerIndex.Emergency,
        labelName: 'Emergency',
        icon: new Icon(Icons.dialer_sip),
      ),
      DrawerList(
        index: DrawerIndex.Invite,
        labelName: 'Tell others',
        icon: new Icon(Icons.share),
      ),
      DrawerList(
        index: DrawerIndex.About,
        labelName: 'About',
        icon: new Icon(Icons.info),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85, // set this
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppTheme.nearlyWhite,
        ),
        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.grey.withOpacity(0.6),
                              offset: Offset(2.0, 4.0),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(60.0)),
                        child: Image.asset("assets/images/userImage.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Rafsyam Hasyemi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  return inkwell(drawerList[index]);
                },
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.grey.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: new Text(
                    "Sign Out",
                    style: new TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppTheme.darkText,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  trailing: new Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blue.withOpacity(0.9),
        highlightColor: Colors.transparent,
        onTap: () {
          widget.currentPage = navigationToScreen(listData.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: screenIndex == listData.index
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: screenIndex == listData.index
                                  ? Colors.blue
                                  : AppTheme.nearlyBlack),
                        )
                      : new Icon(listData.icon.icon,
                          color: screenIndex == listData.index
                              ? Colors.blue
                              : AppTheme.nearlyBlack),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  new Text(
                    listData.labelName,
                    style: new TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: screenIndex == listData.index
                          ? Colors.blue
                          : AppTheme.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: iconAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return new Transform(
                        transform: new Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 - iconAnimationController.value - 1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget navigationToScreen(DrawerIndex indexScreen) {
    if (indexScreen == DrawerIndex.Home) {
      screenIndex = DrawerIndex.Home;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.NoticeBoard) {
      screenIndex = DrawerIndex.NoticeBoard;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoticeBoardScreen(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.Services) {
      screenIndex = DrawerIndex.Services;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServicesScreen(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.Residence) {
      screenIndex = DrawerIndex.Residence;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResidenceScreen(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.Emergency) {
      screenIndex = DrawerIndex.Emergency;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmergencyScreen(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.Invite) {
      screenIndex = DrawerIndex.Invite;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InviteFriend(),
        ),
      );
    }
    if (indexScreen == DrawerIndex.About) {
      screenIndex = DrawerIndex.About;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AboutScreen(),
        ),
      );
    }
  }
}

enum DrawerIndex {
  Home,
  NoticeBoard,
  Services,
  Residence,
  Emergency,
  Invite,
  About,
}

class DrawerList {
  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;

  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });
}
