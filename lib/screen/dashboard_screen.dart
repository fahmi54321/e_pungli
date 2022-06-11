import 'package:e_pungli/screen/lacak_laporan_screen.dart';
import 'package:e_pungli/screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:e_pungli/screen/home_screen.dart';
import 'package:e_pungli/screen/my_profile_screen.dart';
import 'package:e_pungli/screen/WAQrScannerScreen.dart';
import 'package:e_pungli/screen/statistics_screen.dart';
import 'package:e_pungli/screen/WAWalletScreen.dart';
import 'package:e_pungli/utils/WAColors.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    HomeScreen(),
    StatisticScreen(),
    NotificationScreen(),
    MyProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(6.0),
        child: FloatingActionButton(
          backgroundColor: WAPrimaryColor,
          child: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            LacakLaporanScreen().launch(context);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: context.cardColor,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: WAPrimaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Statistics'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: 'Notif'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
