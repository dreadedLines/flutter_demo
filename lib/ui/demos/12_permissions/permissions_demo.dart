import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionsDemo extends StatefulWidget {
  const PermissionsDemo({super.key});

  @override
  State<PermissionsDemo> createState() => _PermissionsDemoState();
}

class _PermissionsDemoState extends State<PermissionsDemo> {
  String _message = '';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _message = "Disabled. Please make sure GPS is turned on";
      });
      return;
    } 
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // ask for permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _message = "GPS permission was denied";
        });
        return;
      }
    } else if (permission == LocationPermission.deniedForever) {
      setState(() {
        _message = "GPS permission is denied forever. Please turn it on in app's permissions";
      });
      return;
    }
    // check if GPS is on
    setState(() {
      _message = "...fetching coordinates...";
    });

    final = position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Permissions demo"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_pin),
            Text("Give me location permission"),
            OutlinedButton(onPressed:  _getCurrentLocation, child: Text("Find My Location"))
          ],
        ),
      ),
    );
  }
}