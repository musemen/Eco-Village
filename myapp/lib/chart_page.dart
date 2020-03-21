import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

@override
  Widget build(BuildContext context) {

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: ListView(
            children: [
              Image.asset(
                'images/ChartGo.png',
                height: 625,
                fit: BoxFit.cover,
              )
            ], 
        ),
      ),
    );
  }
}
