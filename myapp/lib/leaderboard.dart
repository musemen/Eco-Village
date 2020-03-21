import 'package:flutter/material.dart';


class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Friend Leaderboard - Carbon Levels';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green
      ),
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('1. Cris Mihailescu                                5.10 KG of CO2'),
              trailing: Icon(Icons.public),
            ),
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('2. Elias Aguirre                                    7.21 KG of CO2 '),
              trailing: Icon(Icons.public),
            ),
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('3. Philman Yeung                                9.33 KG of C02'),
              trailing: Icon(Icons.public),
            ),
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('4. Harrison Lee                                  13.22 KOG of C02'),
              trailing: Icon(Icons.public),
            ),
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('5. Musa Mohannad                            20.91 KOG of C02'),
              trailing: Icon(Icons.public),
            ),
            ListTile(
              leading: Icon(Icons.account_circle ),
              title: Text('6. Philman Yeung                               26.11 K0G of C02'),
              trailing: Icon(Icons.public),
            ),
          ],
        ),
      ),
    );
  }
}