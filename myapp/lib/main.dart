import 'package:flutter/material.dart';
import 'navigation.dart';
import 'overview_page.dart';

void main() => runApp(App());

const PrimaryColor = const Color(0xFF228B22);

// const PrimaryColor = const Color(0xFF000000);

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Carbon Offset',
     theme: ThemeData(
        primaryColor: PrimaryColor,
        ),
     home: Home(),
    //  overviewPage: FavoriteWidget(),
   );
 }
}

