import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:burnitout2/styling.dart';
import 'package:burnitout2/pages/settings_screen.dart';
import 'package:burnitout2/pages/home_screen.dart';

import 'bmi.dart';



void main() {SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown
]);
runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  final tabs = [BmiScreen(),HomeScreen(),SettingsScreen()];

  PageController pageController = PageController();

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 52,
        backgroundColor: AppTheme.appBackgroundColor,
        items: <Widget>[
          Image.asset("assets/images/bmi.png",height: 20,width: 20,),
          Icon(Icons.home, size: 20),
        Icon(Icons.info, size: 20),
        ],
        color: AppTheme.topBarBackgroundColor,
        buttonBackgroundColor: AppTheme.topBarBackgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}
