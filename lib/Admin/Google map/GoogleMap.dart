// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:developer';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:geocoding/geocoding.dart';

class MapAddress extends StatefulWidget {
  const MapAddress({Key? key}) : super(key: key);

  @override
  _MapAddressState createState() => _MapAddressState();
}

class _MapAddressState extends State<MapAddress> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(21.1702, 72.8311), zoom: 14);
  late CameraPosition cameraPosition;
  Set<Marker> markers = {};
  String location = "Location Name:";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
            onCameraMove: (Position) {
              cameraPosition = Position;
            },
            onCameraIdle: () async {
              List<Placemark> placemark = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude);
              setState(() {
                location = placemark.first.street.toString() +
                    ", " +
                    placemark.first.subLocality.toString() +
                    ", " +
                    placemark.first.thoroughfare.toString() +
                    ", " +
                    placemark.first.name.toString() +
                    ", " +
                    placemark.first.administrativeArea.toString() +
                    ", " +
                    placemark.first.postalCode.toString() +
                    ", " +
                    placemark.first.country.toString();
              });
            },
          ),
          Center(child: Icon(Icons.location_on, size: 30)),
          Positioned(
            bottom: 100,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListTile(
                    leading: TextButton(
                      child: Text("ok", style: TextStyle(color: rPrimarycolor)),
                      onPressed: () {
                        Navigator.pop(context, location);
                      },
                    ),
                    title: Text(location, style: TextStyle(fontSize: 18)),
                    dense: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
