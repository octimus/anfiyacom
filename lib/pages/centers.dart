import 'dart:convert';

import 'package:anfiyacom/services/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Centers extends StatefulWidget {
  @override
  _CentersState createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  LatLng _position = LatLng(-11.7280609, 43.2432578);
  Set<Marker> _markers = Set.from([]);
  BitmapDescriptor pinLocationIcon;
  CovidData covid = CovidData();

  @override
  void initState() {
    super.initState();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/hospital.png');
  }

  @override
  Widget build(BuildContext context) {
    // Position myPosition = this._determinePosition();
    this.covid.getCenters().then((value) {
      List<dynamic> json = jsonDecode(value.body);
      json.forEach((element) {
        print(element);
        LatLng lL = LatLng(double.parse(element["latitude"]),
            double.parse(element["longitude"]));
        _addMarker(lL, element["batiment"], null, element["id_centre"]);
      });
    });
    return Container(
      child: GoogleMap(
        myLocationButtonEnabled: true,
        markers: _markers,
        myLocationEnabled: true,
        onTap: (pos) => {_addMarker(pos)},
        onMapCreated: (controller) {
          _determinePosition().then((value) {
            print(value);

            setState(() {
              _position = new LatLng(value.latitude, value.longitude);
            });
            _addMarker(_position);
            controller.moveCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: _position, zoom: 14.4)));
          });
        },
        initialCameraPosition: CameraPosition(target: _position, zoom: 10.4746),
      ),
    );
  }

  void _addMarker(LatLng point, [String snipet, icon, uid, Function callback]) {
    Marker marker = Marker(
      markerId: MarkerId(uid.toString()),
      onTap: () => {},
      position: point,
      infoWindow: InfoWindow(title: "Centre de dépistage", snippet: snipet),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
