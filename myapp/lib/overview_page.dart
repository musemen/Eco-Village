import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'location_page.dart';

class OverviewPage extends StatelessWidget {

  void _pay() {
      InAppPayments.setSquareApplicationId('sq0idp-dso4A6j5-tiWPqvpnnz13g');
      InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel,
      );
    }

  void _cardEntryCancel() {
    // Cancelled card entry
  }

  void _cardEntryComplete() {
      // Success
    }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    Widget transportItem = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16, top: 32),
      child: Row(
        children: [
          Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (Icon(Icons.select_all)),
            color: Colors.red[500],
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4, left: 25),
                  child: Text(
                    'Transportation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Find out what impact your travels have',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget purchasesItem = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      child: Row(
        children: [
          FavoriteWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4, left: 25),
                  child: Text(
                    'Purchases',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Dive deeper into your consumption habits',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget energyItem = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      child: Row(
        children: [
          FavoriteWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4, left: 25),
                  child: Text(
                    'Energy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Related to heating, electricity, gas, etc.',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Column(
      children: <Widget>[
        Text('\$13.65',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
        ),
        Text('or 10.26 KG of CO2',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 25),
        ),
        Text(""),
      ]
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: ListView(
            children: [
              Image.asset(
                'images/ecovillage-logo-standard-quality.png',
                height: 80,
                fit: BoxFit.cover,
              ),
              textSection,
              Image.asset(
                'images/House.png',
                height: 250,
                fit: BoxFit.contain,
              ), 
              transportItem,
              purchasesItem,
              energyItem,
              //buttonSection,
            ], 
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: _pay,
            tooltip: 'Payment',
            child: Icon(Icons.payment),
          ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  //int _favoriteCount = 41;
  // ···
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.select_all) : Icon(Icons.check)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        // SizedBox(
        //   width: 18,
        //   child: Container(
        //     child: Text('$_favoriteCount'),
        //   ),
        // ),
      ],
    );
  }
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      //_favoriteCount -= 1;
      _isFavorited = false;
    } else {
      //_favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
        LocationPage()
      ),
    );
  }
}