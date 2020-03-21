import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';


class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  double metersToKilometers = 1000;
  double carbonConverter = 0.13;
  double distanceCounter = 0;
  Position _currentPosition;
  Position _lastKnownPosition;
  Placemark _vancouver;
  Placemark _burnaby;
  Placemark _pointGreyCountryClub;
  Placemark _oakridgeCentre;
  Placemark _swanguardStadium;
  String _currentAddress;
  double _totalDistance = 0;
  String _locationName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Run Simulation"),
              onPressed: () {
                _runSimulation();
              },
            ),
            Text((_totalDistance * carbonConverter).toStringAsFixed(2)),
            Text(_locationName)
            // FlatButton(
            //   child: Text("Get location"),
            //   onPressed: () {       
            //     _getCurrentLocation();
            //   },  
            // ),
            // FlatButton(
            //   child: Text("Get last known location"),
            //   onPressed: () {
            //     _getLastKnownPosition();
            //   },
            // ) 
            // if (_currentPosition != null)
            //   Text(
            //       "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            // if (_lastKnownPosition != null)
            // Text(
            //     "LAT: ${_lastKnownPosition.latitude}, LNG: ${_lastKnownPosition.longitude}"),
            
          ],
        ),
      ),
    );
  }
 _getVancouver() async {
     List<Placemark> placemark = await Geolocator().placemarkFromAddress("6085 Thunderbird Blvd, Vancouver");//.placemarkFromCoordinates(49.2827, 123.1207);
     Placemark place = placemark[0];
     setState(() {
       _vancouver = place;
            // "${place.locality}, ${place.postalCode}, ${place.country}";
     });
     print(_vancouver.name);
 }
 _getPointGreyCountryClub() async {
    List<Placemark> placemark = await Geolocator().placemarkFromAddress("3350 SW Marine Dr, Vancouver");
    Placemark place = placemark[0];
     setState(() {
       _pointGreyCountryClub = place;
            // "${place.locality}, ${place.postalCode}, ${place.country}";
     });
    print(_pointGreyCountryClub.name); 
 }
 _getOakridgeCentre() async {
    List<Placemark> placemark = await Geolocator().placemarkFromAddress("650 W 41st Ave, Vancouver");
    Placemark place = placemark[0];
     setState(() {
       _oakridgeCentre = place;
            // "${place.locality}, ${place.postalCode}, ${place.country}";
     });
    print(_oakridgeCentre.name); 
 }
 _getSwanguard() async {
     List<Placemark> placemark = await Geolocator().placemarkFromAddress("3883 Imperial Street, Burnaby");//.placemarkFromCoordinates(49.2488, 122.9805);
     Placemark place = placemark[0];
     setState(() {
       _swanguardStadium = place;
            // "${place.locality}, ${place.postalCode}, ${place.country}";
     });
    print(_swanguardStadium.name);
 }
 _getBurnaby() async {
     List<Placemark> placemark = await Geolocator().placemarkFromAddress("4700 Kingsway, Burnaby");//.placemarkFromCoordinates(49.2488, 122.9805);
     Placemark place = placemark[0];
     setState(() {
       _burnaby = place;
            // "${place.locality}, ${place.postalCode}, ${place.country}";
     });
    print(_burnaby.name);  
 }
_getDifference(Placemark placemarkOne, Placemark placemarkTwo) async {
     await Future.delayed(const Duration(seconds:1), () async {
        double distanceInMeters = await Geolocator().distanceBetween(placemarkOne.position.latitude, placemarkOne.position.longitude, placemarkTwo.position.latitude, placemarkTwo.position.longitude);
        setState(() {
          _totalDistance = _totalDistance + distanceInMeters/metersToKilometers;
          // print(distanceInMeters.toString()); 
          _locationName += placemarkOne.name + "\n"; 
          print(placemarkOne.name + placemarkTwo.name);        
        });
     });    
}
 _runSimulation() async {
    await _getVancouver();
    await _getPointGreyCountryClub();
    await _getOakridgeCentre();
    await _getSwanguard();
    await _getBurnaby();
    await _getDifference(_vancouver, _pointGreyCountryClub);
    await _getDifference(_pointGreyCountryClub, _oakridgeCentre);
    await _getDifference(_oakridgeCentre, _swanguardStadium);
    await _getDifference(_swanguardStadium, _burnaby);
    _locationName += _burnaby.name;
 }
 _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
            // _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }
_getLastKnownPosition() {
  geolocator
      .getLastKnownPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    setState(() {
      _lastKnownPosition = position;
    });
  }).catchError((e) {
    print(e);
  });
}
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}