import 'package:flutter/material.dart';
import 'package:myapp/chart_page.dart';
import 'package:myapp/location_page.dart';
import 'chart_page.dart';
import 'overview_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'leaderboard.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
   int _currentIndex = 0;
 final List<Widget> _children = [
   OverviewPage(),
   ChartPage(),
   Leaderboard(),
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
    //  backgroundColor: PrimaryColor,
     appBar: AppBar(
       title: Text('Overview'),
       
       elevation: 0,
       titleSpacing: 0,
     ),
     body: _children[_currentIndex], // new
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Overview'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.insert_chart),
           title: Text('Weekly Report'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.supervisor_account),
           title: Text('Leaderboard')
         )
       ],
     ),
   );
 }

 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}